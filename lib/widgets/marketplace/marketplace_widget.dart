import 'package:dchange/backend/local_storage/local_storage.dart';
import 'package:dchange/backend/utils/custom_loading_api.dart';
import 'package:dchange/controller/make_an_offer/make_an_offer_controller.dart';
import 'package:dchange/controller/marketplace/marketplace_buying_preview_controller.dart';
import 'package:dchange/extensions/custom_extensions.dart';

import '../../backend/model/marketplace/marketplace_info_model.dart';
import '../../custom_assets/assets.gen.dart';
import '../../routes/routes.dart';
import '../../utils/basic_screen_imports.dart';
import '../common/others/custom_image_widget.dart';

class MarketplaceWidget extends StatelessWidget {
  MarketplaceWidget({
    super.key,
    required this.data,
    required this.index,
  });
  final Datum data;
  final int index;
  final buyAndOfferController = Get.put(MarketplaceBuyingPreviewController());

  @override
  Widget build(BuildContext context) {
    final userImageSet = "${data.baseUr}/${data.imagePath}/${data.user.image}";
    final defaultImagePath = "${data.baseUr}/${data.defaultImage}";

    final userImage = data.user.image != '' ? userImageSet : defaultImagePath;
    return Container(
      margin: EdgeInsets.only(
        bottom: Dimensions.marginBetweenInputTitleAndBox,
        left: Dimensions.marginSizeHorizontal * 0.75,
        right: Dimensions.marginSizeHorizontal * 0.75,
      ),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: Dimensions.paddingSize * 0.791,
              horizontal: Dimensions.paddingSize * 0.7,
            ),
            decoration: ShapeDecoration(
              color: Theme.of(context).colorScheme.background,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius),
              ),
            ),
            child: Column(
              children: [
                verticalSpace(Dimensions.marginBetweenInputTitleAndBox * 2),
                FittedBox(
                  child: Row(
                    children: [
                      _amountWidget(
                          context, data.amount, data.saleCurrency.code),
                      CustomImageWidget(
                        path: Assets.icon.replyTeal,
                        color: CustomColor.blackColor,
                      ).paddingSymmetric(
                        horizontal: Dimensions.marginSizeHorizontal * 0.2,
                      ),
                      _amountWidget(context, data.rate, data.rateCurrency.code),
                    ],
                  ),
                ),
                Container(
                  height: 1.5,
                  margin: EdgeInsets.only(
                    top: Dimensions.marginSizeVertical * 0.791,
                    bottom: Dimensions.marginSizeVertical * 0.416,
                  ),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                _userProfileWidget(context, userImage)
              ],
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: Dimensions.marginSizeVertical * 0.18,
              ),
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius),
                    topRight: Radius.circular(Dimensions.radius),
                  ),
                ),
              ),
              child: TitleHeading3Widget(
                text: data.exchangeRate,
                color: CustomColor.whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _amountWidget(BuildContext context, String amount, String currency) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: amount,
            style: Get.isDarkMode
                ? CustomStyle.darkHeading1TextStyle.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: Dimensions.headingTextSize1 * 0.9,
                  )
                : CustomStyle.lightHeading1TextStyle.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: Dimensions.headingTextSize1 * 0.9,
                  ),
          ),
          WidgetSpan(
            child: Padding(
              padding: EdgeInsets.only(left: Dimensions.widthSize * 0.5),
            ),
          ),
          TextSpan(
            text: currency,
            style: CustomStyle.lightHeading1TextStyle.copyWith(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w700,
              fontSize: Dimensions.headingTextSize1 * 0.9,
            ),
          ),
        ],
      ),
    );
  }

  _userProfileWidget(BuildContext context, String userImage) {
    return Row(
      children: [
        Expanded(
          flex: 0,
          child: CircleAvatar(
            radius: Dimensions.radius * 1.5,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            backgroundImage: NetworkImage(
              userImage,
            ),
          ),
        ),
        horizontalSpace(Dimensions.widthSize * 0.8),
        Expanded(
          child: Column(
            crossAxisAlignment: crossStart,
            children: [
              TitleHeading4Widget(
                text: data.user.name,
                opacity: 0.60,
                fontWeight: FontWeight.w500,
                fontSize: Dimensions.headingTextSize4 * 0.9,
              ),
              TitleHeading4Widget(
                text: data.user.emailVerified == 1 && data.user.kycVerified == 1
                    ? Strings.verified
                    : Strings.unVerified,
                fontSize: Dimensions.headingTextSize6,
                color:
                    data.user.emailVerified == 1 && data.user.kycVerified == 1
                        ? Theme.of(context).primaryColor
                        : CustomColor.redColor,
              ),
            ],
          ),
        ),
        _makeAnOfferButtonWidget(context),
        horizontalSpace(Dimensions.widthSize * 0.8),
        _buyNowButtonWidget(context),
      ],
    );
  }

  _makeAnOfferButtonWidget(BuildContext context) {
    return InkWell(
      onTap: () {
        _onMakeAnOfferProcessMethod();
      },
      child: Container(
        padding: EdgeInsets.all(Dimensions.paddingSize * 0.2),
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          color: CustomColor.orangeColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius * 0.3),
          ),
        ),
        child: const TitleHeading4Widget(
          text: Strings.makeAnOffer,
          color: CustomColor.whiteColor,
        ),
      ),
    );
  }

  _buyNowButtonWidget(BuildContext context) {
    return InkWell(
      onTap: () {
        _onBuyProcessMethod();
      },
      child: Obx(
        () => buyAndOfferController.loadingIndex.value == index &&
                buyAndOfferController.isBuyLoading
            ? const CustomLoadingAPI().marginSymmetric(
                horizontal: Dimensions.marginSizeHorizontal * 0.5,
              )
            : Container(
                padding: EdgeInsets.all(Dimensions.paddingSize * 0.2),
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius * 0.3),
                  ),
                ),
                child: const TitleHeading4Widget(
                  text: Strings.buyNow,
                  color: CustomColor.whiteColor,
                ),
              ),
      ),
    );
  }

  void _onMakeAnOfferProcessMethod() {
    final controller = Get.put(MakeAnOfferController());

    /// >>> get seller information
    controller.sellerName.value = data.user.name;
    controller.isVerified.value =
        (data.user.emailVerified == 1 && data.user.kycVerified == 1)
            ? true
            : false;

    /// >>> get rate amount and currency from marketplace list
    controller.rateCurrency.value = data.rateCurrency.code;
    controller.rateAmount.value = data.rate.toDouble;
    controller.rateController.text = data.rate;

    /// >>> get sell amount and currency from marketplace list
    controller.sellAmount.value = data.amount.toDouble;
    controller.sellCurrency.value = data.saleCurrency.code;
    controller.amountController.text = data.amount;

    /// >>> get tarde id for send an offer [-- Required --]
    controller.tradeId.value = data.id.toString();

    Routes.makeAnOfferBuyingPreviewScreen.toNamed;
  }

  void _onBuyProcessMethod() {
    LocalStorage.saveBuyAndOfferId(id: data.id.toString());
    buyAndOfferController.loadingIndex.value = index;
    buyAndOfferController.sellerName.value = data.user.name;
    buyAndOfferController.isVerified.value =
        data.user.emailVerified == 1 && data.user.kycVerified == 1
            ? true
            : false;
    debugPrint(buyAndOfferController.loadingIndex.value.toString());
    buyAndOfferController.marketplaceBuyProcessApi(data.id);
  }
}
