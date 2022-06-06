import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LocationService {

  final String key = "AIzaSyBUte52u67draClZnONf7-35lvjlSrblLI";

  Future<String> getPlaceId(String input) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&key=$key';
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    // print(json);
    var placeId = json['candidates'][0]['place_id'] as String;

    // print(placeId);
    return placeId;
    // return '00000000000000 just for testing purposes';
  }
  // Future<Map<String ,dynamic>> getPlace(String input) async {

  // }
}
