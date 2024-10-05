import '../../model/currency/currency_model.dart';
import '../../utils/api_method.dart';
import '../../utils/custom_snackbar.dart';
import '../api_endpoint.dart';

class CurrencyApiServices {
  ///  Currency get api process
  static Future<CurrencyModel?> getCurrencyProcessApi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false)
          .get(ApiEndpoint.currencyListUrl, code: 200);
      if (mapResponse != null) {
        CurrencyModel result = CurrencyModel.fromJson(mapResponse);

        return result;
      }
    } catch (e) {
      log.e('err from Currency get api process  service ==> $e');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }
}
