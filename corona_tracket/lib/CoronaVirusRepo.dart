import 'package:http/http.dart' as http;
import 'dart:convert';

import './CountryModel.dart';

class CoronaVirusRepo {
  Future<CountryModel> getVirus(String country) async {
    final result = await http.get(Uri.parse(
        'https://coronavirus-19-api.herokuapp.com/countries/$country'));

    if (result.statusCode != 200) throw Exception();

    return parsedJson(result.body);
  }

  CountryModel parsedJson(final response) {
    final jsonDecoded = json.decode(response);

    final jsonVirus = jsonDecoded;

    return CountryModel.fromJson(jsonVirus);
  }
}
