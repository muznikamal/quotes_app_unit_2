import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quotes_app_unit_2/models/quote_api_model.dart';

class QuotesRepository {
  Future<List<QuoteApi>> getRandomQuotes() async {
    String url = "https://api.quotable.io";
    String endpoint = "/quotes/random?limit=20";

    final response = await http.get(Uri.parse(url + endpoint));

    if (response.statusCode != 200) {
      throw "Ada Error";
    }

    //if success
    List dataJson = jsonDecode(response.body);

    List<QuoteApi> quotes = [];

    for (var item in dataJson) {
      QuoteApi quote = QuoteApi.fromJson(item);
      quotes.add(quote);
    }

    print(dataJson);
    return quotes;
  }
}
