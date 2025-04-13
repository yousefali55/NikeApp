import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:nike/data/get_shoes/shoes_model.dart';
part 'get_shoes_state.dart';

class GetShoesCubit extends Cubit<GetShoesState> {
  final Dio dio = Dio();
  final String baseUrl = 'https://shoes-collections.p.rapidapi.com';

  GetShoesCubit() : super(GetShoesInitial());

  Future<void> getShoes() async {
    emit(GetShoesLoading());

    try {
      final response = await dio.get(
        '$baseUrl/shoes',
        options: Options(
          headers: {
            'x-rapidapi-key': '64f8bd1cddmshe15386fbe9f076ap118865jsne049d1f9a4e4', 
            // 'X-RapidAPI-Host': 'shoes-collections.p.rapidapi.com',
          },
        ),
      );

      if (response.statusCode == 200) {
        final List data = response.data;
        final shoes = data.map((json) => ShoesModel.fromJson(json)).toList();
        emit(GetShoesSuccess(shoes));
        print('Shoes data: $shoes');
      } else {
        emit(GetShoesFailure('Failed to load shoes: ${response.statusMessage}'));
      }
    } catch (e) {
      emit(GetShoesFailure(e.toString()));
    }
  }
}
