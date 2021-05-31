import 'package:intern_app/Model/inter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MainData {
  List<Intern> myList = [];
  Future<void> getData() async {
    String url =
        "http://34.93.159.27/PlacidVision/app/Channel_Page.php?ChannelPage&userLoggedIn=Permanent";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body)[0]["type"];
    jsonData.forEach((element) {
      if (element["Title"] != null) {
        Intern intern = new Intern(
          title: element["Title"],
          imgUrl: element["thumbnail"],
        );
        myList.add(intern);
      }
    });
  }
}
