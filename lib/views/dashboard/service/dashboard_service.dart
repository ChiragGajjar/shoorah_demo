import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shoorah_test_app/utils/value/app_string.dart';

import '../domain/model/category_list_response.dart';
import '../domain/model/dashboard_list_response.dart';

class DashboardService {
  Future<List<CompanyDataListResponse>?> getDashboardList() async {
    const String baseUrl = "${AppString.baseURL}${AppString.getUsers}";
    var url = Uri.parse(baseUrl);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonList = json.decode(response.body) as List;
      List<CompanyDataListResponse> companyList = jsonList.map((jsonItem) => CompanyDataListResponse.fromJson(jsonItem)).toList();
      return companyList;
    } else {
      return null;
    }
  }

  Future<List<CategoryListResponse>?> getCategoryList() async {
    const String baseUrl = "${AppString.baseURL}${AppString.getCategories}";
    var url = Uri.parse(baseUrl);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonList = json.decode(response.body) as List;
      List<CategoryListResponse> categoryList = jsonList.map((jsonItem) => CategoryListResponse.fromJson(jsonItem)).toList();
      return categoryList;
    } else {
      return null;
    }
  }
}
