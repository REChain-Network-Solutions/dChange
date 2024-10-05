part of '../home/home_screen.dart';

class HomeMobileScreenLayout extends StatelessWidget {
  HomeMobileScreenLayout({
    super.key,
    required this.controller,
  });

  final HomeController controller;
  final formKey = GlobalKey<FormState>();
  final currency = Get.put(CurrencyController());
  final navigationController = Get.put(NavigationController());
  final getOfferController = Get.put(GetOfferController());
  final marketplaceController = Get.put(MarketplaceController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => currency.isLoading ||
                getOfferController.isLoading ||
                marketplaceController.isLoading
            ? const CustomLoadingAPI()
            : _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        RefreshIndicator(
          color: Theme.of(context).primaryColor,
          triggerMode: RefreshIndicatorTriggerMode.anywhere,
          onRefresh: () async {
            currency.getCurrencyApiProcess();
          },
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.47,
            child: ListView(
              children: [
                _myWalletWidget(context),
                _marketplaceWidget(context),
              ],
            ),
          ),
        ),
        _getOfferWidget(context),
      ],
    );
  }

  _myWalletWidget(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        Routes.myWalletScreen.toNamed;
      },
      child: Column(
        children: [
          Row(
            crossAxisAlignment: crossCenter,
            mainAxisAlignment: mainSpaceBet,
            children: const [
              TitleHeading3Widget(text: Strings.myWallet),
            ],
          ).paddingSymmetric(horizontal: Dimensions.marginSizeHorizontal),
          verticalSpace(Dimensions.heightSize * 0.8),
          _currencyWidget(context),
        ],
      ),
    );
  }

  _currencyWidget(context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimensions.marginSizeHorizontal),
      padding: EdgeInsets.all(Dimensions.paddingSize * 0.67),
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
        ),
      ),
      child: FittedBox(
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(Dimensions.paddingSize),
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    currency.flagImagePath.value,
                  ),
                  fit: BoxFit.fill,
                ),
                color: Theme.of(context).colorScheme.background,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
                ),
              ),
            ),
            horizontalSpace(Dimensions.widthSize * 1.7),
            Column(
              crossAxisAlignment: crossStart,
              children: [
                TitleHeading4Widget(
                  text: currency.currencyModel.data.wallet.name,
                  color: CustomColor.secondaryLightTextColor,
                  fontWeight: FontWeight.w500,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text:
                            currency.currencyModel.data.wallet.balance == "0.00"
                                ? "0.0000000000"
                                : currency.currencyModel.data.wallet.balance,
                        style: Get.isDarkMode
                            ? CustomStyle.darkHeading1TextStyle.copyWith(
                                fontWeight: FontWeight.w700,
                              )
                            : CustomStyle.lightHeading1TextStyle.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                      ),
                      WidgetSpan(child: horizontalSpace(Dimensions.widthSize)),
                      TextSpan(
                        text: currency.currencyModel.data.wallet.code,
                        style: CustomStyle.lightHeading1TextStyle.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  _marketplaceWidget(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: Dimensions.marginBetweenInputBox,
            horizontal: Dimensions.marginSizeHorizontal,
          ),
          child: Row(
            crossAxisAlignment: crossCenter,
            mainAxisAlignment: mainSpaceBet,
            children: [
              const TitleHeading3Widget(text: Strings.marketplace),
              InkWell(
                onTap: () {
                  navigationController.selectedIndex.value = 1;
                },
                child: TitleHeading5Widget(
                  text: Strings.viewAll,
                  fontSize: Dimensions.headingTextSize6,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.275,
          child: marketplaceController
                  .marketplaceInfoModel.data.trads.data.isEmpty
              ? Row(
                  mainAxisAlignment: mainCenter,
                  children: const [
                    TitleHeading3Widget(text: Strings.noTradeFound),
                  ],
                )
              : ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    marketplaceController
                        .marketplaceInfoModel.data.trads.data.length,
                    (index) {
                      int lastIndex = marketplaceController
                              .marketplaceInfoModel.data.trads.data.length -
                          1;
                      return Padding(
                        padding: index == 0
                            ? EdgeInsets.only(
                                left: Dimensions.marginSizeHorizontal * 0.666)
                            : lastIndex == index
                                ? EdgeInsets.only(
                                    right: Dimensions.marginSizeHorizontal)
                                : EdgeInsets.zero,
                        child: _marketPlaceWidget(
                          context,
                          marketplaceController
                              .marketplaceInfoModel.data.trads.data[index],
                          index,
                        ),
                      );
                    },
                  ),
                ),
        )
      ],
    );
  }

  _marketPlaceWidget(BuildContext context, Datum data, int index) {
    return Container(
      margin: EdgeInsets.only(left: Dimensions.widthSize * 0.8),
      child: Stack(
        children: [
          Container(
            decoration: ShapeDecoration(
              color: Theme.of(context).colorScheme.background,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(Dimensions.paddingSize * 1.5),
                  child: Column(
                    children: [
                      _amountWidget(
                          context, data.amount, data.saleCurrency.code),
                      CustomImageWidget(path: Assets.icon.sort),
                      _amountWidget(context, data.rate, data.rateCurrency.code),
                    ],
                  ),
                ),
                _userProfileWidget(context, data)
              ],
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                vertical: Dimensions.marginSizeVertical * 0.2,
              ),
              decoration: ShapeDecoration(
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius),
                  ),
                ),
              ),
              child: TitleHeading3Widget(
                text: data.exchangeRate,
                color: CustomColor.whiteColor,
              ),
            ),
          ),
          Positioned(
            bottom: Dimensions.heightSize * 5,
            child: Container(
              height: 1.5,
              width: Dimensions.widthSize * 25,
              color: Theme.of(context).scaffoldBackgroundColor,
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
                  )
                : CustomStyle.lightHeading1TextStyle.copyWith(
                    fontWeight: FontWeight.w700,
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
            ),
          ),
        ],
      ),
    );
  }

  _userProfileWidget(BuildContext context, Datum data) {
    final userImageSet = "${data.baseUr}/${data.imagePath}/${data.user.image}";
    final defaultImagePath = "${data.baseUr}/${data.defaultImage}";
    final userImage = data.user.image != '' ? userImageSet : defaultImagePath;
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          backgroundImage: NetworkImage(userImage),
        ),
        horizontalSpace(Dimensions.widthSize * 0.8),
        Column(
          crossAxisAlignment: crossStart,
          children: [
            TitleHeading4Widget(
              text: data.user.name,
              opacity: 0.60,
              fontWeight: FontWeight.w500,
            ),
            TitleHeading4Widget(
              text: data.user.emailVerified == 1 && data.user.kycVerified == 1
                  ? Strings.verified
                  : Strings.unVerified,
              fontSize: Dimensions.headingTextSize6,
              color: data.user.emailVerified == 1 && data.user.kycVerified == 1
                  ? Theme.of(context).primaryColor
                  : CustomColor.redColor,
            ),
          ],
        )
      ],
    );
  }

  _getOfferWidget(BuildContext context) {
    return Column(
      mainAxisSize: mainMin,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: Dimensions.marginBetweenInputBox,
            horizontal: Dimensions.marginSizeHorizontal,
          ),
          child: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              Routes.getOfferScreen.toNamed;
            },
            child: Row(
              crossAxisAlignment: crossCenter,
              mainAxisAlignment: mainSpaceBet,
              children: [
                const TitleHeading3Widget(text: Strings.getAnOffer),
                InkWell(
                  onTap: () {
                    Routes.getOfferScreen.toNamed;
                  },
                  child: TitleHeading5Widget(
                    text: Strings.viewAll,
                    fontSize: Dimensions.headingTextSize6,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),

        ///* Offer section
        Container(
          // height: MediaQuery.sizeOf(context).height * 0.25,
          padding: EdgeInsets.symmetric(
            vertical: Dimensions.marginSizeVertical * 0.7,
            horizontal: Dimensions.marginSizeVertical * 0.9,
          ),
          decoration: ShapeDecoration(
            color: Theme.of(context).colorScheme.background,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius * 3),
                topRight: Radius.circular(Dimensions.radius * 3),
              ),
            ),
          ),
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.23,
            child: AnimationLimiter(
              child: getOfferController.getOfferModel.data.getOffers.isNotEmpty
                  ? ListView(
                      physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics(),
                      ),
                      children: List.generate(
                        getOfferController.getOfferModel.data.getOffers.length <
                                5
                            ? getOfferController
                                .getOfferModel.data.getOffers.length
                            : 5,
                        (index) => CustomListViewAnimation(
                          index: index,
                          child: GetOfferWidget(
                            isWhiteColor: false,
                            index: index,
                            getOffer: getOfferController
                                .getOfferModel.data.getOffers[index],
                            imagePath:
                                getOfferController.getOfferModel.data.imagePath,
                            defaultImage: getOfferController
                                .getOfferModel.data.defaultImage,
                            controller: getOfferController,
                          ),
                        ),
                      ),
                    )
                  : Row(
                      mainAxisAlignment: mainCenter,
                      children: const [
                        TitleHeading3Widget(text: Strings.onOfferFound),
                      ],
                    ).paddingOnly(bottom: Dimensions.marginSizeVertical * 2),
            ),
          ),
        )
      ],
    );
  }
}
