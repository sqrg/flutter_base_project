import 'package:flutter/material.dart';

import 'package:stacked_services/stacked_services.dart';

class OkDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const OkDialog({Key key, this.request, this.completer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseAlertDialog(
      request: request,
      completer: completer,
      icon: Icons.check_circle_outlined,
      color: Colors.green,
    );
  }
}

class KoDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const KoDialog({Key key, this.request, this.completer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseAlertDialog(
      request: request,
      completer: completer,
      icon: Icons.cancel_outlined,
      color: Colors.red,
    );
  }
}

class BaseAlertDialog extends StatelessWidget {
  const BaseAlertDialog({
    Key key,
    @required this.request,
    @required this.completer,
    @required this.icon,
    @required this.color,
  }) : super(key: key);

  final DialogRequest request;
  final Function(DialogResponse response) completer;
  final IconData icon;
  final MaterialColor color;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              icon,
              color: color,
              size: 100,
            ),
            Text(
              request.title ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                request.description ?? '',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ),
            GestureDetector(
              onTap: () => completer(DialogResponse(confirmed: true)),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  request.mainButtonTitle ?? 'OK',
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
