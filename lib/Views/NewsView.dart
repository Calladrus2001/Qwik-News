import 'package:comet_labs_task/Controllers/NewsController.dart';
import 'package:comet_labs_task/Models/NewsModel.dart';
import 'package:comet_labs_task/Utils/colors.dart';
import 'package:comet_labs_task/Utils/widgets/CentralProgressIndicator.dart';
import 'package:comet_labs_task/Utils/widgets/NewsCard.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Qwik News",
                        style: TextStyle(
                            color: primaryAccent,
                            letterSpacing: -1,
                            fontWeight: FontWeight.w700,
                            fontSize: 28)),
                    CircleAvatar(
                      minRadius: 20,
                      backgroundColor: Colors.grey.shade100,
                      child: GestureDetector(
                        child: Icon(
                          Icons.search,
                          color: Colors.grey.shade700,
                        ),
                        onTap: () {
                          //TODO: Search
                        },
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: FutureBuilder<NewsModel>(
                    future: NewsApiClient().fetchTopHeadlines(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CentralProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Center(child: Column(
                          children: [
                            const Expanded(child: SizedBox(height: 1)),
                            const Text("Oops! Something went wrong.", style: TextStyle(color: Colors.grey)),
                            GestureDetector(
                              child: Chip(
                                label: Text("Retry", style: TextStyle(color: primaryAccent)),
                                backgroundColor: Colors.white,
                                elevation: 2.0,
                              ),
                              onTap: ()  {
                                NewsApiClient().fetchTopHeadlines();
                                setState(() {});
                              },
                            ),
                            const Expanded(child: SizedBox(height: 1)),
                          ],
                        ));
                      } else {
                        return ListView.builder(
                          itemCount: snapshot.data?.articles.length ?? 0,
                          itemBuilder: (context, index) {
                            final article = snapshot.data!.articles[index];
                            return NewsCard(article: article);
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
            Positioned(left: 1, right: 1, bottom: 8,
                child: GestureDetector(
                  child: CircleAvatar(minRadius: 20, backgroundColor: primaryAccent,
                      child: Icon(Icons.refresh, color: Colors.white)),
                  onTap: (){
                    NewsApiClient().fetchTopHeadlines();
                    setState(() {});
                  },
                )
            )
          ],

        ),
      ),
    );
  }
}
