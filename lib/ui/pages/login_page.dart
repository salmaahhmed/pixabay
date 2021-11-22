import 'package:flutter/material.dart';
import 'package:pixabay_task/ui/extensions/string_extensions.dart';
import 'package:pixabay_task/ui/pages/home_page.dart';
import 'package:pixabay_task/ui/theme.dart';
import 'package:pixabay_task/ui/widgets/custom_primary_button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool passwordVisible = false;
  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24.0, 40.0, 24.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login to your\naccount',
                    style: heading2.copyWith(color: textBlack),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              SizedBox(
                height: 48,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: textWhiteGrey,
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: TextFormField(
                        validator: (input) {
                          if (input != null) {
                            return input.isValidEmail()
                                ? null
                                : "Incorrect Email!";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: heading6.copyWith(color: textGrey),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: textWhiteGrey,
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: TextFormField(
                        obscureText: !passwordVisible,
                        validator: (password) {
                          if (password != null) {
                            if (password.length < 8)
                              return "Password must be 8 characters long!";
                            if (!password.contains(RegExp(r"[a-z]")))
                              return "Password must containt lower case character!";
                            if (!password.contains(RegExp(r"[A-Z]")))
                              return "Password must containt upper case character!";
                            if (!password.contains(RegExp(r"[0-9]")))
                              return "Password must containt a number!";
                            if (!password
                                .contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')))
                              return "Password must containt a special character!";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: heading6.copyWith(color: textGrey),
                          suffixIcon: IconButton(
                            color: textGrey,
                            splashRadius: 1,
                            icon: Icon(passwordVisible
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined),
                            onPressed: togglePassword,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 32,
              ),
              SizedBox(
                height: 32,
              ),
              CustomPrimaryButton(
                buttonColor: primaryBlue,
                textValue: 'Login',
                textColor: Colors.white,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (ctx) => HomePage()));
                  }
                },
              ),
              SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
