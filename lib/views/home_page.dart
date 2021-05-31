import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intern_app/Model/inter.dart';

import 'package:intern_app/controller/api.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: deprecated_member_use
  List<Intern> interns = new List<Intern>();
  bool loading = true;

  @override
  void initState() {
    gD();
    super.initState();
  }

  gD() async {
    MainData mainData = MainData();
    await mainData.getData();
    interns = mainData.myList;
    print(mainData.myList);
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Christian Fusion"),
        ),
        body: loading
            ? Container(child: Center(child: CircularProgressIndicator()))
            : ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: interns.length,
                itemBuilder: (context, idx) {
                  return Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 10),
                            height: 150,
                            width: 200,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image(
                                  image: NetworkImage(interns[idx].imgUrl),
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Text(
                            interns[idx].title,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  );
                }));
  }
}

// class Tile extends StatelessWidget {
//   final String imgUrl, title;
//   Tile({this.imgUrl, this.title});
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//                     children: [
//                       Column(
//                         children: [
//                           Container(
//                             margin: EdgeInsets.symmetric(
//                                 horizontal: 8, vertical: 10),
//                             height: 150,
//                             width: 200,
//                             child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(16),
//                                 child: Image(
//                                   image: NetworkImage(imgUrl),
//                                   fit: BoxFit.cover,
//                                 )),
//                           ),
//                           Text(
//                           title,
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                     ],
//                   );
//   }
// }
