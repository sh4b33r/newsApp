
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';



import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/controller/fetchnews_contr.dart';
import 'package:news_app/main_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
     Future.delayed(Duration(seconds: 5), ()async {
    await Get.put(Controller()).getAllNews();
      Get.offAll(()=>Mainscreen());
    });
    return 
      
   Scaffold(
    
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
         Center(child:Lottie.asset('asset/Animation - 1713315765421.json',height: 170) ),
            Center(
              child: Text('News App',style: GoogleFonts.montserrat(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w600,
                      fontSize: MediaQuery.of(context).size.width * .042,
                    ),)
            )
            
          ],
        ),
      );
    
  }
}
