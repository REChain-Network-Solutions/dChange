import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import '../backend/services/api_endpoint.dart';
import '../backend/utils/custom_snackbar.dart';
import 'language_model.dart';

// import 'dart:developer' as log;
class LanguageService {
  Future<List<Language>> fetchLanguages() async {
    final response = await http.get(Uri.parse(ApiEndpoint.languagesURL));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> languageDataList = data["data"]["languages"];
      final List<Language> languages =
          languageDataList.map((json) => Language.fromJson(json)).toList();
      // log.log(response.body.toString());
      return languages;
    } else {
      CustomSnackBar.error('Failed to load language data');
      throw Exception('Failed to load language data');
    }
  }
}
