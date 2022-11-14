import 'dart:io';

import 'package:demotask/core/constant/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingOverlay {
  void hide() {
    Get.back();
  }

  void show() {
    // Get.dialog(
    //   AppLoader(),
    //   barrierDismissible: false,
    // );
    showDialog(
      context: Get.context as BuildContext,
      barrierDismissible: false,
      builder: (BuildContext context) => const AppLoader(),
    );
  }

  LoadingOverlay._create();

  factory LoadingOverlay.of() {
    return LoadingOverlay._create();
  }
}

class AppLoader extends StatelessWidget {
  const AppLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: getLoader(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget getLoader() {
  if (Platform.isIOS) {
    return const CupertinoActivityIndicator();
  } else {
    return const CircularProgressIndicator(
      strokeWidth: 2,
      valueColor: AlwaysStoppedAnimation<Color>(AppColor.kAppbarColor),
    );
  }
}
