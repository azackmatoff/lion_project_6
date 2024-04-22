import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lion_project_6/common/constants/color/app_color.dart';
import 'package:lion_project_6/common/widgets/buttons/custom_button.dart';
import 'package:lion_project_6/common/widgets/custom_text.dart';
import 'package:lion_project_6/common/widgets/dialogs/custom_dialog.dart';
import 'package:lion_project_6/getx/contollers/getx_quiz_page_controller.dart';

class GetxQuizScreen extends StatelessWidget {
  GetxQuizScreen({super.key});

  final GetxQuizPageController controller = Get.put(GetxQuizPageController());

  @override
  Widget build(BuildContext context) {
    log('GetxQuizScreen');
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Obx(
                () => CustomText(text: controller.question.value),
              ),
              CustomButton(
                text: 'TRUE',
                onPressed: () => _checkAsnwer(context, true),
                backgroundColor: AppColor.green,
              ),
              CustomButton(
                text: 'FALSE',
                onPressed: () => _checkAsnwer(context, false),
                backgroundColor: AppColor.red,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),

                /// 1-chi versiyasi, kiskasi
                child: Obx(
                  () => controller.icons.isEmpty
                      ? const SizedBox()
                      : Row(
                          children: controller.icons,
                        ),
                ),

                /// 2-chi versiya, uzunu
                // child: Obx(() {
                //   if (controller.icons.isEmpty) {
                //     return const SizedBox();
                //   } else {
                //     return Row(
                //       children: controller.icons,
                //     );
                //   }
                // }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _checkAsnwer(BuildContext context, bool userAnswer) {
    final isOpenDialog = controller.checkAnswerAndOpenDialogIfNeeded(userAnswer: userAnswer);

    if (isOpenDialog) {
      _openDialog(context);
    }
  }

  void _openDialog(BuildContext context) {
    openDialog(
      context,
      () {
        controller.restart();

        Navigator.of(context).pop();

        /// GetX kodtorun UI'da koldonboso jakshi
        // Get.back(); =  Navigator.of(context).pop();
      },
    );
  }
}
