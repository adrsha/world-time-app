import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class WorldTime {
  String location = ""; // The UI Location
  String time = ""; // The actual time
  String flag = "";
  String url = "";
  bool isDayOrNot = false;
  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));

      Map data = jsonDecode(response.body);

      // To get the properties from the obtained json
      String dateTime = data['datetime'];
      String offsetHours = data['utc_offset'].substring(1, 3);
      String offsetMins = data['utc_offset'].substring(4, 6);
      // Create a dateTime object
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(
          minutes: int.parse(offsetMins) + int.parse(offsetHours) * 60));

      time = DateFormat.jm().format(now);

      isDayOrNot = (now.hour > 6 && now.hour < 20) ? true : false;
    } catch (e) {
      print('i found an error !');
      time = "Could'nt Set Time Data";
    }
  }
}
