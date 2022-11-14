import 'package:demotask/core/local_db/moor_db.dart';
import 'package:demotask/core/service/repo/gitdata_repo.dart';
import 'package:demotask/ui/home_screen/model/git_data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class HomeController extends GetxController {
  final moorDb = GetIt.I.get<MoorDbClient>();

  int page = 1;

  List<GitDummyDataModel> allDataList = [];

  bool _nextData = true;

  bool get nextData => _nextData;

  bool isFetching = false;

  bool loader = true;

  Future fetchData() async {
    if (isFetching) {
      return;
    }
    if (!nextData) {
      return;
    }
    isFetching = true;

    if (page == 1) {
      allDataList.clear();
    }
    final request = await GitDataRepo.getGitData(page: page);

    if (request != null) {
      print("data from api");

      List<GitDummyDataModel> dataList = List<GitDummyDataModel>.from(
          request.map((e) => GitDummyDataModel.fromJson(e)));
      moorDb.insert(dataList);

      allDataList.addAll(dataList);
      if (dataList.length < 15) {
        _nextData = false;
      } else {
        page++;
        isFetching = false;
      }
    }
    if (request == null) {
      print("data from db");
      final v = await moorDb.getNotificationData();
      isFetching = false;

      if (v.isNotEmpty) {
        allDataList.clear();
        allDataList.addAll(v.map((e) => GitDummyDataModel.fromEntity(e)));

        _nextData = false;
      }
    }
    loader = false;
    update();
  }

  final scrollController = ScrollController();

  Future refreshList({bool? isLoader}) async {
    if (isLoader ?? false) {
      loader = true;
      update();
    }
    page = 1;
    _nextData = true;
    await fetchData();
  }

  @override
  void onInit() {
    fetchData();
    scrollController.addListener(() {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent / 2 &&
          !scrollController.position.outOfRange) {
        fetchData();
      }
    });
    super.onInit();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
