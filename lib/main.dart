import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:news_app/controller/fetchnews_contr.dart';
import 'package:news_app/main_screen.dart';
import 'package:news_app/view/custom_card.dart';
import 'package:news_app/view/det_view.dart';
import 'package:news_app/view/spalsh_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Controller()).getAllNews();
    // Get.put(Controller()).getAllNewsFromApi('https://newsapi.org/v2/everything?domains=techcrunch.com,thenextweb.com&apiKey=f6fa67f5f2f5452c910242d1fa3312c5');
    return const GetMaterialApp(
    debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
