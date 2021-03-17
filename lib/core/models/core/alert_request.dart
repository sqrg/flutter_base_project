import 'package:flutter/material.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

class AlertRequest {
  final AlertType type;
  final String title;
  final String desc;
  final String okButtonText;
  final Color okButtonTextColor;
  final Color okButtonBackgroundColor;

  AlertRequest(
    this.type, {
    this.title,
    this.desc,
    this.okButtonText,
    this.okButtonTextColor,
    this.okButtonBackgroundColor,
  });
}
