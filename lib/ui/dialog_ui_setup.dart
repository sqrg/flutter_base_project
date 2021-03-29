import 'package:stacked_services/stacked_services.dart';

import 'package:flutter_base_project/app.locator.dart';

import 'package:flutter_base_project/core/enums/dialog_type.dart';

import 'package:flutter_base_project/ui/widgets/dialogs/alert_dialog_widgets.dart';
import 'package:flutter_base_project/ui/widgets/dialogs/confirmation_dialog_widget.dart';

void setupDialogUi() {
  DialogService _dialogService = locator<DialogService>();

  final dialogBuilders = {
    DialogType.Ok: (context, request, completer) => OkDialog(
          request: request,
          completer: completer,
        ),
    DialogType.Ko: (context, request, completer) => KoDialog(
          request: request,
          completer: completer,
        ),
    DialogType.Confirmation: (context, request, completer) => ConfirmationDialog(
          request: request,
          completer: completer,
        )
  };

  _dialogService.registerCustomDialogBuilders(dialogBuilders);
}
