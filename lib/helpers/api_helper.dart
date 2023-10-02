import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:project_template/helpers/app_global_data.dart';

import '../configs/constants/hive.dart';
import '../configs/constants/http_codes.dart';
import '../configs/constants/json_keys.dart';
import 'hive_helper.dart';
import 'network_error_helper.dart';
import 'failures.dart';

abstract class NetworkService {
  Future<dynamic> getRequest(url);

  Future<dynamic> postRequest(url, body);

  Future<dynamic> deleteRequest(url);
}

class NetworkServiceImpl implements NetworkService {
  @override
  Future<dynamic> getRequest(url) async {
    log(AppGlobalData.ACCESS_TOKEN.toString());

    // if (DateTime.now()
    //         .difference(AppGlobalData.CURRENT_USER!.tokenIssuingTime)
    //         .inMinutes >=
    //     14) {

    try {
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization':
            // 'Bearer ${await HiveHelper(HiveConstants.accessToken).getWithKey(HiveConstants.accessToken)}'
            'Bearer ${AppGlobalData.ACCESS_TOKEN}'
      };
      http.Response response = await http.get(Uri.parse(url), headers: headers);

      bool isSuccess = response.statusCode < HttpCodes.success;
      if (isSuccess) {
        log(response.statusCode.toString());
        log(response.body.toString());
        return jsonDecode(response.body);
      } else {
        log(response.statusCode.toString());
        log(response.body.toString());
        Map errorBody = jsonDecode(response.body);
        String key = errorBody.entries.first.key;
        String message = errorBody[key];
        int statusCode = response.statusCode;
        Failure failure =
            Failure(code: statusCode, messageEn: message, messageAr: message);
        // String failureMessage = jsonDecode(response.body)[JsonKeys.message];
        // Failure failure = NetWorkServiceErrorHandler.convertApiErrorsToFailures(
        // failureMessage);
        throw failure;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> postRequest(url, body) async {
    Failure failure = AppFailures.defaultFailure;

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      // 'Authorization': 'Bearer ${AppGlobalData.CURRENT_USER!.accessToken}'
    };

    try {
      http.Response response = await http.post(Uri.parse(url),
          body: jsonEncode(body), headers: headers);
      bool isSuccess = response.statusCode < HttpCodes.success;
      log(response.body.toString());
      if (isSuccess) {
        log(response.body.toString());
        return jsonDecode(response.body) ?? {} as Map<String, dynamic>;
      } else {
        // log(response.body.toString());
        // String failureMessage = jsonDecode(response.body)[JsonKeys.message];
        // failure = NetWorkServiceErrorHandler.convertApiErrorsToFailures(
        //     failureMessage);
        log(response.statusCode.toString());
        log(response.body.toString());

        Map errorBody = jsonDecode(response.body);
        String key = errorBody.entries.first.key;
        String message = errorBody[key];
        int statusCode = response.statusCode;
        Failure failure =
            Failure(code: statusCode, messageEn: message, messageAr: message);
        throw failure;
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<Map<String, dynamic>> deleteRequest(url) async {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    try {
      Failure failure = AppFailures.defaultFailure;
      http.Response response =
          await http.delete(Uri.parse(url), headers: headers);
      log(response.body.toString());

      bool isSuccess = response.statusCode < HttpCodes.success;

      if (isSuccess) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        String failureMessage =
            jsonDecode(response.body)[JsonKeys.message] ?? '';
        failure = NetWorkServiceErrorHandler.convertApiErrorsToFailures(
            failureMessage);

        throw failure;
      }
    } catch (e) {
      rethrow;
    }
  }
}
