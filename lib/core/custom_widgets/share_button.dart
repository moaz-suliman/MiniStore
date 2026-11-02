import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:small_shop/core/app_state/app_state.dart';
import 'package:small_shop/core/colors.dart';
import 'package:small_shop/feature/auth/logIn/presintation/provider/login_provider.dart';

class ShareButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const ShareButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context, value, child) {
      return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child:value.state== AppState.load
            ? Container(child: CircularProgressIndicator(color: Colors.white,),)
            : Text(
                text,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontFamily: 'mmmm',
                  fontWeight: FontWeight.w500,
                ),
              ),
      ),
    );
    },);
  }

}
