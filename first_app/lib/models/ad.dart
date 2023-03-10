import 'package:first_app/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Ad {
  int id = 0;
  String title = '';
  String description = '';
  int yearsOfExperiences = 0;
  int workTime = 0;
  User user = User();
  // late User user;
  init(Map<dynamic, dynamic> response) {
    user.init(response['user']);
    title = response['title'];
    description = response['description'];
    yearsOfExperiences = response['yearsOfExperiences'];
    workTime = response['workTime'];
    id = response['id'];
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'username': username,
  //     'email': email,
  //     'fullname': fullname,
  //     'token': token,
  //     'email_verified_at': emailVerifiedAt,
  //     'id': id,
  //     'role': role,
  //     'country': country,
  //   };
  // }

  Future<http.Response> getAds(int page, bool special) {
    String url = 'https://apiv2.jobme.me/api/adsJobs?page=$page&type=f';
    if (special) url += '&special=true';
    return http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Language': 'en'
      },
    );
  }

  // Future<http.Response> login() {
  //   return http.post(
  //     Uri.parse('https://apiv2.jobme.me/api/login'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       'Language': 'en'
  //     },
  //     body: jsonEncode(<String, String>{
  //       'username': username,
  //       'password': password,
  //     }),
  //   );
  // }
}
