import 'package:comet_labs_task/Controllers/NewsController.dart';
import 'package:comet_labs_task/Models/NewsModel.dart';
import 'package:comet_labs_task/Utils/colors.dart';
import 'package:comet_labs_task/Utils/widgets/CentralProgressIndicator.dart';
import 'package:comet_labs_task/Utils/widgets/NewsCard.dart';
import 'package:comet_labs_task/Utils/widgets/SearchBar.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  bool searchResult = false;
  String query = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Stack(
          children: [
            Column(
              children: [
                Text("Qwik News",
                    style: TextStyle(
                        color: primaryAccent,
                        letterSpacing: -1,
                        fontWeight: FontWeight.w700,
                        fontSize: 28)),
                SearchBar(onSearch: _onSearch),
                Expanded(
                  child: FutureBuilder<NewsModel>(
                    future: searchResult
                        ? NewsApiClient().fetchNewsFromQuery(query)
                        : NewsApiClient().fetchTopHeadlines(),
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
                      child: const Icon(Icons.refresh, color: Colors.white)),
                  onTap: (){
                    NewsApiClient().fetchTopHeadlines();
                    setState(() {
                      searchResult = false;
                    });
                  },
                )
            )
          ],

        ),
      ),
    );
  }

  void _onSearch(String _query) {
    setState(() {
      query = _query;
      searchResult = true;
    });
  }
}
