import 'package:comet_labs_task/Controllers/NewsController.dart';
import 'package:comet_labs_task/Models/NewsModel.dart';
import 'package:comet_labs_task/Utils/colors.dart';
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
        child: Column(
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
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
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
      ),
    );
  }
}
