import 'package:flutter/material.dart';

import 'package:overlay_support/overlay_support.dart';

class OverlayService {
  void showNotification(String message) {
    showSimpleNotification(Text(message));
  }

  void showToast(String message) {
    toast(message);
  }
}
