import 'package:crafty_bay_testing_project/presentation/ui/utility/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SvgPicture.asset(ImageAssets.craftyBayLogoSvg, height: 100, width: 100,),
            ),
            const SizedBox(height: 8,),
            const Text(
              'Complete Profile',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, letterSpacing: 1),
            ),
            const SizedBox(height: 4,),
            const Text(
              'Get started with us with your details',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.1, color: Colors.grey),
            ),
            const SizedBox(height: 4,),
          ],
        ),
      ),
    );
  }
}
