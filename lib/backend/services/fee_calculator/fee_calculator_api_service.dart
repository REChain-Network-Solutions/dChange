import '../../model/fee_calculator/fee_calculator_info_model.dart';
import '../../utils/api_method.dart';
import '../../utils/custom_snackbar.dart';
import '../api_endpoint.dart';

class FeeCalculatorApiServices {
  ///*  Get fee calculator process api
  static Future<FeeCalculatorInfoModel?> getFeeCalculatorApiProcess({
    required String amount,
    required String currency,
  }) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        "${ApiEndpoint.feeCalculatorURL}?amount=$amount&currency=$currency",
        code: 200,
      );
      if (mapResponse != null) {
        FeeCalculatorInfoModel result =
            FeeCalculatorInfoModel.fromJson(mapResponse);
        return result;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞 err from Get fee calculator process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }
}
