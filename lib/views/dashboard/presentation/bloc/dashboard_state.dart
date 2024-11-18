import 'package:equatable/equatable.dart';

import '../../../../blocs/bloc_status.dart';
import '../../domain/model/category_list_response.dart';
import '../../domain/model/dashboard_list_response.dart';

class DashboardState extends Equatable {
  const DashboardState({required this.dashboardCardModel,required this.categoryModel, this.appStatus = const InitialStatus()});

  final List<CompanyDataListResponse> dashboardCardModel;
  final List<CategoryListResponse> categoryModel;
  final AppSubmissionStatus appStatus;

  DashboardState copyWith({List<CompanyDataListResponse>? dashboardCardModel, List<CategoryListResponse>? categoryModel, AppSubmissionStatus? appStatus}) {
    return DashboardState(
      dashboardCardModel: dashboardCardModel ?? this.dashboardCardModel,
      categoryModel: categoryModel ?? this.categoryModel,
      appStatus: appStatus ?? this.appStatus,
    );
  }

  @override
  List<Object?> get props => [dashboardCardModel,categoryModel, appStatus];
}
