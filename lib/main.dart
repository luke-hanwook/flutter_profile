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
class _CongressManProfilePageState extends State<CongressManProfilePage> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

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
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 7),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/image10.jpeg'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      data.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      )),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: CircleAvatar(
                            radius: 6,
                            backgroundColor: Colors.blue,
                          ),
                        ),
                        Text(
                          data.origName,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          softWrap: true,
                        ),
                      ],
                    )
                  ],
                )
              )
            ],
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 15),
              child: ListView(
                children: <Widget>[
                  TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.black,
                    labelColor: Colors.black,
                    isScrollable: true,
                    labelPadding: EdgeInsets.only(left: 25.0, right: 25.0),
                    unselectedLabelColor: Colors.grey,
                    tabs: <Widget>[
                      Tab(
                        child: Text('정보',
                          style: TextStyle(fontSize: 19),
                        ),
                      ),
                      Tab(
                        child: Text('대표발의법률안',
                          style: TextStyle(fontSize: 19),
                        ),
                      ),
                      Tab(
                        child: Text('댓글',
                          style: TextStyle(fontSize: 19),
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    child: TabBarView(
                      controller: _tabController,
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0, top: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                    '프로필',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18
                                    )
                                ),
                                SizedBox(height: 10,),
                                Text(
                                    '이름',
                                    style: TextStyle(
                                      fontSize: 13
                                    )
                                ),
                                Text(
                                  '${data.name}(${data.hanName}) / ${data.engName}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  '생년월일',
                                  style: TextStyle(
                                    fontSize: 13
                                  )
                                ),
                                Text(
                                  data.birthDate,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  '지역구',
                                  style: TextStyle(
                                      fontSize: 13
                                  )
                                ),
                                Text(
                                  data.origName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                    '소속정당',
                                    style: TextStyle(
                                        fontSize: 13
                                    )
                                ),
                                Text(
                                  data.polyName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                    '소속위원회',
                                    style: TextStyle(
                                        fontSize: 13
                                    )
                                ),
                                Text(
                                  data.cmitName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                    '경력사항',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18
                                    )
                                ),
                                SizedBox(height: 10,),
                                Text(
                                    '학력사항',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18
                                    )
                                ),
                              ],
                            )
                          ),
                        ),
                        Container(
                          width: double.infinity,
                        ),
                        Container(
                          width: double.infinity,
                        )
                      ],
                    )
                  )
                ],
              ),
            ),
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
