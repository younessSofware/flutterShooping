import 'dart:convert';

import 'package:first_app/_shared/widgets/loading_widget.dart';
import 'package:first_app/screens/home.dart';
import 'package:first_app/screens/register_screen.dart';
import 'package:first_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:first_app/_shared/themes/colors.dart';
import 'package:first_app/_shared/themes/text_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:job_me/_shared/themes/colors.dart';
// import 'package:job_me/_shared/themes/text_styles.dart';
final _formKey = GlobalKey<FormState>();
bool isSecure = true;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? isNameValid(String? name) {
    if (name != null && name.isNotEmpty) {
      return null;
    } else {
      return 'enter_valid_name';
    }
  }

  String? isPasswordValid(String? password) {
    if (password != null && password.isNotEmpty) {
      return null;
    } else {
      return 'enter_valid_password';
    }
  }

  var preferences;
  init() async {
    try {
      // ignore: invalid_use_of_visible_for_testing_member
      // SharedPreferences.setMockInitialValues({});
      preferences = await SharedPreferences.getInstance();
      print(await preferences.getString('user'));
      if (await preferences.getString('user') != null) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const HomeScreen()));
      }
    } catch (e) {
      print(57);
      print(e);
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    init();
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
                  child: Text('Please entre sign in info',
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
                  key: _formKey,
                  child: ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: [
                        const SizedBox(height: 80.0),
                        TextFormField(
                          cursorColor: AppColors.primary,
                          validator: isNameValid,
                          controller: usernameController,
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
                          controller: passwordController,
                          cursorColor: AppColors.primary,
                          obscureText: isSecure ? true : false,
                          validator: isPasswordValid,
                          decoration: InputDecoration(
                            isDense: true,
                            suffixIconConstraints: const BoxConstraints(
                              minWidth: 2,
                              minHeight: 2,
                            ),
                            suffixIcon: InkWell(
                                child: Icon(
                                    isSecure
                                        ? Icons.remove_red_eye_outlined
                                        : Icons.visibility_off_outlined,
                                    size: 20),
                                onTap: () {
                                  setState(() {
                                    isSecure = !isSecure;
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
                        const SizedBox(height: 80.0),
                        if (loading)
                          const LoadingWidget()
                        else
                          SizedBox(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: () => {
                                      if (_formKey.currentState?.validate() ==
                                          true)
                                        {login()}
                                    },
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Text(
                                    'Login',
                                    style: AppTextStyles.primaryButton,
                                  ),
                                )),
                          ),
                        const SizedBox(height: 40.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text('i dont have an account',
                                style: AppTextStyles.bodyNormal),
                            const SizedBox(width: 5),
                            GestureDetector(
                              onTap: () => {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterScreen()))
                              },
                              child: Text('create new now',
                                  style: AppTextStyles.bodyNormal
                                      .copyWith(color: Colors.yellow[700])),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30.0),
                        // ignore: prefer_const_constructors
                        Center(
                          child: Text('Continue as geuest',
                              style: AppTextStyles.bodyNormal
                                  .copyWith(color: AppColors.primary)),
                        ),
                        const SizedBox(height: 40.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: InkWell(
                                child: Padding(
                                  padding: const EdgeInsets.all(6),
                                  child: Card(
                                    // color: Color(0xFF397AF3),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                          height: 30,
                                          width: 30,
                                          child:
                                              Image.asset("images/google.jpg")),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: InkWell(
                                child: Padding(
                                  padding: const EdgeInsets.all(6),
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                          height: 30,
                                          width: 30,
                                          child: Image.asset(
                                              "images/facebook.png")),
                                    ),
                                  ),
                                ),
                              ),
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
  }

  login() {
    setState(() {
      loading = true;
    });
    Map response;
    User user = User();
    user.username = usernameController.value.text;
    user.password = passwordController.value.text;
    user
        .login()
        .then((value) async => {
              print(value.statusCode),
              setState(() {
                loading = false;
              }),
              if (value.statusCode == 200 || value.statusCode == 201)
                {
                  response = jsonDecode(value.body),
                  user.init(response['Result']),
                  saveDataToStorage(user),
                }
              else if (value.statusCode == 400)
                {showErrorSnackBar(value.body)}
            })
        .then((value) => {
              setState(() {
                loading = false;
              })
            });
  }

  Future<void> saveDataToStorage(User user) async {
    try {
      // ignore: invalid_use_of_visible_for_testing_member
      SharedPreferences.setMockInitialValues({});

      var preferences = await SharedPreferences.getInstance();
      await preferences.setString('user', json.encode(user.toJson()));
      // ignore: use_build_context_synchronously
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const HomeScreen()));
    } catch (e) {
      print(e);
    }
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
              error,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.primaryDark,
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
