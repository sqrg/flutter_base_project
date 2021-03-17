import 'package:flutter/material.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

class ConfirmationRequest {
  final AlertType type;
  final String title;
  final String desc;
  final String positiveButtonText;
  final String negativeButtonText;
  final Color positiveButtonTextColor;
  final Color negativeButtonTextColor;
  final Color positiveButtonBackgroundColor;
  final Color negativeButtonBackgroundColor;

  ConfirmationRequest(
    this.type, {
    this.title,
    this.desc,
    this.positiveButtonText,
    this.negativeButtonText,
    this.positiveButtonTextColor,
    this.negativeButtonTextColor,
    this.positiveButtonBackgroundColor,
    this.negativeButtonBackgroundColor,
  });
}
