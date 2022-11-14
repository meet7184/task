import 'dart:convert';
import 'package:demotask/core/utils/app_functions.dart';
import 'package:demotask/ui/shared/loader.dart';
import 'package:http/http.dart' as http;

enum RequestApiType { get, post, put, delete }

class API {
  static late http.Response response;

  static Future apiHandler({
    required String url,
    RequestApiType requestType = RequestApiType.post,
    Map<String, String>? header,
    bool showLoader = true,
    bool showToast = true,
    dynamic body,
  }) async {
    try {
      if (await checkConnection()) {
        if (showLoader) LoadingOverlay.of().show();
        if (requestType == RequestApiType.get) {
          response = await http.get(
            Uri.parse(url),
            headers: header,
          );
        }
        var responseDecode = jsonDecode(response.body);
        if (response.statusCode == 200 || response.statusCode == 201) {
          return responseDecode;
        } else {
          return null;
        }
      } else {
        flutterToast("Connect internet to get updated record");
        return null;
      }
    } catch (e) {
    } finally {
      if (showLoader) LoadingOverlay.of().hide();
    }
  }
}
