import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<CongrassMan>.value(
      value: CongrassMan.info(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CongressManProfilePage())
    );
  }
}

class CongressManProfilePage extends StatefulWidget {
  @override
  _CongressManProfilePageState createState() => _CongressManProfilePageState();
}

// 나중에 Body 분리
class _CongressManProfilePageState extends State<CongressManProfilePage> {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<CongrassMan>(context);
    print(data.name);
    return Scaffold(
      appBar: AppBar(
        title: Text("Congressman Profile"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/image10.jpeg'),
              )
            ],
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '${data.name} (${data.hanName})',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '${data.engName}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '${data.birthDate}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
                right: 38.0, left: 38, top:15, bottom:12
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(
                        '${data.polyName}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        softWrap: true,
                      ),
                      width: 100,
                    )
                  ],
                ),
                Container(
                  color: Colors.black,
                  width: 1,
                  height: 30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(
                        '${data.origName}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        softWrap: true,
                      ),
                      width: 100,
                    )
                  ],
                ),
                Container(
                  color: Colors.black,
                  width: 1,
                  height: 30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(
                        '${data.cmitName}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        softWrap: true,
                      ),
                      width: 100,
                    )
                  ],
                ),
              ],
            )
          )

        ],
      )
    );
  }
}

// fake info
class CongrassMan {
  int seq;
  String name;
  String profileImgUrl;
  String hanName;
  String engName;
  String birthDate;
  String polyName;
  String origName;
  String cmitName;

  CongrassMan(this.seq, this.name, this.profileImgUrl, this.hanName,
      this.engName, this.birthDate, this.polyName, this.origName, this.cmitName);

  CongrassMan.info() {
    seq = 10;
    name = "강훈식";
    profileImgUrl = "/static/images/image10.jpeg";
    hanName = "姜勳植";
    engName = "KANG HOONSIK";
    birthDate = "1973-10-24";
    polyName = "더불어민주당";
    origName = "충남 아산시을";
    cmitName = "산업통상자원중소벤처기업위원회";
  }
}
