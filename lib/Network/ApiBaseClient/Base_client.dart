import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../sharedPreferences/sharedpref.dart';
import 'ApiConstants.dart';

const String baseUrl = base_url;

class BaseClient {
  var client = http.Client();

  Future<dynamic> get(String api) async {
    var url = Uri.parse(baseUrl + api);

    var response = await client.get(url);
    print(url);
    debugPrint(response.statusCode.toString());

    if (response.statusCode == 201 || response.statusCode == 202) {
      // debugPrint(response.body);
      return response.body;
    } else {
      print(response.body);
      debugPrint("wrongResponse");
      return null;
    }
  }

  Future<dynamic> post(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);

    var _header = {
      'Content-Type': 'application/json',
    };

    print(url);
    // print(object);
    var response = await client.post(url, body: object, headers: _header);

    if (response.statusCode == 201 || response.statusCode == 202) {
      debugPrint("Success response");
      debugPrint(response.statusCode.toString());
      return response.body;
    } else if (response.statusCode == 403 || response.statusCode == 404) {
      debugPrint("half");
      return response.statusCode;
    } else {
      print(response.body);
      debugPrint("wrongResponse");
      return null;
    }
  }

  Future<dynamic> patch(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);

    var _header = {
      'Content-Type': 'application/json',
    };

    print(url);
    var response = await client.patch(url, body: object, headers: _header);

    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202) {
      debugPrint("Success response");
      debugPrint(response.statusCode.toString());
      return response.body;
    } else if (response.statusCode == 403) {
      debugPrint("half");
      return response.statusCode;
    } else {
      print(response.body);
      debugPrint("wrongResponse");
      return null;
    }
  }

  Future<dynamic> delete(String api) async {}

  Future<dynamic> loginVerify(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);

    var _header = {
      'Content-Type': 'application/json',
    };

    print(url);
    var response = await client.post(url, body: object, headers: _header);

    if (response.statusCode == 201 || response.statusCode == 202) {
      debugPrint("Success response");
      debugPrint(response.statusCode.toString());
      Map me = response.headers;
      debugPrint(me['authorization']);
      SharedPref pref = SharedPref();
      pref.addStringToSF(me['authorization']);

      return response.body;
    } else if (response.statusCode == 403 || response.statusCode == 404) {
      debugPrint("wrongpayload or not exist");
      return response.statusCode;
    } else {
      print(response.body);
      debugPrint("wrongResponse");
      return null;
    }
  }
}
