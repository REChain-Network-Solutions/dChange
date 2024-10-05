part of '../get_offer/get_offer_screen.dart';

class GetOfferMobileScreenLayout extends StatelessWidget {
  const GetOfferMobileScreenLayout({
    super.key,
    required this.controller,
  });

  final GetOfferController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(Strings.getOffer),
      body: Obx(
        () => controller.isLoading
            ? const CustomLoadingAPI()
            : _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return RefreshIndicator(
      color: Theme.of(context).primaryColor,
      onRefresh: () async {
        controller.getOffersProcessApi();
      },
      child: AnimationLimiter(
        child: controller.getOfferModel.data.getOffers.isEmpty
            ? const Center(
                child: TitleHeading3Widget(text: Strings.onOfferFound))
            : ListView(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                children: List.generate(
                  controller.getOfferModel.data.getOffers.length,
                  (index) => CustomListViewAnimation(
                    index: index,
                    child: GetOfferWidget(
                      index: index,
                      getOffer: controller.getOfferModel.data.getOffers[index],
                      imagePath: controller.getOfferModel.data.imagePath,
                      defaultImage: controller.getOfferModel.data.defaultImage,
                      controller: controller,
                    ),
                  ),
                ),
              ),
      ).paddingSymmetric(horizontal: Dimensions.marginSizeHorizontal * 0.8),
    );
  }
}
