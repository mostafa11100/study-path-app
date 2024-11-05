import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:study_path/class/paypal_api_operatoin/paypal_api.dart';

part 'get_token_state.dart';

class GetTokenCubit extends Cubit<GetTokenState> {
  GetTokenCubit() : super(GetTokenInitial());
  gettoken() async {
    try {
      emit(GetTokenLoading());
      String token = await ApiService.getdata();
      emit(GetTokenSuccess(token));
    } catch (e) {
      emit(GetTokenFail());
    }
  }
}
