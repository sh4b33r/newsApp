import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/controller/fetchnews_contr.dart';
import 'package:news_app/view/custom_card.dart';
import 'package:news_app/view/det_view.dart';

class Mainscreen extends StatelessWidget {
  const Mainscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cont=Get.put(Controller());
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.black,
        title:  Text('News App',style:GoogleFonts.montserrat(fontSize:20,color:Colors.white)),),
      body: RefreshIndicator(
        color: Colors.black,
        onRefresh: (){

     return cont.getAllNews();

        },
        child: ListView(
          children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Flexible(
                          fit: FlexFit.tight,
                          flex: 3,
                          child: Material(
                            child: TextField(
                              controller:cont.searchController,
                              textInputAction: TextInputAction.search,
                             
                                   decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          
                                            borderRadius: BorderRadius.circular(20),
                                            borderSide: BorderSide.none),
                                        filled: true,
                                        fillColor: Color.fromARGB(255, 246, 237, 237),
                                        hintText: 'Search News',
                                        suffixIcon: IconButton(
                                          onPressed: () async {
                            cont.getAllNews(
                                searchKey: cont.searchNews.value);
                          cont.searchController.clear();
                          },
                                      icon: Icon(Icons.search)),
                                        hintStyle:GoogleFonts.hammersmithOne(),
                                      ),
                              onChanged: (val) {
                              cont.searchNews.value = val;
                             cont.update();
                              },
                              onSubmitted: (value) async {
                               cont.searchNews.value = value;
                                cont.getAllNews(
                                    searchKey: cont.searchNews.value);
                                cont.searchController.clear();
                              },
                            ),
                          ),
                        ),
              ),
                GetBuilder<Controller>(
                init: Controller(),
                builder: (controller) {
                  return controller.articleNotFound.value
                      ? const Center(
                          child: Text('Nothing Found'),
                        )
                      : controller.allNews.isEmpty
                          ? const Center(child: CupertinoActivityIndicator())
                          : ListView.builder(
                              controller: controller.scrollController,
                              // physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.allNews.length,
                              itemBuilder: (context, index) {
                                index == controller.allNews.length - 1 &&
                                        controller.isLoading.value
                                    ? const Center(
                                        child: CupertinoActivityIndicator(),
                                      )
                                    : const SizedBox();
                                return InkWell(
                                   onTap: () => Get.to(() => NewsDetailPage(
                                       news: controller.allNews[index],
                                       
                                       )),
                                  child: NewsCard(
                                      imgUrl:
                                          controller.allNews[index].urlToImage ?? '',
                                      desc:
                                          controller.allNews[index].description ?? '',
                                      title: controller.allNews[index].title,
                                      content:
                                          controller.allNews[index].content ?? '',
                                      postUrl: controller.allNews[index].url,
                                      publishedAt: controller.allNews[index].publishedAt,
                                      ),
                                );
                              });
                }),
              ],
        ),
      ),
    );
  }
}
