import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsCard extends StatelessWidget {
  final String imgUrl, title, desc, content, postUrl,publishedAt;

  const NewsCard(
      {Key? key,
      required this.imgUrl,
      required this.desc,
      required this.title,
      required this.content,
      required this.postUrl,
      required this.publishedAt,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
          child: Container(
        decoration: BoxDecoration(
            border: Border.fromBorderSide(BorderSide(
                style: BorderStyle.solid,
                color: const Color.fromARGB(255, 175, 174, 174))),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                spreadRadius: -5,
                blurRadius: 10,
                offset: Offset(10, 0), // Shadow only on the right side
              ),
            ],
            color: Color.fromARGB(255, 255, 255, 255)),
        // height: 310,
        child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, top: 10, bottom: 3,right: 5),
                                    child: ClipRRect(
                                               borderRadius: const BorderRadius.only(
                                                   topLeft: Radius.circular(10),
                                                   bottomRight: Radius.circular(10)),
                                               child: Image.network(
                                                 imgUrl,
                                                 height: 150,
                                               width: MediaQuery.of(context).size.width,
                                                 fit: BoxFit.cover,
                                               
                                                 errorBuilder: (BuildContext context, Object exception,
                                                     StackTrace? stackTrace) {
                                                   return Card(
                                                    color: Colors.black,
                                                     elevation: 0,
                                                     shape: RoundedRectangleBorder(
                                                         borderRadius: BorderRadius.circular(10)),
                                                     child: const SizedBox(
                                                       height: 200,
                                                       width: double.infinity,
                                                       child: Icon(Icons.broken_image_outlined,color: Colors.white,),
                                                     ),
                                                   );
                                                 },
                                               )),

                                  ),
                                   Padding(
             padding: const EdgeInsets.all(6),
             child: Text(
               title,
               maxLines: 2,
               style: const TextStyle(
                   color: Colors.black87,
                   fontSize: 20,
                   fontWeight: FontWeight.w500),
             ),
           ),
           Padding(
             padding: const EdgeInsets.only(left: 7,right: 10),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(publishedAt.substring(0,10),style: GoogleFonts.montserrat(),),

                 Text(publishedAt.substring(11,16),style: GoogleFonts.montserrat(),),

               ],
             ),
           
      ),  Padding(
             padding: const EdgeInsets.all(6),
             child: Text(
               desc,
               maxLines: 2,
               style: const TextStyle(color: Colors.black54, fontSize: 14),
             ),)
      
      
      ])
                              ),
      ));
    

    
  }
}
