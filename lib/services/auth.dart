import 'dart:convert';

import 'package:hassan_api/models/login.dart';
import 'package:hassan_api/models/register.dart';
import 'package:hassan_api/models/user.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  ///Register
  Future<RegisterModel> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      http.Response response = await http.post(
        Uri.parse('{{TODO_URL}}/users/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"name": name, "email": email, "password": password}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return RegisterModel.fromJson(jsonDecode(response.body));
      } else {
        throw response.reasonPhrase.toString();
      }
    } catch (e) {
      throw e.toString();
    }
  }

  ///Login
  Future<LoginModel> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      http.Response response = await http.post(
        Uri.parse('{{TODO_URL}}/users/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"email": email, "password": password}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return LoginModel.fromJson(jsonDecode(response.body));
      } else {
        throw response.reasonPhrase.toString();
      }
    } catch (e) {
      throw e.toString();
    }
  }

  ///Get Profile
  Future<UserModel> getUserProfile(String token) async {
    try {
      http.Response response = await http.get(
        Uri.parse('{{TODO_URL}}/users/profile'),
        headers: {'Authorization': token},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return UserModel.fromJson(jsonDecode(response.body));
      } else {
        throw response.reasonPhrase.toString();
      }
    } catch (e) {
      throw e.toString();
    }
  }

  ///Update Profile
  Future<bool> updateProfile({
    required String token,
    required String name,
  }) async {
    try {
      http.Response response = await http.put(
        Uri.parse('{{TODO_URL}}/users/profile'),
        headers: {'Authorization': token, 'Content-Type': 'application/json'},
        body: jsonEncode({'name': name}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        throw response.reasonPhrase.toString();
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
