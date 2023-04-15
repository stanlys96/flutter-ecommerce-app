import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> displayTextInputDialog(
    BuildContext context,
    TextEditingController _textFieldController,
    int stock,
    String name,
    Future<bool> Function(String stock) callback) async {
  final GlobalKey flushBarKey = GlobalKey();
  bool isLoading = false;

  void setIsLoading(bool newValue, StateSetter setState) {
    setState(() {
      isLoading = newValue;
    });
  }

  bool canPress = true;

  return showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(builder: (secondContext, StateSetter setState) {
        return AlertDialog(
          title: Text('Enter amount'),
          content: TextField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              FilteringTextInputFormatter.digitsOnly
            ],
            onChanged: (value) {},
            controller: _textFieldController,
            decoration: InputDecoration(
              hintText: "Amount",
              isDense: true,
            ),
          ),
          actions: <Widget>[
            MaterialButton(
              color: Colors.red,
              textColor: Colors.white,
              child: const Text('CANCEL'),
              onPressed: () {
                _textFieldController.clear();
                Flushbar? flushbar = flushBarKey.currentWidget as Flushbar?;
                if (flushbar != null) {
                  flushbar.dismiss();
                }
                Navigator.pop(context);
              },
            ),
            MaterialButton(
              color: Colors.black,
              textColor: Colors.white,
              child: !isLoading
                  ? const Text(
                      'OK',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  : SizedBox(
                      width: 15,
                      height: 15,
                      child: CircularProgressIndicator(),
                    ),
              onPressed: () async {
                if (!canPress) return;
                canPress = false;
                String total = _textFieldController.text;
                String title = "";
                String message = "";
                setIsLoading(true, setState);
                try {
                  Flushbar? flushbar = flushBarKey.currentWidget as Flushbar?;
                  if (flushbar != null) {
                    flushbar.dismiss();
                  }

                  if ((int.tryParse(total) ?? 0) > stock) {
                    title = 'Exceeds';
                    message = 'The amount you input exceeds the stock we have';
                  } else if (total == "" || (int.tryParse(total) ?? 0) <= 0) {
                    title = 'Invalid';
                    message = 'Invalid input';
                  } else {
                    bool result = await callback(total);
                    if (result) {
                      title = 'Success!';
                      message = "$total $name added to your cart!";
                      _textFieldController.clear();
                      Navigator.pop(context);
                    } else {
                      print(result);
                      title = 'WALAO EH';
                      message = "WALAO!!!";
                    }
                  }
                  setIsLoading(false, setState);
                  await Flushbar(
                    key: flushBarKey,
                    flushbarPosition: FlushbarPosition.TOP,
                    title: title,
                    message: message,
                    duration: const Duration(milliseconds: 1500),
                    backgroundColor:
                        title == 'Success!' ? Colors.green : Colors.red,
                  ).show(context);
                  Future.delayed(Duration(milliseconds: 1500), () {
                    canPress = true;
                  });
                } catch (e) {
                  setIsLoading(false, setState);
                  print(e);
                }
              },
            ),
          ],
        );
      });
    },
  );
}
