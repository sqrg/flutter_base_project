import 'package:flutter/material.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

import 'package:flutter_base_project/app.locator.dart';

import 'package:flutter_base_project/core/models/core/alert_request.dart';
import 'package:flutter_base_project/core/models/core/confirmation_request.dart';
import 'package:flutter_base_project/core/models/core/confirmation_response.dart';
import 'package:flutter_base_project/core/services/dialog_service.dart';

class DialogManager extends StatefulWidget {
  final Widget child;
  DialogManager({Key key, this.child}) : super(key: key);
  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  DialogService _dialogService = locator<DialogService>();
  @override
  void initState() {
    super.initState();
    _dialogService.registerAlertDialogListener(_showAlertDialog);
    _dialogService.registerConfirmationDialogListener(_showConfirmationDialog);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _showAlertDialog(AlertRequest request) {
    Alert(
      context: context,
      type: request.type,
      title: request.title ?? '',
      desc: request.desc ?? '',
      buttons: [
        DialogButton(
          child: Text(
            request.okButtonText ?? 'OK',
            style: TextStyle(
              color: request.okButtonTextColor ?? Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          color: request.okButtonBackgroundColor ?? Colors.white,
          onPressed: () {
            _dialogService.alertComplete();
            Navigator.of(context).pop();
          },
        )
      ],
      style: AlertStyle(
        isCloseButton: false,
        animationType: AnimationType.grow,
        overlayColor: Color.fromRGBO(0, 0, 0, 0.5),
      ),
    ).show();
  }

  void _showConfirmationDialog(ConfirmationRequest request) {
    Alert(
      context: context,
      type: request.type,
      title: request.title ?? '',
      desc: request.desc ?? '',
      buttons: [
        DialogButton(
          child: Text(
            request.positiveButtonText ?? 'Yes',
            style: TextStyle(
              color: request.positiveButtonTextColor ?? Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          color: request.positiveButtonBackgroundColor ?? Colors.green,
          onPressed: () {
            _dialogService.confirmationComplete(ConfirmationResponse(confirmed: true));
            Navigator.of(context).pop();
          },
        ),
        DialogButton(
          child: Text(
            request.negativeButtonText ?? 'No',
            style: TextStyle(
              color: request.negativeButtonTextColor ?? Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          color: request.negativeButtonBackgroundColor ?? Colors.red,
          onPressed: () {
            _dialogService.confirmationComplete(ConfirmationResponse(confirmed: false));
            Navigator.of(context).pop();
          },
        )
      ],
      style: AlertStyle(
        isOverlayTapDismiss: false,
        isCloseButton: false,
        animationType: AnimationType.grow,
        overlayColor: Color.fromRGBO(0, 0, 0, 0.5),
      ),
    ).show();
  }
}
