import 'dart:async';
import 'package:demotask/core/constant/app_color.dart';
import 'package:demotask/core/constant/app_icons.dart';
import 'package:demotask/ui/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

class FaceScreen extends StatefulWidget {
  static const String routeName = "/faceScreen";

  const FaceScreen({Key? key}) : super(key: key);

  @override
  State<FaceScreen> createState() => _FaceScreenState();
}

class _FaceScreenState extends State<FaceScreen> {
  final LocalAuthentication auth = LocalAuthentication();

  String _authorized = 'Not Authorized';
  @override
  void initState() {
    biometrics().then(
      (value) => value
          ? _authenticate()
          : showDialog(
              context: context,
              builder: (context) {
                return alertDialog();
              },
            ),
    );
    super.initState();
  }

  AlertDialog alertDialog() {
    return AlertDialog(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Icon(
            Icons.error,
            color: Colors.red,
          ),
          Text(
            "Required security features not available [FeaturesType face & fingerprint]",
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Text(
            "Ok",
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }

  Future<bool> biometrics() async {
    try {
      return await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      return false;
    }
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
          biometricOnly: false,
          sensitiveTransaction: false,
          localizedReason: 'Let OS determine authentication method',
          useErrorDialogs: true);
    } on PlatformException catch (e) {
      setState(() {
        _authorized = "Error - ${e.message}";
      });
      return;
    }
    if (!mounted) return;

    setState(() {
      if (authenticated) {
        _authorized = 'Authorized';
        Get.offAndToNamed(HomeScreen.routeName);
      } else {
        _authorized = "Not Authorized";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 80,
            child: Center(
              child: Column(
                children: const [
                  SizedBox(height: 10),
                  SafeArea(
                    child: Text(
                      "Face Auth Screen",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            decoration: const BoxDecoration(
              color: AppColor.brownColor,
            ),
          ),
          const SizedBox(
            height: 90,
          ),
          GestureDetector(
            onTap: () {
              biometrics().then(
                (value) => value
                    ? _authenticate()
                    : showDialog(
                        context: context,
                        builder: (context) {
                          return alertDialog();
                        },
                      ),
              );
            },
            child: Image.asset(
              AppIcons.faceImage,
              color: AppColor.brownColor,
              height: 120,
            ),
          ),
          Text(
            _authorized,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Text(
            "Tap Face To Authorize",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
