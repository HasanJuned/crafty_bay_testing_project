import 'package:crafty_bay_testing_project/presentation/state_holders/complete_profile_controller.dart';
import 'package:crafty_bay_testing_project/presentation/state_holders/otp_verification_controller.dart';
import 'package:crafty_bay_testing_project/presentation/ui/utility/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _shippingAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SvgPicture.asset(
                    ImageAssets.craftyBayLogoSvg,
                    height: 100,
                    width: 100,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Complete Profile',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  'Get started with us with your details',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.1,
                      color: Colors.grey),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(hintText: 'Full Name'),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _mobileNumberController,
                  decoration: const InputDecoration(hintText: 'Mobile Number'),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _cityController,
                  decoration: const InputDecoration(hintText: 'City'),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  maxLines: 5,
                  controller: _shippingAddressController,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(8.0),
                      hintText: 'Shipping Address'),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: double.infinity,
                  child: GetBuilder<CompleteProfileController>(
                      builder: (completeProfileController) {
                    return ElevatedButton(
                      onPressed: () async {
                        final response =
                            await completeProfileController.completeProfile(
                          Get.find<OtpVerificationController>().token,
                          _nameController.text,
                          _shippingAddressController.text,
                          _cityController.text,
                          _cityController.text,
                          _cityController.text,
                          "Bangladesh",
                          _mobileNumberController.text,
                          _mobileNumberController.text,
                        );

                        if(response){
                          if (mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.green,
                                content: Text('Create Profile Success'),
                              ),
                            );
                          }

                        }else{
                          if (mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.redAccent,
                                content: Text('Create Profile Failed! Try again'),
                              ),
                            );
                          }
                        }

                      },
                      child: const Text("Complete"),
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
}
