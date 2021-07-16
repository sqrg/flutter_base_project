import 'package:flutter/material.dart';

import 'package:stacked_services/stacked_services.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  final DialogRequest request;
  final Function(DialogResponse response) completer;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.info_outlined,
              color: Colors.blue,
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
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () => completer(DialogResponse(confirmed: false)),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      margin: EdgeInsets.only(right: 7.5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        request.secondaryButtonTitle ?? 'CANCEL',
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () => completer(DialogResponse(confirmed: true)),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      margin: EdgeInsets.only(left: 7.5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        request.mainButtonTitle ?? 'OK',
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
