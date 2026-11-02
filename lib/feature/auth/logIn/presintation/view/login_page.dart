import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:small_shop/core/app_state/app_state.dart';
import 'package:small_shop/core/colors.dart';
import 'package:small_shop/core/custom_widgets/share_button.dart';
import 'package:small_shop/core/custom_widgets/text_field_widget.dart';
import 'package:small_shop/feature/auth/logIn/presintation/provider/login_provider.dart';
import 'package:small_shop/feature/auth/logIn/presintation/widget/bag_logo.dart';
import 'package:small_shop/feature/auth/signIn/presintation/view/signIn_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
TextEditingController userNameController = TextEditingController(text: 'emilys');
  TextEditingController passwordController = TextEditingController(text: 'emilyspass');
  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        elevation: 3,
        backgroundColor: AppColor.backgroundColor,
        surfaceTintColor: Colors.transparent,
        shadowColor: AppColor.cardColor,
        title: Text(
          'Log in screen',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            fontFamily: 'mmmm',
            color: AppColor.textColor,
          ),
        ),
      ),
      body:Consumer<LoginProvider>(builder: (context, value, child) {
       return Padding(
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BagLogo(),
            const SizedBox(height: 16),
            Text(
              'Welcom back',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                fontFamily: 'mmmm',
                color: AppColor.textColor,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'sign in to continue',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                fontFamily: 'mmmm',
                color: AppColor.subtitleColor,
              ),
            ),

            const SizedBox(height: 16),
            TextFieldWidget(
              controller: userNameController,
              icon: Icon(Icons.person_2_outlined, color: AppColor.primaryColor),
              hintText: 'moaz',
              labelText: '',
              keyboardType: TextInputType.emailAddress,
            ),
            TextFieldWidget(
              controller: passwordController,
              icon: Icon(Icons.lock_outline, color: AppColor.primaryColor),
              hintText: 'password',
              obscureText: true,
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  color: AppColor.primaryColor,
                  fontFamily: 'mmmm',
                ),
              ),
            ),
            const SizedBox(height: 20),

            ShareButton(
              onPressed: () async {
                //هدف هذه الجملة اذا ضغط المستخدم زر تسجيل الدخول اكثر من مرة لا يعمل اكثر من ريكوست
                if(value.state==AppState.load) return;
                await context.read<LoginProvider>().login(
                  context,
                  userNameController.text,
                  passwordController.text,
                );
              },
              text:value.state==AppState.load? 'loading...':'Log In',
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Dont have an account?',
                  style: TextStyle(
                    fontFamily: 'mmmm',
                    fontWeight: FontWeight.w500,
                    color: AppColor.textColor,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SigninPage()),
                    );
                  },
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      color: AppColor.primaryColor,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      );
      },) 
    );
  }
}
