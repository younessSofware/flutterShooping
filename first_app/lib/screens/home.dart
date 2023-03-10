import 'dart:convert';

import 'package:first_app/_shared/themes/colors.dart';
import 'package:first_app/_shared/themes/text_styles.dart';
import 'package:first_app/_shared/widgets/bottom_navigation.dart';
import 'package:first_app/screens/adjob_free.dart';
import 'package:first_app/screens/adjob_special.dart';
import 'package:first_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  var preferences;
  User user = new User();
  init() async {
    try {
      // ignore: invalid_use_of_visible_for_testing_member
      // SharedPreferences.setMockInitialValues({});
      preferences = await SharedPreferences.getInstance();
      var json = jsonDecode(await preferences.getString('user'));
      Map res = Map<dynamic, dynamic>.from(json);
      setState(() {
        user.init(res);
      });
    } catch (e) {}

    // user.init(json);
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Scaffold(
      backgroundColor: AppColors.bodyColor,
      appBar: AppBar(
          backgroundColor: AppColors.white,
          title: Text(
            'Home',
            style: AppTextStyles.titleBold,
          )),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Text(
            'Ads jobs special',
            style: AppTextStyles.titleBold,
          ),
        ),
        const AdJobSpecial(),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Text(
            'Ads jobs normal',
            style: AppTextStyles.titleBold,
          ),
        ),
        const AdJobFree(),
      ]),
      bottomNavigationBar: SizedBox(
        height: 90,
        child: BasicHomeBottomNavigationBar(color: AppColors.primary),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('floating clicked'),
        child: Container(
          decoration:
              BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
          child: Container(
            decoration:
                BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
            width: 64,
            height: 64,
            child: Icon(
              Icons.search,
              size: 40,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
