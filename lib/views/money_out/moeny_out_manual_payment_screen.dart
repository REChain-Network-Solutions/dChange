import 'package:dchange/controller/money_out/money_out_controller.dart';
import 'package:dchange/extensions/custom_extensions.dart';
import 'package:dchange/utils/basic_screen_imports.dart';

import '../../../routes/routes.dart';

class MoneyOutManualPaymentScreen extends StatelessWidget {
  MoneyOutManualPaymentScreen({super.key});

  final controller = Get.put(MoneyOutController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(Strings.evidenceNote),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSize * 0.7,
        vertical: Dimensions.paddingSize * 0.7,
      ),
      child: Form(
        key: formKey,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            // _descriptionWidget(context),
            ...controller.inputFields.map((element) {
              return element;
            }),
            _buttonWidget(context)
          ],
        ),
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimensions.marginSizeVertical),
      child: Obx(
        () => PrimaryButton(
          isLoading: controller.isConfirmLoading,
          title: Strings.submit,
          onPressed: () {
            if (formKey.currentState!.validate()) {
              Routes.moneyOutPreviewScreen.toNamed;
            }
          },
        ),
      ),
    );
  }
}
