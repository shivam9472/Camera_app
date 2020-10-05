import 'dart:convert';
import 'package:http/http.dart' as http;

const Google_API_KEY = 'AIzaSyB3VbrBnyZ6P44MCcYBCj8ZJGgH67Jlb9Y';

class LoactionHelper {
  static String generateLocationpreviewImage(
      {double latitude, double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:blue%7Clabel:A%7C$latitude,$longitude&key=$Google_API_KEY';
  }

  static Future<String> getPlacesAddress(double lat, double lng) async {
    final url =
        ' https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&location_type=ROOFTOP&result_type=street_address&key=$Google_API_KEY';
    final response = await http.get(url);
    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}
