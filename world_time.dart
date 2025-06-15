import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location;
  String time="";
  String flag;
  String url;
  bool day=true;

  WorldTime({ required this.location,required this.flag,required this.url});

  Future<void> getTime() async {
    Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);

    String datetime=data['datetime'];
    datetime = datetime.substring(0, datetime.length - 6);
    DateTime now= DateTime.parse(datetime);
    day=now.hour>6 && now.hour<20 ? true : false;
    time = DateFormat.jm().format(now);
  }

}


