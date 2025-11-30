import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/match_model.dart';

class MatchRepository {

  // final String url1 = "https://demo.sportz.io/sapk01222019186652.json";
  // final String url2 = "https://demo.sportz.io/nzin01312019187360.json";

  final String url1 = "https://ranjanatiwari.com/cric_info/sapk01222019186652.json";
  final String url2 = "https://ranjanatiwari.com/cric_info/nzin01312019187360.json";

  Future<MatchDetail> fetchMatchDetail(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      return MatchDetail.fromJson(jsonData);
    } else {
      throw Exception("Failed to load match details from $url");
    }
  }

  Future<List<MatchDetail>> fetchAllMatchDetails() async {
    final futures = <Future<MatchDetail>>[
      fetchMatchDetail(url1),
      fetchMatchDetail(url2),
    ];
    return await Future.wait(futures);
  }
}


