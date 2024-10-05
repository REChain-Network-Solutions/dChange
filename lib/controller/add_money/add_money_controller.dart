import 'package:dchange/extensions/custom_extensions.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/services.dart';
import '../../backend/model/add_money/add_money_flutter_wave_model.dart';
import '../../backend/model/add_money/add_money_info_model.dart';
import '../../backend/model/add_money/add_money_manual_insert_model.dart';
import '../../backend/model/add_money/add_money_paypal_insert_model.dart';
import '../../backend/model/add_money/add_money_stripe_insert_model.dart';
import '../../backend/model/add_money/tatum_gateway_model.dart';
import '../../backend/model/common/common_success_model.dart';
import '../../backend/services/add_money/add_money_api_services.dart';
import '../../routes/routes.dart';
import '../../utils/basic_screen_imports.dart';
import '../../views/congratulation/congratulation_screen.dart';
import '../../widgets/common/inputs/manual_payment_image_widget.dart';
import '../../widgets/common/inputs/primary_input_widget.dart';

class AddMoneyController extends GetxController {
  get onAddMoneyProcess => _addMoneyInsertProcess();

  RxString baseCurrency = ''.obs;
  RxString baseCurrencyFlag = ''.obs;
  RxString walletBalance = ''.obs;
  RxString walletCurrency = ''.obs;
  RxString walletCurrencySubTitle = ''.obs;
  RxString qrAddress = ''.obs;

  final flipCardController = FlipCardController();
  final copyInputController = TextEditingController();

  List<TextEditingController> inputFieldControllers = [];
  RxList inputFields = [].obs;
  List<String> listImagePath = [];
  List<String> listFieldName = [];
  RxBool hasFile = false.obs;

  String enteredAmount = "";
  String transferFeeAmount = "";
  String totalCharge = "";
  String youWillGet = "";
  String payableAmount = "";

  List<Currency> currencyList = [];
  List<String> baseCurrencyList = [];

  final depositMethod = TextEditingController();

  final cardNumberController = TextEditingController();
  final cardExpiryController = TextEditingController();
  final cardCVCController = TextEditingController();

  final cardHolderNameController = TextEditingController();
  final cardExpiryDateController = TextEditingController();
  final cardCvvController = TextEditingController();

  final amountTextController = TextEditingController();

  RxString selectAlias = ''.obs;
  List<String> totalAmount = [];
  List<Currency> allCurrencyList = [];

  RxString selectCurrency = ''.obs;
  RxString selectWallet = ''.obs;
  RxDouble selectRate = 0.0.obs;

  RxString selectedCurrencyAlias = "".obs;
  RxString selectedCurrencyName = "Select Method".obs;
  RxString selectedCurrencyType = "".obs;
  RxString selectedGatewaySlug = "".obs;
  RxString currencyCode = "".obs;
  RxString exchangeRate = "".obs;
  RxString currencyWalletCode = "".obs;
  RxString gatewayTrx = "".obs;
  RxInt selectedCurrencyId = 0.obs;
  RxDouble fee = 0.0.obs;
  RxDouble limitMin = 0.0.obs;
  RxDouble limitMax = 0.0.obs;
  RxDouble percentCharge = 0.0.obs;
  RxDouble rate = 0.0.obs;
  RxString payable = ''.obs;

  @override
  void dispose() {
    amountTextController.dispose();
    super.dispose();
  }

