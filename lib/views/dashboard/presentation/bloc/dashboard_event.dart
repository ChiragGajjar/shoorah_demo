import 'package:equatable/equatable.dart';

abstract class DashboardEvent extends Equatable {}

class DashboardGetEvent extends DashboardEvent {
  @override
  List<Object?> get props => [];
}

class GetCategoryEvent extends DashboardEvent {
  @override
  List<Object?> get props => [];
}