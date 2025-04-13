part of 'get_shoes_cubit.dart';

@immutable
sealed class GetShoesState {}

final class GetShoesInitial extends GetShoesState {}
final class GetShoesLoading extends GetShoesState {}
final class GetShoesSuccess extends GetShoesState {
  final List<ShoesModel> shoes;
  GetShoesSuccess(this.shoes);
}
final class GetShoesFailure extends GetShoesState {
  final String errorMessage;
  GetShoesFailure(this.errorMessage);
}
