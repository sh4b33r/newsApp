
import 'package:flutter/material.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/model/news_model.dart';

class NewsDetailPage extends StatelessWidget {
  
  final String imageUrl;
  
  final ArticleModel news;
  const NewsDetailPage({
    super.key,
    required this.news,
    
    this.imageUrl = '',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Detail"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

 Padding(
   padding: const EdgeInsets.only(bottom: 10),
   child: ClipRRect(
                 borderRadius: const BorderRadius.only(
                     topLeft: Radius.circular(10),
                     topRight: Radius.circular(10)),
                 child: Image.network(
                   news.urlToImage.toString(),
                   height: 220,
                   width: MediaQuery.of(context).size.width,
                   fit: BoxFit.fill,
              
                   errorBuilder: (BuildContext context, Object exception,
                       StackTrace? stackTrace) {
                     return Card(
                       elevation: 0,
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(10)),
                       child: const SizedBox(
                         height: 200,
                         width: double.infinity,
                         child: Icon(Icons.broken_image_outlined),
                       ),
                     );
                   },
                 )),
 ),


            Text(
              news.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              news.publishedAt.substring(0,10),
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            Text(
              news.author.toString(),
              style: TextStyle(
                fontSize: 17,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16),
            if (imageUrl.isNotEmpty)
              Image.network(
                imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            SizedBox(height: 16),
            Text(
              news.description.toString(),
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}