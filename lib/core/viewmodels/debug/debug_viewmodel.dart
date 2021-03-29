import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'package:flutter_base_project/app.locator.dart';
import 'package:flutter_base_project/core/enums/dialog_type.dart';

class DebugViewModel extends BaseViewModel {
  DialogService _dialogService = locator<DialogService>();

  ThemeService _themeService = locator<ThemeService>();

  Future showDialog1() async {
    await _dialogService.showCustomDialog(variant: DialogType.Ok, title: 'Success');
  }

  Future showDialog2() async {
    await _dialogService.showCustomDialog(variant: DialogType.Ko, title: 'Error');
  }

  Future showConfirmation() async {
    var confirmationResult = await _dialogService.showCustomDialog(variant: DialogType.Confirmation, title: 'Confirmation');
  }

  void toggleTheme() {
    _themeService.toggleDarkLightTheme();

    notifyListeners();
  }
}
