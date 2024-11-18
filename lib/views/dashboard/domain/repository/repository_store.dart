
import 'package:shoorah_test_app/views/dashboard/service/dashboard_service.dart';
import 'dashboard/dashboard_repository.dart';

class RepositoryStore {
  static final DashboardRepository dashboardRepository = DashboardRepository(service: DashboardService());
}
