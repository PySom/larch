import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:lagosarchdiocese/utils/constants.dart';

class LoadingButton extends StatelessWidget {
  final bool isLoading;
  final String text;
  final Function action;
  LoadingButton({
    this.text,
    this.isLoading,
    this.action,
  });

  Widget _spinner(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: 2,
      backgroundColor: Colors.white,
      valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: kButtonColor,
      onPressed: () async {
        try {
          await action();
        } catch (ex) {
          Flushbar(
            backgroundColor: kAccentColor,
            message: ex.toString(),
            duration: Duration(seconds: 3),
            flushbarStyle: FlushbarStyle.GROUNDED,
          ).show(context);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14.0),
        child: isLoading
            ? _spinner(context)
            : Text(
                text,
                style: TextStyle(color: Colors.white),
              ),
      ),
    );
  }
}
