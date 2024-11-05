import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:study_path/class/paypal_api_operatoin/paypal_api.dart';

part 'get_order_detials_state.dart';

class GetOrderDetialsCubit extends Cubit<GetOrderDetialsState> {
  GetOrderDetialsCubit() : super(GetOrderDetialsInitial());
  getdetails(token, id) {
    try {
      ApiService.orderdetials(token, id);
    } catch (e) {}
  }
}
