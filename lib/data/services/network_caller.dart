import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../application/app.dart';
import '../../presentation/state_holders/auth_controller.dart';
import '../model/network_response.dart';




class NetworkCaller {
  /// get request method
  Future<NetworkResponse> getRequest(String url, {String? token}) async {
    try {
      Response response = await get(Uri.parse(url),
          headers: {'token': (token ?? AuthController.accessToken).toString()});
      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200) {
        return NetworkResponse(
            true, response.statusCode, jsonDecode(response.body));
      } else if (response.statusCode == 401) {
        //gotoLogin();
      } else {
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(false, -1, null);
  }

  Future<NetworkResponse> postRequest(String url, Map<String, dynamic> body, {String token = '', bool isLogin = false}) async {
    try {
      Response response = await post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'token': AuthController.accessToken.toString()
        },
        body: jsonEncode(body),
      );
      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200) {
        return NetworkResponse(
          true,
          response.statusCode,
          jsonDecode(response.body),
        );
      } else if (response.statusCode == 401) {
        if (isLogin == false) {
          //gotoLogin();
        }
      } else {
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(false, -1, null);
  }

  // static Future<void> gotoLogin() async {
  //   await AuthController.clearUserInfo();
  //   Navigator.pushAndRemoveUntil(
  //       CraftyBay.globalKey.currentContext!,
  //       MaterialPageRoute(
  //           builder: (context) => const EmailVerificationScreen()),
  //           (route) => false);
  // }
}