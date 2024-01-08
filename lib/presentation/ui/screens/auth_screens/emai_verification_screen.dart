import 'package:crafty_bay_testing_project/data/services/network_caller.dart';
import 'package:crafty_bay_testing_project/data/urls/urls.dart';
import 'package:crafty_bay_testing_project/presentation/state_holders/email_verification_controller.dart';
import 'package:crafty_bay_testing_project/presentation/ui/screens/main_bottom_nav_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailController = TextEditingController();
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
                Text('Welcome Back',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: 24)),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Please enter your email here',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 0.7),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  validator: (String? text) {
                    if (text?.isEmpty == true) {
                      return 'Enter email';
                    }
                    return null;
                  },
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                SizedBox(
                  width: double.infinity,
                  child: GetBuilder<EmailVerificationController>(
                      builder: (emailVerificationController) {
                    return ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          verifyEmail(emailVerificationController);
                        }
                      },
                      child: const Text('Next'),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> verifyEmail(
      EmailVerificationController emailVerificationController) async {
    final response =
        await emailVerificationController.verifyEmail(_emailController.text);

    if (response == true) {
      Get.to(const MainBottomNavBarScreen());
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text('Email Verification Failed! Try again'),
          ),
        );
      }
    }
  }
}
