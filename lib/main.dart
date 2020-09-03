import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart';

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
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text("Congressman Profile"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                const Radius.circular(5.0)
              )
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 5,
                  right: 5,
                  child: Badge(
                    badgeColor: Colors.blue,
                    shape: BadgeShape.square,
                    borderRadius: 10,
                    toAnimate: false,
                    badgeContent:
                    Text(data.polyName, style: TextStyle(color: Colors.white, fontSize: 10)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(5.0),
                          bottomLeft: const Radius.circular(5.0),
                        ),
                        child: SizedBox(
                          child: Image.asset('assets/image10.jpeg'),
                        )),
                    Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                    '${data.name}(${data.hanName})',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    )),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '${data.origName}',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  '${data.cmitName}',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                    ),
                  ],
                ),
              ],
            )
          )),
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      const Radius.circular(5.0)
                  ),
                  gradient:LinearGradient(
                    colors: [Colors.black54, Colors.black38],
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            '${data.regionPlenaryVOList.length}',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            '발의',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 100,),
                      Column(
                        children: <Widget>[
                          Text(
                            '${data.commentList.length}',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            '댓글',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ),
            ),
          ),
          SizedBox(height: 10.0),
          //대표발의법률안 영역 -> TODO 분리
          Container(
            width: double.infinity,
//            height: size.height,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child:
              Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    right: 0,
                    child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '더보기',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black
                              )
                            ),
                            WidgetSpan(
                              child: Icon(Icons.keyboard_arrow_right, size: 13,)
                            )
                          ]
                        ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '대표발의법률안',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '진실, 화해를 위한 과거사 정리 기본법 일부 개정법률안(대안)(행정안전위원장)',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14
                            ),
                          ),
                          Text(
                              '강훈식외 20명  |  국토교통위원회',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.grey
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '진실, 화해를 위한 과거사 정리 기본법 일부 개정법률안(대안)(행정안전위원장)',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14
                            ),
                          ),
                          Text(
                            '강훈식외 20명  |  국토교통위원회',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.grey
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '진실, 화해를 위한 과거사 정리 기본법 일부 개정법률안(대안)(행정안전위원장)',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14
                            ),
                          ),
                          Text(
                            '강훈식외 20명  |  국토교통위원회',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.grey
                            ),
                          )
                        ],
                      )

                    ],
                  )
                ],
              )
              ),
          ),
          SizedBox(height: 10.0),
          //댓글영역
          Container(
            width: double.infinity,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    right: 0,
                    child: RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                                text: '추천순',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black
                                )
                            ),
                            TextSpan(
                                text: '/',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black
                                )
                            ),
                            TextSpan(
                                text: '댓글순',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black
                                )
                            ),
                          ]
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '댓글',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              )


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
  List regionPlenaryVOList;
  List commentList;

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
    regionPlenaryVOList= [];
    commentList= [];
  }
}
