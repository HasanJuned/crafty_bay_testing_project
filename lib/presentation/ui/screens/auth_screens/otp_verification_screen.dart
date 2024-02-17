import 'package:crafty_bay_testing_project/data/services/network_caller.dart';
import 'package:crafty_bay_testing_project/data/urls/urls.dart';
import 'package:crafty_bay_testing_project/presentation/state_holders/email_verification_controller.dart';
import 'package:crafty_bay_testing_project/presentation/ui/screens/main_bottom_nav_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../utility/app_colors.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SvgPicture.asset(
                    'assets/images/crafty_bay_logo.svg',
                    width: 100,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text('Enter OTP Code',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: 24)),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'A 6 digit OTP code sent to your email',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 0.2),
                ),
                const SizedBox(
                  height: 24,
                ),
                PinCodeTextField(
                  controller: _otpController,
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 50,
                    activeFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    activeColor: AppColors.primaryColor,
                    inactiveColor: AppColors.primaryColor,
                    selectedColor: Colors.green,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  onCompleted: (v) {},
                  onChanged: (value) {},
                  beforeTextPaste: (text) {
                    return true;
                  },
                  appContext: context,
                ),
                const SizedBox(
                  height: 2,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {

                    },
                    child: const Text('Next'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
