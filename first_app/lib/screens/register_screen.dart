import 'dart:convert';

import 'package:first_app/_shared/themes/colors.dart';
import 'package:first_app/_shared/themes/text_styles.dart';
import 'package:first_app/_shared/widgets/loading_widget.dart';
import 'package:first_app/screens/login_screen.dart';
import 'package:first_app/models/user.dart';
import 'package:flutter/material.dart';

final _formKey1 = GlobalKey<FormState>();
bool isSecure1 = true;
bool isSecure2 = true;
bool isTermsAndConditionsConfirmed = true;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var user = User();
  bool loading = false;
  TextEditingController fullnameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: AppColors.primary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(children: [
                const SizedBox(height: 120),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'Welcome !',
                    style: AppTextStyles.headerHuge,
                  ),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text('Create your account easly',
                      style: AppTextStyles.headerSemiBold),
                )
              ]),
              const SizedBox(height: 120.0),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40)),
                  color: Colors.white,
                ),
                child: Form(
                  key: _formKey1,
                  child: ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: [
                        const SizedBox(height: 80.0),
                        TextFormField(
                          controller: usernameController,
                          cursorColor: AppColors.primary,
                          decoration: InputDecoration(
                            hintText: 'Entrer username',
                            hintStyle: AppTextStyles.hint
                                .copyWith(color: AppColors.darkGrey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.grey, width: 1)),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.grey, width: 1)),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.grey, width: 1)),
                          ),
                        ),
                        const SizedBox(height: 40.0),
                        TextFormField(
                          controller: fullnameController,
                          cursorColor: AppColors.primary,
                          decoration: InputDecoration(
                            hintText: 'Entrer full name',
                            hintStyle: AppTextStyles.hint
                                .copyWith(color: AppColors.darkGrey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.grey, width: 1)),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.grey, width: 1)),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.grey, width: 1)),
                          ),
                        ),
                        const SizedBox(height: 40.0),
                        TextFormField(
                          controller: emailController,
                          cursorColor: AppColors.primary,
                          decoration: InputDecoration(
                            hintText: 'Entrer email',
                            hintStyle: AppTextStyles.hint
                                .copyWith(color: AppColors.darkGrey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.grey, width: 1)),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.grey, width: 1)),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.grey, width: 1)),
                          ),
                        ),
                        const SizedBox(height: 40.0),
                        TextFormField(
                          controller: passwordController,
                          cursorColor: AppColors.primary,
                          obscureText: isSecure1,
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                                child: Icon(
                                    isSecure1
                                        ? Icons.remove_red_eye_outlined
                                        : Icons.visibility_off_outlined,
                                    size: 20),
                                onTap: () {
                                  setState(() {
                                    isSecure1 = !isSecure1;
                                  });
                                }),
                            hintText: 'Entrer password',
                            hintStyle: AppTextStyles.hint
                                .copyWith(color: AppColors.darkGrey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.grey, width: 1)),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.grey, width: 1)),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.grey, width: 1)),
                          ),
                        ),
                        const SizedBox(height: 40.0),
                        TextFormField(
                          controller: passwordConfirmationController,
                          cursorColor: AppColors.primary,
                          obscureText: isSecure2,
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                                child: Icon(
                                    isSecure2
                                        ? Icons.remove_red_eye_outlined
                                        : Icons.visibility_off_outlined,
                                    size: 20),
                                onTap: () {
                                  setState(() {
                                    isSecure2 = !isSecure2;
                                  });
                                }),
                            hintText: 'Entrer password confirmation',
                            hintStyle: AppTextStyles.hint
                                .copyWith(color: AppColors.darkGrey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.grey, width: 1)),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.grey, width: 1)),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.grey, width: 1)),
                          ),
                        ),
                        const SizedBox(height: 80.0),
                        if (!loading)
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () => {
                              if (_formKey1.currentState?.validate() == true)
                                {_formKey1.currentState?.save(), register()}
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Text(
                                'Register',
                                style: AppTextStyles.primaryButton,
                              ),
                            ),
                          )
                        else
                          const LoadingWidget(),
                        const SizedBox(height: 40.0),
                        Row(
                          children: [
                            Checkbox(
                              value: isTermsAndConditionsConfirmed,
                              onChanged: (_) {
                                setState(() {
                                  isTermsAndConditionsConfirmed =
                                      !isTermsAndConditionsConfirmed;
                                });
                              },
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) => AppColors.grey),
                            ),
                            GestureDetector(
                              onTap: () => {},
                              child: Row(
                                children: [
                                  Text(
                                    'agree_to',
                                    style: AppTextStyles.bodyNormal,
                                  ),
                                  Text('terms_and_conditions',
                                      style: AppTextStyles.bodyNormal),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text('i have an account',
                                style: AppTextStyles.bodyNormal),
                            const SizedBox(width: 5),
                            GestureDetector(
                              onTap: () => {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const LoginScreen()))
                              },
                              child: Text('sign in here',
                                  style: AppTextStyles.bodyNormal
                                      .copyWith(color: Colors.yellow[700])),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40.0),
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
    ;
  }

  register() {
    if (!isTermsAndConditionsConfirmed) {
      showErrorSnackBar(['need to accept terms']);
      return;
    }

    setState(() {
      loading = true;
    });
    user.username = usernameController.value.text;
    user.email = emailController.value.text;
    user.fullname = fullnameController.value.text;
    user.password = passwordController.value.text;
    user.passwordConfirmation = passwordConfirmationController.value.text;
    Map response;
    user
        .saveUser()
        .then((res) => {
              setState(() {
                loading = false;
              }),
              if (res.statusCode == 400)
                {
                  response = jsonDecode(res.body),
                  showErrorSnackBar(response[response.keys.toList().first])
                }
            })
        .onError((error, stackTrace) => {
              setState(() {
                loading = false;
              })
            });
  }

  void showErrorSnackBar(error) {
    final snackBar = SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.error_outline, size: 32, color: AppColors.white),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              error[0],
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.primaryDark,
      duration: const Duration(seconds: 4),
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
