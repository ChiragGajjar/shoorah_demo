import '../../../service/dashboard_service.dart';
import '../../model/category_list_response.dart';
import '../../model/dashboard_list_response.dart';

class DashboardRepository {
  DashboardRepository({required this.service});
  final DashboardService service;

  Future<List<CompanyDataListResponse>?> getDashboardList() async {
    return service.getDashboardList();
  }

  Future<List<CategoryListResponse>?> getCategoryList() async {
    return service.getCategoryList();
  }
}
