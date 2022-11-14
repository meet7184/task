import 'package:demotask/ui/home_screen/controller/home_controller.dart';
import 'package:demotask/ui/home_screen/widget/common_list_widget.dart';
import 'package:demotask/ui/shared/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/homeScreen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Jake's Git"),
      ),
      body: GetBuilder(
        builder: (HomeController homeController) => homeController.loader
            ? const Center(
                child: AppLoader(),
              )
            : homeController.allDataList.isEmpty
                ? refresh(homeController)
                : const CommonListWidget(),
      ),
    );
  }

  refresh(HomeController homeController) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                homeController.refreshList(isLoader: true);
              },
              icon: const Icon(Icons.refresh)),
          const Text("No data found,Please tap to refresh"),
        ],
      ),
    );
  }
}
