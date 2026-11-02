import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:small_shop/core/colors.dart';
import 'package:small_shop/core/custom_widgets/share_button.dart';
import 'package:small_shop/core/custom_widgets/text_field_widget.dart';
import 'package:small_shop/feature/auth/logIn/presintation/view/login_page.dart';
import 'package:small_shop/feature/auth/signIn/presintation/provider/singUp_provider.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        elevation: 3,
        backgroundColor: AppColor.backgroundColor,
        surfaceTintColor: Colors.transparent,
        shadowColor: AppColor.cardColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Sign  up  screen',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'mmmm',
                color: AppColor.textColor,
              ),
            ),
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.primaryColor,
              ),
              child: Icon(Icons.person, color: AppColor.onPrimaryColor),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 140,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColor.cardColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'mmmm',
                      color: AppColor.textColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Sign up to start browsing our catalog.',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'mmmm',
                      color: AppColor.subtitleColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            TextFieldWidget(
              controller: firstNameController,
              icon: Icon(Icons.person_outline, color: AppColor.primaryColor),
              hintText: 'moaz ahmmed',
              labelText: 'Full name',
            ),

            TextFieldWidget(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              icon: Icon(Icons.email_outlined, color: AppColor.primaryColor),
              hintText: 'moaz@gmail.com',
              labelText: 'Email',
            ),

            TextFieldWidget(
              controller: passwordController,
              obscureText: true,
              icon: Icon(
                Icons.password_outlined,
                color: AppColor.primaryColor,
              ),
              hintText: 'Create password',
              labelText: 'Password',
            ),

            TextFieldWidget(
              obscureText: true,
              icon: Icon(
                Icons.restart_alt_outlined,
                color: AppColor.primaryColor,
              ),
              hintText: 'Re enter password',
              labelText: 'Confirm password',
            ),
            const Spacer(),
            ShareButton(
              text: 'Sign up',
              onPressed: () {
                context.read<SingupProvider>().signUp(
                  context,
                  firstNameController.text,
                  emailController.text,
                  passwordController.text,
                );
                
              },
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
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
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: AppColor.primaryColor,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
