import 'dart:convert';

import 'package:comet_labs_task/Utils/constants.dart';
import 'package:http/http.dart' as http;

import '../Models/NewsModel.dart';

class NewsApiClient {
  final String baseUrl = "https://newsapi.org/v2/top-headlines";
  final String apiKey = NEWS_API_KEY;

  Future<NewsModel> fetchTopHeadlines() async {
    try {
      final response = await http.get(
        Uri.parse("$baseUrl?country=us&apiKey=$apiKey&pageSize=10"),
      );

      if (response.statusCode == 200) {
        return NewsModel.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load top headlines');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
