import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool> checkConnection() async {
  ConnectivityResult result = await Connectivity().checkConnectivity();
  return (result == ConnectivityResult.mobile ||
      result == ConnectivityResult.wifi);
}

flutterToast(String msg) {
  Fluttertoast.cancel();
  return Fluttertoast.showToast(
      msg: msg,
      textColor: Colors.white,
      backgroundColor: Colors.black.withOpacity(0.70),
      fontSize: 14);
}
void disposeKeyboard() {
  return FocusManager.instance.primaryFocus?.unfocus();
}
