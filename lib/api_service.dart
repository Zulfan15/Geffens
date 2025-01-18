import 'dart:convert';
import 'package:http/http.dart' as http;
import 'earthquake_model.dart';

class ApiService {
  final String apiUrl = "https://data.bmkg.go.id/DataMKG/TEWS/autogempa.json";

  Future<Earthquake> fetchEarthquake() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Earthquake.fromJson(data);
    } else {
      throw Exception('Failed to load earthquake data');
    }
  }
}




// class ApiService {

//   Future<List<Earthquake>> fetchEarthquakeList() async {

//     final response = await http.get(Uri.parse('https://data.bmkg.go.id/DataMKG/TEWS/autogempa.json'));



//     if (response.statusCode == 200) {

//       List jsonResponse = json.decode(response.body);

//       return jsonResponse.map((data) => Earthquake.fromJson(data)).toList();

//     } else {

//       throw Exception('Failed to load earthquake data');

//     }

//   }

// }
