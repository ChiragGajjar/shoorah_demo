
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/bloc_status.dart';
import '../../domain/repository/dashboard/dashboard_repository.dart';
import 'dashboard_event.dart';
import 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DashboardRepository? dashboardRepo;

  DashboardBloc({this.dashboardRepo}) : super(const DashboardState(dashboardCardModel: [], categoryModel: [])) {
    on<DashboardEvent>((event, emit) async {
      await mapEventToState(event, emit);
    });

  }

  Future mapEventToState(DashboardEvent event, Emitter<DashboardState> emit) async {
    if (event is DashboardGetEvent) {
      emit(state.copyWith(appStatus: SubmissionLoading()));
      try {
        await dashboardRepo?.getDashboardList();
        emit(state.copyWith(appStatus: const SubmissionSuccess()));
        emit(state.copyWith(dashboardCardModel: await dashboardRepo?.getDashboardList()));
      } catch (e) {
        emit(state.copyWith(appStatus: SubmissionFailed(e)));
      }
    }else if (event is GetCategoryEvent) {
      emit(state.copyWith(appStatus: SubmissionLoading()));
      try {
        await dashboardRepo?.getCategoryList();
        emit(state.copyWith(appStatus: const SubmissionSuccess()));
        emit(state.copyWith(categoryModel: await dashboardRepo?.getCategoryList()));
      } catch (e) {
        emit(state.copyWith(appStatus: SubmissionFailed(e)));
      }
    }
  }


}
