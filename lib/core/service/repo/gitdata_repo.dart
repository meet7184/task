import '../api_handler.dart';
import '../api_routes.dart';

class GitDataRepo {
  static Future getGitData({required int page}) async {
    final response = await API.apiHandler(
        showLoader: false,
        showToast: false,
        url: APIRoutes.fetchDataList + "?page=$page&per_page=15",
        requestType: RequestApiType.get);
    if (response != null) {
      return response;
    }
  }
}
