import 'package:stacked/stacked.dart';

import 'package:flutter_base_project/app.locator.dart';

import 'package:flutter_base_project/core/services/dialog_service.dart';

class DebugViewModel extends BaseViewModel {
  DialogService _dialogService = locator<DialogService>();

  Future showDialog1() async {
    await _dialogService.showOkDialog();
  }

  Future showDialog2() async {
    await _dialogService.showKoDialog();
  }

  Future showConfirmation() async {
    var confirmationResult = await _dialogService.showConfirmationDialog();

    bool isConfirmed = confirmationResult.confirmed;
  }
}