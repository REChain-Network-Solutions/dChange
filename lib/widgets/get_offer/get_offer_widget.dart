part of '../../views/get_offer/get_offer_screen.dart';

class GetOfferWidget extends StatelessWidget {
  GetOfferWidget({
    super.key,
    required this.index,
    required this.getOffer,
    required this.imagePath,
    required this.defaultImage,
    required this.controller,
    this.isWhiteColor = true,
  });
  final int index;
  final bool isWhiteColor;
  final GetOffer getOffer;
  final String imagePath;
  final String defaultImage;
  final GetOfferController controller;
  final counterOfferController = Get.put(MakeCounterOfferController());
  final offerBuyController = Get.put(OfferBuyPreviewController());

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd/MM/yyyy');
    final creatorImageSet =
        "${ApiEndpoint.mainDomain}/$imagePath/${getOffer.creatorImage}";
    final defaultImagePath = "${ApiEndpoint.mainDomain}/$defaultImage";

    final creatorImage =
        getOffer.creatorImage != '' ? creatorImageSet : defaultImagePath;

    return InkWell(
      onTap: () {
        _onCounterOfferProcessMethod();
      },
      child: Container(
        margin: EdgeInsets.only(bottom: Dimensions.heightSize * 0.3),
        padding: EdgeInsets.all(Dimensions.paddingSize * 0.35),
        decoration: ShapeDecoration(
          color: isWhiteColor
              ? Theme.of(context).colorScheme.background
              : Theme.of(context).scaffoldBackgroundColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius * 0.8)),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 0,
                  child: Container(
                    width: Dimensions.widthSize * 5.5,
                    padding: EdgeInsets.all(Dimensions.paddingSize),
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: NetworkImage(creatorImage),
                        fit: BoxFit.fill,
                      ),
                      color: Theme.of(context).scaffoldBackgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius * 0.8),
                      ),
                    ),
                  ),
                ),
                horizontalSpace(Dimensions.widthSize * 0.6),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: crossStart,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TitleHeading3Widget(
                              text: getOffer.creatorName,
                              fontWeight: FontWeight.w600,
                              maxLines: 1,
                              textOverflow: TextOverflow.ellipsis,
                            ),
                          ),
                          horizontalSpace(Dimensions.widthSize * 0.5),
                        ],
                      ),
                      FittedBox(
                        child: Row(
                          children: [
                            TitleHeading5Widget(
                              text:
                                  "${getOffer.tradeAmount} ${getOffer.saleCurrencyCode}",
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                            CustomImageWidget(path: Assets.icon.replyTeal),
                            TitleHeading5Widget(
                              text:
                                  "${getOffer.tradeRate} ${getOffer.rateCurrencyCode}",
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                      FittedBox(
                        child: Row(
                          children: [
                            TitleHeading4Widget(
                              text:
                                  "${getOffer.amount} ${getOffer.saleCurrencyCode}",
                              opacity: 0.60,
                              fontWeight: FontWeight.w500,
                              fontSize: Dimensions.headingTextSize6,
                            ),
                            CustomImageWidget(
                              path: Assets.icon.replyTeal,
                              color: CustomColor.primaryLightTextColor
                                  .withOpacity(0.25),
                            ),
                            TitleHeading4Widget(
                              text:
                                  "${getOffer.rate} ${getOffer.rateCurrencyCode}",
                              opacity: 0.60,
                              fontWeight: FontWeight.w500,
                              fontSize: Dimensions.headingTextSize6,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                horizontalSpace(Dimensions.widthSize),
                Expanded(
                  flex: 0,
                  child: Column(
                    crossAxisAlignment: crossEnd,
                    children: [
                      TitleHeading4Widget(
                        text: dateFormat.format(getOffer.offerCreated),
                        opacity: 0.30,
                        fontWeight: FontWeight.w500,
                        fontSize: Dimensions.headingTextSize6,
                      ),
                      verticalSpace(Dimensions.marginBetweenInputTitleAndBox),

                      if (getOffer.tradeStatus == 1) ...[
                        if (getOffer.receiverId == LocalStorage.getId() ||
                            getOffer.receiverId != LocalStorage.getId()) ...[
                          if (getOffer.status == 4) ...[
                            _customButtonWidget(
                              title: Strings.rejected,
                              onTap: () {},
                            )
                          ] else if (getOffer.status == 1) ...[
                            if (getOffer.forUserId == LocalStorage.getId()) ...[
                              _customButtonWidget(
                                title: Strings.accepted,
                                onTap: () {},
                              )
                            ] else ...[
                              _customButtonWidget(
                                title: Strings.pay,
                                onTap: () {
                                  /// >>> get seller information
                                  offerBuyController.sellerName.value =
                                      getOffer.creatorName;
                                  offerBuyController.isVerified.value =
                                      (getOffer.emailVerified == 1 &&
                                              getOffer.kycVerified == 1)
                                          ? true
                                          : false;
                                  offerBuyController.offerBuyProcessApi(
                                    getOffer.id.toString(),
                                  );
                                },
                              )
                            ],
                          ]
                        ],
                      ],

                      /// get sold button &  accept , reject ,counter offer
                      if (getOffer.tradeStatus == 1) ...[
                        if (getOffer.receiverId == LocalStorage.getId() &&
                            getOffer.status != 4 &&
                            getOffer.status != 1) ...[
                          Obx(
                            () => counterOfferController.loadingIndex.value ==
                                        index &&
                                    counterOfferController.isStatusLoading
                                ? const CustomLoadingAPI().marginSymmetric(
                                    horizontal:
                                        Dimensions.marginSizeHorizontal * 0.5,
                                  )
                                : _customButtonWidget(
                                    title: Strings.accept,
                                    onTap: () {
                                      _onAcceptProcess();
                                    },
                                  ),
                          ),
                        ],
                      ] else ...[
                        _customButtonWidget(
                          title: Strings.sold,
                          onTap: () {},
                        ),
                      ],
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  // statusInfo() {
  //   switch (getOffer.status) {
  //     case 2:
  //       return _customStatusWidget(color: CustomColor.orangeColor);

  //     case 1:
  //       return _customStatusWidget(color: CustomColor.greenColor);
  //     case 3:
  //       return _customStatusWidget(color: CustomColor.redColor);
  //     case 4:
  //       return _customStatusWidget(color: CustomColor.redColor);
  //   }
  // }

  // _customStatusWidget({required Color color}) {
  //   return Container(
  //     margin: EdgeInsets.only(left: Dimensions.widthSize * 0.4),
  //     padding: EdgeInsets.all(Dimensions.paddingSize * 0.11),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
  //       color: color.withOpacity(0.2),
  //     ),
  //     child: TitleHeading5Widget(
  //       text: getOffer.status == 1
  //           ? Strings.accept
  //           : getOffer.status == 2
  //               ? Strings.pending
  //               : getOffer.status == 3
  //                   ? Strings.sold
  //                   : Strings.rejected,
  //       fontSize: Dimensions.headingTextSize6,
  //       color: color,
  //     ),
  //   );
  // }

  _customButtonWidget({
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.widthSize * 1.2,
          vertical: Dimensions.heightSize * 0.4,
        ),
        alignment: Alignment.center,
        height: Dimensions.heightSize * 2.5,
        decoration: ShapeDecoration(
          color: title == Strings.reject ||
                  title == Strings.sold ||
                  title == Strings.rejected
              ? CustomColor.redColor
              : title == Strings.counterOffer
                  ? CustomColor.orangeColor
                  : Theme.of(Get.context!).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius * 0.4),
          ),
        ),
        child: TitleHeading4Widget(
          text: title,
          fontWeight: FontWeight.w600,
          color: CustomColor.whiteColor,
        ),
      ),
    );
  }

  _onCounterOfferProcessMethod() {
    /// >>> get is counter offer
    if (getOffer.tradeStatus == 1) {
      if (getOffer.receiverId == LocalStorage.getId() &&
          getOffer.status != 4 &&
          getOffer.status != 1) {
        counterOfferController.isCounterOffer.value = true;
      } else {
        counterOfferController.isCounterOffer.value = false;
      }
    } else {
      counterOfferController.isCounterOffer.value = false;
    }

    /// >>> get seller information
    counterOfferController.sellerName.value = getOffer.creatorName;
    counterOfferController.isVerified.value =
        (getOffer.emailVerified == 1 && getOffer.kycVerified == 1)
            ? true
            : false;

    /// >>> get rate amount and currency from get offer list
    counterOfferController.rateCurrency.value = getOffer.rateCurrencyCode;
    counterOfferController.rateAmount.value = getOffer.tradeRate.toDouble;
    counterOfferController.rateController.text = getOffer.tradeRate;

    /// >>> get sell amount and currency from get offer list
    counterOfferController.sellAmount.value = getOffer.tradeAmount.toDouble;
    counterOfferController.sellCurrency.value = getOffer.saleCurrencyCode;
    counterOfferController.amountController.text = getOffer.tradeAmount;

    /// >>> get counter offer sell and rate from get offer list
    counterOfferController.counterSellAmount.value = getOffer.amount.toDouble;
    counterOfferController.counterRateAmount.value = getOffer.rate.toDouble;

    /// >>> get tarde id for counter offer [-- Required --]
    counterOfferController.tradeId.value = getOffer.tradeId.toString();
    counterOfferController.targetId.value = getOffer.id.toString();

    /// >>> get tarde id for receiver id offer [-- Required --]
    counterOfferController.receiverId.value = getOffer.receiverId.toString();

    /// >>> get creator id for counter offer [-- Required --]
    counterOfferController.creatorId.value = getOffer.creatorId.toString();
    debugPrint(counterOfferController.isCounterOffer.value.toString());
    Routes.makeCounterOfferScreen.toNamed;
  }

  void _onAcceptProcess() {
    /// >>> get target id for accept others offer [-- Required --]
    counterOfferController.targetId.value = getOffer.id.toString();
    counterOfferController.loadingIndex.value = index;

    /// >>> accept process
    counterOfferController.offerStatusProcessApi('Accept');
  }
}
