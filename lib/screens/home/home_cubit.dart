import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nytimes/networking/network_mgr.dart';
import 'package:nytimes/networking/networking_api.dart';

import '../../model/data.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final api = NetworkingApi();
  Data? newsData;
  var endPoint = EndPoint.viewed;
  var timePeriod = TimePeriod.week;

  HomeCubit() : super(HomeInitial());

  loadData() async {
    try {
      emit(HomeLoadState());
      newsData = await api.fetchNewsData(endPoint, timePeriod);
      emit(SuccessState());
    } catch (e) {
      emit(ErrorState());
    }
  }
}
