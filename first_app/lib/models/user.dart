// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:http/http.dart' as http;
import 'dart:convert';

class User {
  int id = 0;
  String username = '';
  String fullname = '';
  String email = '';
  String password = '';
  String passwordConfirmation = '';
  String token = '';
  String emailVerifiedAt = '';
  int role = 0;
  String country = '';
  String photo = '';
  init(Map<dynamic, dynamic> response) {
    token = response['token'] ?? '';
    if (response['user'] != null) {
      response = response['user'];
    }
    username = response['username'];
    fullname = response['fullname'];
    email = response['email'];
    emailVerifiedAt = response['email_verified_at'];
    id = response['id'];
    role = response['role'];
    country = response['country'] ?? '';
    if (response['photo'] != null) {
      photo = 'https://apiv2.jobme.me/' + response['photo'];
    } else {
      photo = '';
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'fullname': fullname,
      'token': token,
      'email_verified_at': emailVerifiedAt,
      'id': id,
      'role': role,
      'country': country,
    };
  }

  Future<http.Response> saveUser() {
    return http.post(
      Uri.parse('https://apiv2.jobme.me/api/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Language': 'en'
      },
      body: jsonEncode(<String, String>{
        'fullname': fullname,
        'username': username,
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirmation
      }),
    );
  }

  Future<http.Response> login() {
    return http.post(
      Uri.parse('https://apiv2.jobme.me/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Language': 'en'
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );
  }
}
