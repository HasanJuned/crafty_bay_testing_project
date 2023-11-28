import 'package:crafty_bay_testing_project/presentation/ui/screens/player_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/design_number_pad_widgets.dart';

class PowerPlayScreen extends StatefulWidget {
  const PowerPlayScreen({Key? key}) : super(key: key);

  @override
  State<PowerPlayScreen> createState() => _PowerPlayScreenState();
}

class _PowerPlayScreenState extends State<PowerPlayScreen> {
  int count = 0;
  bool ami = false;
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      appBar: AppBar(
        backgroundColor: Colors.white24,
        title: const Text('Start Power Play Overs'),
        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for(int i=0; i<3; i++)
                      DesignNumberPadWidgets(

                      ),


                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          count++;
                          // print(count);
                          Get.to(PlayerScreen());
                        },
                        child: const Text('Done'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
