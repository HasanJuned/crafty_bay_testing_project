import 'package:crafty_bay_testing_project/presentation/state_holders/main_bottom_nav_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/category_card_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
          onPressed: (){
            Get.find<MainBottomNavBarController>().backToHome();
          },
        ),

      ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
                itemCount: 30,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,
            mainAxisSpacing: 16, crossAxisSpacing: 16), itemBuilder: (context, index){
              return const FittedBox(
                child: Icon(Icons.add),
              );
            }),
          ),
        ),
    );
  }
}

