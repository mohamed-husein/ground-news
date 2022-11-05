class ApiConstants {
  /// Breaking News Api
  static const String breakingNewsPathUrl = 'https://newsdata.io/api/1/news';
  static const String breakingNewsApiKey =
      'pub_1295620e8a47e459b675112a499d13fbbdb85';
  static const String breakingNewsPath =
      '$breakingNewsPathUrl?apikey=$breakingNewsApiKey&q=pegasus&language=en';

  /// New Api
  static const String newsPathUrl = 'https://newsapi.org/v2';
  static const String newsApiKey = '85eb4acf6c9848b99078476de579bbc0';
  static const String sciencePath =
      '$newsPathUrl/top-headlines?country=us&category=science&apiKey=$newsApiKey';
  static const String sportsPath =
      '$newsPathUrl/top-headlines?country=us&category=sport&apiKey=$newsApiKey';
  static const String healthPath =
      '$newsPathUrl/top-headlines?country=us&category=health&apiKey=$newsApiKey';
  static const String businessPath =
      '$newsPathUrl/top-headlines?country=us&category=business&apiKey=$newsApiKey';

  static String searchPath(String searchWord) =>
      '$newsPathUrl/everything?q=$searchWord&apiKey=$newsApiKey';
}
