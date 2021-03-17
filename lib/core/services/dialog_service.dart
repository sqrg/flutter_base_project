import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_base_project/core/models/core/confirmation_request.dart';
import 'package:flutter_base_project/core/models/core/confirmation_response.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

import 'package:flutter_base_project/core/models/core/alert_request.dart';

class DialogService {
  Function(AlertRequest) _showAlertDialogListener;
  Function(ConfirmationRequest) _showConfirmationDialogListener;

  Completer _showAlertDialogCompleter;
  Completer<ConfirmationResponse> _showConfirmationDialogCompleter;

  void registerAlertDialogListener(Function(AlertRequest) showAlertDialogListener) {
    _showAlertDialogListener = showAlertDialogListener;
  }

  void registerConfirmationDialogListener(Function(ConfirmationRequest) showConfirmationDialogListener) {
    _showConfirmationDialogListener = showConfirmationDialogListener;
  }

  Future showOkDialog({
    String title,
    String desc,
    String okButtonText,
  }) {
    _showAlertDialogCompleter = Completer();
    _showAlertDialogListener(AlertRequest(
      AlertType.success,
      title: title,
      desc: desc,
      okButtonText: okButtonText,
      okButtonTextColor: Colors.white,
      okButtonBackgroundColor: Colors.green,
    ));
    return _showAlertDialogCompleter.future;
  }

  Future showKoDialog({
    String title,
    String desc,
    String okButtonText,
  }) {
    _showAlertDialogCompleter = Completer();
    _showAlertDialogListener(AlertRequest(
      AlertType.error,
      title: title,
      desc: desc,
      okButtonText: okButtonText,
      okButtonTextColor: Colors.white,
      okButtonBackgroundColor: Colors.red,
    ));
    return _showAlertDialogCompleter.future;
  }

  Future<ConfirmationResponse> showConfirmationDialog({
    String title,
    String desc,
    String positiveButtonText,
    String negativeButtonText,
  }) {
    _showConfirmationDialogCompleter = Completer<ConfirmationResponse>();
    _showConfirmationDialogListener(ConfirmationRequest(
      AlertType.info,
      title: title,
      desc: desc,
      positiveButtonText: positiveButtonText,
      negativeButtonText: negativeButtonText,
    ));
    return _showConfirmationDialogCompleter.future;
  }

  void alertComplete() {
    _showAlertDialogCompleter.complete();
    _showAlertDialogCompleter = null;
  }

  void confirmationComplete(ConfirmationResponse response) {
    _showConfirmationDialogCompleter.complete(response);
    _showConfirmationDialogCompleter = null;
  }
}
