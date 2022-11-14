import 'package:demotask/core/constant/app_color.dart';
import 'package:demotask/core/utils/config.dart';
import 'package:demotask/ui/home_screen/controller/home_controller.dart';
import 'package:demotask/ui/shared/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonListWidget extends StatelessWidget {
  const CommonListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (HomeController homeController) => RefreshIndicator(
        onRefresh: () async {
          await homeController.refreshList();
        },
        child: Scrollbar(
          child: ListView(
            controller: homeController.scrollController,
            children: homeController.allDataList
                .asMap()
                .map((index, data) => MapEntry(
                    index,
                    Column(
                      children: [
                        Container(
                          width: Get.width,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: AppColor.kPrimaryFontColor
                                          .withOpacity(0.20)))),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: Icon(
                                  Icons.book_sharp,
                                  size: getWidth(50),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data.name,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      data.description,
                                      style: TextStyle(
                                          color: AppColor.kPrimaryFontColor),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        commonIconAndTextWidget(
                                            icon: Icons.code,
                                            text: data.language),
                                        commonIconAndTextWidget(
                                            icon: Icons.bug_report,
                                            text: data.stargazersCount),
                                        commonIconAndTextWidget(
                                            icon: Icons.face,
                                            text: data.watchersCount),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child:
                              (index + 1) == homeController.allDataList.length
                                  ? homeController.nextData
                                      ? getLoader()
                                      : const SizedBox()
                                  : const SizedBox(),
                        )
                      ],
                    )))
                .values
                .toList(),
          ),
        ),
      ),
    );
  }

  commonIconAndTextWidget({required IconData icon, dynamic text}) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(
            width: 3,
          ),
          Text(
            "$text",
            style: TextStyle(color: AppColor.kPrimaryFontColor),
          )
        ],
      ),
    );
  }
}
