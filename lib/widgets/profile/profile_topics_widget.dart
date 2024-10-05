// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../../views/profile/profile_screen.dart';

class ProfileTopicWidget extends StatelessWidget {
  const ProfileTopicWidget({
    super.key,
    required this.controller,
  });
  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        controller.topicList.length,
        (i) => topicSwitch(controller.topicList[i]),
      ),
    );
  }

  topicSwitch(type) {
    switch (type) {
      case TopicType.updateProfile:
        return TopicWidget(
          imagePath: Assets.icon.user,
          title: Strings.updateProfile,
          onTap: () {
            controller.onUpdateProfile;
          },
        );
      case TopicType.myWallet:
        return TopicWidget(
          imagePath: Assets.icon.myWallet,
          title: Strings.myWallet,
          onTap: () {
            controller.onMyWallet;
          },
        );
      case TopicType.mySpace:
        return TopicWidget(
          imagePath: Assets.icon.fresh,
          title: Strings.myTrade,
          onTap: () {
            controller.onMySpace;
          },
        );
      case TopicType.getOffer:
        return TopicWidget(
          imagePath: Assets.icon.discountShape,
          title: Strings.getOffer,
          onTap: () {
            controller.onGetOffer;
          },
        );
      case TopicType.feeCalculator:
        return TopicWidget(
          imagePath: Assets.icon.calculator,
          title: Strings.feeCalculator,
          onTap: () {
            controller.onFeeCalculator;
          },
        );
    }
  }
}

class TopicWidget extends StatelessWidget {
  final String imagePath, title;
  final VoidCallback onTap;
  const TopicWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: Dimensions.marginBetweenInputTitleAndBox,
        left: Dimensions.marginSizeHorizontal * 1.5,
        right: Dimensions.marginSizeHorizontal * 1.5,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSize * 0.84,
        vertical: Dimensions.paddingSize * 0.5,
      ),
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(Dimensions.paddingSize * 0.24),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
              ),
              child: CustomImageWidget(
                path: imagePath,
                height: Dimensions.heightSize * 1.8,
                width: Dimensions.widthSize * 2,
                color: CustomColor.whiteColor,
              ),
            ),
            horizontalSpace(Dimensions.widthSize * 1.6),
            TitleHeading3Widget(
              text: title,
              fontWeight: FontWeight.w600,
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.all(Dimensions.paddingSize * 0.15),
              decoration: ShapeDecoration(
                shape: OvalBorder(
                  side: BorderSide(
                    width: 2,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              child: Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context).primaryColor,
                size: Dimensions.heightSize,
              ),
            )
          ],
        ),
      ),
    );
  }
}

enum TopicType { updateProfile, myWallet, mySpace, getOffer, feeCalculator }
