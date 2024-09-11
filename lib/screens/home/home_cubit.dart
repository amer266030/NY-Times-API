import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nytimes/networking/network_mgr.dart';
import 'package:nytimes/networking/networking_api.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final api = NetworkingApi();
  HomeCubit() : super(HomeInitial());

  loadData() {
    print('I am here');
    try {
      emit(HomeLoadState());
      api.getNews(EndPoint.emailed, TimePeriod.day);
      emit(SuccessState());
    } catch (e) {
      emit(ErrorState());
    }
  }
}
