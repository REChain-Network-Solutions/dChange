import 'package:dchange/controller/add_money/add_money_controller.dart';
import 'package:dchange/extensions/custom_extensions.dart';
import 'package:dchange/utils/basic_screen_imports.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../routes/routes.dart';

class AddMoneyManualPaymentScreen extends StatelessWidget {
  AddMoneyManualPaymentScreen({super.key});

  final controller = Get.put(AddMoneyController());
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
            _descriptionWidget(context),
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
              Routes.addMoneyPreviewScreen.toNamed;
            }
          },
        ),
      ),
    );
  }

  _descriptionWidget(BuildContext context) {
    final data = controller.addMoneyManualInsertModel.data;
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.paddingSize * 0.5,
        horizontal: Dimensions.paddingSize * 0.2,
      ),
      margin:
          EdgeInsets.symmetric(vertical: Dimensions.marginSizeVertical * 0.4),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(Dimensions.radius),
        border: Border.all(
          width: 0.8,
          color: Theme.of(context).primaryColor.withOpacity(0.3),
        ),
      ),
      child: Html(
        data: data.details,
      ),
    );
  }
}
