import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/article_model.dart';
import 'package:news_app/model/news_model.dart';

class Controller extends GetxController {

  List<ArticleModel> allNews = <ArticleModel>[];
    TextEditingController searchController = TextEditingController();

  List<ArticleModel> breakingNews = <ArticleModel>[];
  ScrollController scrollController = ScrollController();
  RxBool articleNotFound = false.obs;
  RxBool isLoading = false.obs;
  RxString cName = ''.obs;
  RxString country = ''.obs;
  RxString category = ''.obs;
  RxString channel = ''.obs;
  RxString searchNews = ''.obs;
  RxInt pageNum = 1.obs;
  // RxInt pageSize = 10.obs;

  String baseUrl = "https://newsapi.org/v2/top-headlines?";



  getAllNewsFromApi(url) async {

    http.Response res = await http.get(Uri.parse(url));

    
  if (res.statusCode == 200) {
   NewsModel newsData = NewsModel.fromJson(jsonDecode(res.body));
if (newsData.articles.isEmpty && newsData.totalResults == 0) {
      articleNotFound.value = true; 
      isLoading.value = false;
      update();
    } else {
      allNews = [...allNews, ...newsData.articles];
      articleNotFound.value = false; 
      update();
    }
  } else {
    articleNotFound.value = true; 
    update();
  }
  }


  // ----------------------------------

  // function to load and display all news and searched news on to UI
getAllNews({channel = '', searchKey = '', reload = false}) async {
 articleNotFound.value = false;

 if (!reload && isLoading.value == false) {
 } else {
   country.value = '';
   category.value = '';
 }
 if (isLoading.value == true) {
   pageNum++;
 } else {
   allNews = [];

   
 }
 // ENDPOINT
 baseUrl = "https://newsapi.org/v2/top-headlines?pageSize=18&page=${Random(10)}&";
 // default country is set to India
 baseUrl += country.isEmpty ? 'country=in&' : 'country=$country&';
 // default category is set to Business
 baseUrl +=  'category=business&' ;
 baseUrl += 'apiKey=${NewsApiConstants.newsApiKey}';

 if (searchKey != '') {
   country.value = '';
   category.value = '';
   baseUrl =
// https://newsapi.org/v2/everything?q=$tesla&sortBy=popularity&pageSize=10&apiKey=f6fa67f5f2f5452c910242d1fa3312c5
       "https://newsapi.org/v2/everything?q=$searchKey&sortBy=popularity&pageSize=15&apiKey=${NewsApiConstants.newsApiKey}";
 }
 print(baseUrl);
 // calling the API function and passing the URL here
 getAllNewsFromApi(baseUrl);
}
}


class NewsApiConstants{

static String newsApiKey='503e1c379dab4870964d724ba2a7660e';

}