  RxString selectItem = ''.obs;
  List<String> keyboardItemList = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '.',
    '0',
    '<'
  ];

  inputItem(int index) {
    return InkWell(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onLongPress: () {
        if (index == 11) {
          if (totalAmount.isNotEmpty) {
            totalAmount.clear();
            amountTextController.text = totalAmount.join('');
          } else {
            return;
          }
        }
      },
      onTap: () {
        if (index == 11) {
          if (totalAmount.isNotEmpty) {
            totalAmount.removeLast();
            amountTextController.text = totalAmount.join('');
          } else {
            return;
          }
        } else {
          if (totalAmount.contains('.') && index == 9) {
            return;
          } else {
            totalAmount.add(keyboardItemList[index]);
            amountTextController.text = totalAmount.join('');
            debugPrint(totalAmount.join(''));
          }
        }
      },
      child: Center(
        child: CustomTitleHeadingWidget(
          text: keyboardItemList[index],
          style: Get.isDarkMode
              ? CustomStyle.lightHeading2TextStyle.copyWith(
                  fontSize: Dimensions.headingTextSize3 * 2,
                )
              : CustomStyle.darkHeading2TextStyle.copyWith(
                  color: CustomColor.primaryLightTextColor,
                  fontSize: Dimensions.headingTextSize3 * 2,
                ),
        ),
      ),
    );
  }

  @override
  void onInit() {
    getAddMoneyInfoProcess();
    super.onInit();
  }

  /// >> set loading process & Add Money Info Model
  final _isLoading = false.obs;
  late AddMoneyInfoModel _addMoneyInfoModel;

  /// >> get loading process & Add Money Info Model
  bool get isLoading => _isLoading.value;
  AddMoneyInfoModel get addMoneyInfoModel => _addMoneyInfoModel;

  ///* get add add money info process
  Future<AddMoneyInfoModel> getAddMoneyInfoProcess() async {
    _isLoading.value = true;
    update();

    await AddMoneyApiServices.getAddMoneyInfoApiProcess().then((value) {
      _addMoneyInfoModel = value!;
      _setPreviewData(_addMoneyInfoModel);

      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _addMoneyInfoModel;
  }

  _setPreviewData(AddMoneyInfoModel addMoneyInfoModel) {
    selectWallet.value =
        addMoneyInfoModel.data.gateways.first.currencies.first.name;
    selectAlias.value =
        addMoneyInfoModel.data.gateways.first.currencies.first.alias;
    for (var gateways in addMoneyInfoModel.data.gateways) {
      for (var currency in gateways.currencies) {
        allCurrencyList.add(
          Currency(
            id: currency.id,
            paymentGatewayId: currency.paymentGatewayId,
            name: currency.name,
            alias: currency.alias,
            currencyCode: currency.currencyCode,
            currencySymbol: currency.currencySymbol,
            minLimit: currency.minLimit,
            maxLimit: currency.maxLimit,
            percentCharge: currency.percentCharge,
            fixedCharge: currency.fixedCharge,
            rate: currency.rate,
            type: currency.type,
            image: currency.image,
          ),
        );
      }

      Currency currency =
          addMoneyInfoModel.data.gateways.first.currencies.first;
      Gateway gateway = addMoneyInfoModel.data.gateways.first;

      selectedCurrencyAlias.value = currency.alias;
      selectedCurrencyType.value = currency.type;
      selectedGatewaySlug.value = gateway.slug;
      selectedCurrencyId.value = currency.id;
      selectedCurrencyName.value = currency.name;

      rate.value = currency.rate;

      fee.value = currency.fixedCharge;
      limitMin.value = currency.minLimit / rate.value;
      limitMax.value = currency.maxLimit / rate.value;
      percentCharge.value = currency.percentCharge;
      currencyCode.value = currency.currencyCode;

      /// >>> get base currency
      baseCurrency.value = addMoneyInfoModel.data.baseCurr;
      baseCurrencyList.add(baseCurrency.value);

      /// >>> get user wallet
      walletBalance.value =
          double.parse(_addMoneyInfoModel.data.userWallet.balance)
              .toStringAsFixed(2);
      walletCurrency.value = _addMoneyInfoModel.data.userWallet.currency;
      walletCurrencySubTitle.value = _addMoneyInfoModel.data.userWallet.name;

      /// get exchange rate added
      dynamic rateValue = 1.0;
      exchangeRate.value = (rateValue / currency.rate).toStringAsFixed(2);
    }
    if (_addMoneyInfoModel.data.userWallet.flag != '') {
      baseCurrencyFlag.value =
          "${_addMoneyInfoModel.data.userWallet.baseUrl}/${_addMoneyInfoModel.data.userWallet.imagePath}/${_addMoneyInfoModel.data.userWallet.flag}";
    } else {
      baseCurrencyFlag.value =
          "${_addMoneyInfoModel.data.userWallet.baseUrl}/${_addMoneyInfoModel.data.userWallet.defaultImage}";
    }
  }

  /// >>> Add money paypal insert process
  final _isInsertLoading = false.obs;
  bool get isInsertLoading => _isInsertLoading.value;
  late AddMoneyPaypalInsertModel _addMoneyInsertPaypalModel;
  AddMoneyPaypalInsertModel get addMoneyInsertPaypalModel =>
      _addMoneyInsertPaypalModel;

  Future<AddMoneyPaypalInsertModel> addMoneyPaypalInsertProcess() async {
    _isInsertLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'amount': amountTextController.text,
      'currency': selectAlias.value,
    };

    await AddMoneyApiServices.addMoneyInsertPaypalApi(body: inputBody)
        .then((value) {
      _addMoneyInsertPaypalModel = value!;
      final data = _addMoneyInsertPaypalModel.data.paymentInformations;
      enteredAmount = data.requestAmount;
      transferFeeAmount = data.totalCharge;
      totalCharge = data.totalCharge;
      youWillGet = data.willGet;
      payableAmount = data.payableAmount;
      Routes.addMoneyPreviewScreen.toNamed;
      update();
    }).catchError((onError) {
      log.e(onError);
    });
    _isInsertLoading.value = false;
    update();
    return _addMoneyInsertPaypalModel;
  }

  /// >>> Add money Flutter Wave insert process
  late AddMoneyFlutterWavePaymentModel _addMoneyInsertFlutterWaveModel;
  AddMoneyFlutterWavePaymentModel get addMoneyInsertFlutterWaveModel =>
      _addMoneyInsertFlutterWaveModel;

  ///* Flutter Wave insert api process start
  Future<AddMoneyFlutterWavePaymentModel>
      addMoneyFlutterWaveInsertProcess() async {
    _isInsertLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'amount': amountTextController.text,
      'currency': selectAlias.value,
    };

    await AddMoneyApiServices.addMoneyInsertFlutterWaveApi(body: inputBody)
        .then((value) {
      _addMoneyInsertFlutterWaveModel = value!;
      final data = _addMoneyInsertFlutterWaveModel.data.paymentInformations;
      enteredAmount = data.requestAmount;
      transferFeeAmount = data.totalCharge;
      totalCharge = data.totalCharge;
      youWillGet = data.willGet;
      payableAmount = data.payableAmount;
      Routes.addMoneyPreviewScreen.toNamed;
      update();
    }).catchError((onError) {
      log.e(onError);
    });
    _isInsertLoading.value = false;
    update();
    return _addMoneyInsertFlutterWaveModel;
  }

  //! ----------------- Add money stripe insert process -------------------
  late AddMoneyStripeInsertModel _addMoneyInsertStripeModel;
  AddMoneyStripeInsertModel get addMoneyInsertStripeModel =>
      _addMoneyInsertStripeModel;

  ///* Stripe insert api process start
  Future<AddMoneyStripeInsertModel> addMoneyStripeInsertProcess() async {
    _isInsertLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'amount': amountTextController.text,
      'currency': selectAlias.value,
    };

    await AddMoneyApiServices.addMoneyInsertStripeApi(body: inputBody)
        .then((value) {
      _addMoneyInsertStripeModel = value!;
      final data = _addMoneyInsertStripeModel.data.paymentInformations;
      enteredAmount = data.requestAmount;
      transferFeeAmount = data.totalCharge;
      totalCharge = data.totalCharge;
      youWillGet = data.willGet;
      payableAmount = data.payableAmount;

      Routes.stripeWebPaymentScreen.toNamed;
      update();
    }).catchError((onError) {
      log.e(onError);
    });
    _isInsertLoading.value = false;
    update();
    return _addMoneyInsertStripeModel;
  }

  //! ----------------- Add money stripe confirm process -------------------
  final _isConfirmLoading = false.obs;

  bool get isConfirmLoading => _isConfirmLoading.value;

  //! ---------------------------- Add Money Manual Insert Process -----------------

  late AddMoneyManualInsertModel _addMoneyManualInsertModel;

  AddMoneyManualInsertModel get addMoneyManualInsertModel =>
      _addMoneyManualInsertModel;

  ///* A -dd Money manual insert api process start
  Future<AddMoneyManualInsertModel> manualPaymentGetGatewaysProcess() async {
    _isInsertLoading.value = true;
    inputFields.clear();
    listImagePath.clear();
    listFieldName.clear();
    inputFieldControllers.clear();
    update();

    Map<String, dynamic> inputBody = {
      'amount': amountTextController.text,
      'currency': selectAlias.value,
    };

    await AddMoneyApiServices.addMoneyManualInsertApi(body: inputBody)
        .then((value) {
      _addMoneyManualInsertModel = value!;

      final previewData = _addMoneyManualInsertModel.data.paymentInformations;
      enteredAmount = previewData.requestAmount;
      transferFeeAmount = previewData.totalCharge;
      totalCharge = previewData.totalCharge;
      youWillGet = previewData.willGet;
      payableAmount = previewData.payableAmount;

      ///* Add money manual insert api process start
      final data = _addMoneyManualInsertModel.data.inputFields;

      for (int item = 0; item < data.length; item++) {
        // make the dynamic controller
        var textEditingController = TextEditingController();
        inputFieldControllers.add(textEditingController);

        // make dynamic input widget
        if (data[item].type.contains('file')) {
          hasFile.value = true;
          inputFields.add(
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: ManualPaymentImageWidget(
                labelName: data[item].label,
                fieldName: data[item].name,
              ),
            ),
          );
        } else if (data[item].type.contains('text') ||
            data[item].type.contains('textarea')) {
          inputFields.add(
            Column(
              children: [
                PrimaryInputWidget(
                  controller: inputFieldControllers[item],
                  label: data[item].label,
                  hintText: data[item].label,
                  isValidator: data[item].required,
                  fillColor: Theme.of(Get.context!).colorScheme.background,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(
                      int.parse(data[item].validation.max.toString()),
                    ),
                  ],
                ).paddingOnly(bottom: Dimensions.marginSizeVertical * 0.75),
              ],
            ),
          );
        }
      }

      //-------------------------- Process inputs end --------------------------
      Routes.addMoneyManualPaymentScreen.toNamed;
      _isInsertLoading.value = false;

      update();
    }).catchError((onError) {
      _isInsertLoading.value = false;
      log.e(onError);
    });

    update();
    return _addMoneyManualInsertModel;
  }

  //! ---------------------------- Add Money Manual Payment Process -------------------------

  late CommonSuccessModel _manualPaymentConfirmModel;
  CommonSuccessModel get manualPaymentConfirmModel =>
      _manualPaymentConfirmModel;

  Future<CommonSuccessModel> manualPaymentProcess() async {
    _isConfirmLoading.value = true;
    Map<String, String> inputBody = {
      'track': addMoneyManualInsertModel.data.paymentInformations.trx,
    };

    final data = addMoneyManualInsertModel.data.inputFields;

    for (int i = 0; i < data.length; i += 1) {
      if (data[i].type != 'file') {
        inputBody[data[i].name] = inputFieldControllers[i].text;
      }
    }

    await AddMoneyApiServices.manualPaymentConfirmApi(
            body: inputBody, fieldList: listFieldName, pathList: listImagePath)
        .then((value) {
      _manualPaymentConfirmModel = value!;

      Get.to(
        () => CongratulationScreen(
          route: Routes.navigationScreen,
          subTitle: _manualPaymentConfirmModel.message.success.first,
          title: Strings.congratulations,
        ),
      );
      _isConfirmLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });
    _isConfirmLoading.value = false;
    update();
    return _manualPaymentConfirmModel;
  }

  //! ----------------- Add money tatum insert process -------------------
  late TatumGatewayModel _tatumGatewayModel;

  TatumGatewayModel get tatumGatewayModel => _tatumGatewayModel;

  // add money tatum
  Future<TatumGatewayModel> tatumProcess() async {
    inputFields.clear();
    inputFieldControllers.clear();
    _isInsertLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'amount': amountTextController.text,
      'currency': selectAlias.value,
    };

    await AddMoneyApiServices.tatumInsertApi(body: inputBody).then((value) {
      _tatumGatewayModel = value!;

      final data = _tatumGatewayModel.data.addressInfo.inputFields;
      qrAddress.value = _tatumGatewayModel.data.addressInfo.address;

      for (int item = 0; item < data.length; item++) {
        // make the dynamic controller
        var textEditingController = TextEditingController();
        inputFieldControllers.add(textEditingController);

        if (data[item].type.contains('text')) {
          inputFields.add(
            Column(
              children: [
                PrimaryInputWidget(
                  controller: inputFieldControllers[item],
                  label: data[item].label,
                  hintText: data[item].label,
                  validator: data[item].required,
                  isFilled: false,
                  showBorderSide: true,
                  fillColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(
                      int.parse(data[item].validation.max.toString()),
                    ),
                  ],
                ).paddingOnly(bottom: Dimensions.marginSizeVertical * 0.75),
              ],
            ),
          );
        }
      }
      final previewData = _tatumGatewayModel.data.paymentInformations;
      enteredAmount = previewData.requestAmount;
      transferFeeAmount = previewData.totalCharge;
      totalCharge = previewData.totalCharge;
      youWillGet = previewData.willGet;
      payableAmount = previewData.payableAmount;
      Get.toNamed(Routes.addMoneyPreviewScreen);
      update();
    }).catchError((onError) {
      log.e(onError);
    });
    _isInsertLoading.value = false;
    update();
    return _tatumGatewayModel;
  }

  final _isTatumConfirmLoading = false.obs;
  bool get isTatumConfirmLoading => _isTatumConfirmLoading.value;
  late CommonSuccessModel _addMoneyConfirm;
  CommonSuccessModel get addMoneyConfirm => _addMoneyConfirm;

  //  TatumConfirm process with image
  Future<CommonSuccessModel> tatumConfirmProcess(BuildContext context) async {
    _isTatumConfirmLoading.value = true;
    update();

    Map<String, String> inputBody = {};
    final data = _tatumGatewayModel.data.addressInfo.inputFields;

    for (int i = 0; i < data.length; i += 1) {
      if (data[i].type != 'file') {
        inputBody[data[i].name] = inputFieldControllers[i].text;
      }
    }

    await AddMoneyApiServices.tatumConfirmApiProcess(
      body: inputBody,
      url: _tatumGatewayModel.data.addressInfo.submitUrl,
    ).then((value) {
      _addMoneyConfirm = value!;
      Get.to(
        () => CongratulationScreen(
          route: Routes.navigationScreen,
          subTitle: _manualPaymentConfirmModel.message.success.first,
          title: Strings.congratulations,
        ),
      );

      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isTatumConfirmLoading.value = false;
    update();
    return _addMoneyConfirm;
  }

  Future<CommonSuccessModel> tatumConfirmTransactionProcess(
    context,
    String url,
    int index,
  ) async {
    _isTatumConfirmLoading.value = true;
    update();

    Map<String, String> inputBody = {};
    final data = _addMoneyInfoModel.data.transactionss[index].dynamicInputs;

    for (int i = 0; i < data.length; i += 1) {
      if (data[i].type != 'file') {
        inputBody[data[i].name] = inputFieldControllers[i].text;

        debugPrint(inputBody[data[i].name]);
      }
    }

    await AddMoneyApiServices.tatumConfirmApiProcess(
      body: inputBody,
      url: url,
    ).then((value) {
      _addMoneyConfirm = value!;
      Get.to(
        () => CongratulationScreen(
          route: Routes.navigationScreen,
          subTitle: _manualPaymentConfirmModel.message.success.first,
          title: Strings.congratulations,
        ),
      );
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isTatumConfirmLoading.value = false;
    update();
    return _addMoneyConfirm;
  }

  /// * Add money insert process
  /// * Check payment gateway
  _addMoneyInsertProcess() {
    debugPrint(selectAlias.value);
    debugPrint(selectedCurrencyType.value);
    if (selectedCurrencyType.value.contains("AUTOMATIC")) {
      if (selectAlias.contains('paypal')) {
        addMoneyPaypalInsertProcess();
      } else if (selectAlias.contains('flutterwave')) {
        addMoneyFlutterWaveInsertProcess();
      } else if (selectAlias.contains('stripe')) {
        addMoneyStripeInsertProcess();
      } else if (selectAlias.contains('tatum')) {
        tatumProcess();
      } else {
        addMoneyStripeInsertProcess();
      }
    } else if (selectedCurrencyType.value.contains('MANUAL')) {
      manualPaymentGetGatewaysProcess();
    }
  }
}
