import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:map_app/core/utils/color_resources.dart';
import 'package:map_app/core/utils/dimensions.dart';
import 'package:map_app/core/utils/local_strings.dart';
import 'package:map_app/core/utils/style.dart';
import 'package:map_app/data/controller/auth/otp/otp_controller.dart';
import 'package:map_app/view/screens/auth/onBoarding/components/header.dart';
import 'package:map_app/view/screens/auth/onBoarding/components/screen_title.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: GetBuilder<OtpController>(
          builder: (controller) => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Dimensions.space60),
                Header(),
                LoginTitle(title: LocalStrings.otp.tr, subtitle: LocalStrings.otpText.tr),
                const SizedBox(height: Dimensions.space40),
                OtpTextField(
                  numberOfFields: 6,
                  borderRadius: BorderRadius.circular(Dimensions.space10),
                  filled: true,
                  keyboardType: TextInputType.number,
                  fillColor: ColorResources.primaryColor.withAlpha(9),
                  focusedBorderColor: ColorResources.primaryColor,
                  showFieldAsBox: true,
                  onCodeChanged: (String code) {},
                  onSubmit: (String verificationCode) {
                    controller.onSubmit(verificationCode);
                  }, // end onSubmit
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(
                      LocalStrings.otpDesc.tr,
                      textAlign: TextAlign.center,
                      style: mediumDefault.copyWith(
                        fontSize: Dimensions.fontDefault,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      LocalStrings.didNotGetOtp.tr,
                      overflow: TextOverflow.ellipsis,
                      style: mediumDefault.copyWith(
                        color: Theme.of(context).textTheme.bodyMedium!.color!,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextButton(
                      onPressed: controller.isButtonEnabled ? controller.onRequestAgain : (){},
                      child: Text(
                        LocalStrings.requestAgain.tr+controller.timerText,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: mediumDefault.copyWith(
                            // color: ColorResources.secondaryColor,
                          color: controller.isButtonEnabled ? ColorResources.secondaryColor : Colors.grey,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
