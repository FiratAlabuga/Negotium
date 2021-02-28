import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zamanisinde/widgets/aramaBar.dart';
import 'package:zamanisinde/widgets/is_card.dart';
import 'package:zamanisinde/widgets/kesfet_card.dart';
import 'package:zamanisinde/widgets/loading.dart';
import 'package:zamanisinde/widgets/topIs.dart';
import 'package:zamanisinde/widgets/veri.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  String searchValue = "";
  List<DocumentSnapshot> _employerData;
  bool _loading;

  @override
  void initState() {
    _loading = true;
    super.initState();
  }

  void setData(List<DocumentSnapshot> newData) {
    this.setState(() {
      _employerData = newData;
      _loading = false;
    });
  }

  void setSearch(String value) {
    setState(() {
      searchValue = value;
    });
  }

  TextEditingController myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var jobs = Provider.of<QuerySnapshot>(context);
    var jobDocs = null;
    if (jobs == null) {
      return Scaffold(body: Loading());
    } else {
      jobDocs = jobs.documents;
    }

    List<Widget> _createChildren() {
      List<Widget> topJobs = [];
      for (int i = 0; i < (jobDocs.length >= 4 ? 4 : jobDocs.length); i++) {
        topJobs.add(TopJob(jobDocs[i]));
      }
      return topJobs;
    }

    List<Widget> _topJobs = new List<Widget>();

    for (int i = 0; i < industries.length; i++) {
      _topJobs.add(DiscoverCard(industries[i], jobs));
    }

    Future<List<DocumentSnapshot>> setup() async {
      List<Future<DocumentSnapshot>> list = [];
      jobDocs.forEach((job) async {
        list.add(job.data['user'].get());
      });
      return await Future.wait(list);
    }

    if (_loading) {
      setup().then((list) {
        setData(list);
      });
      return Loading();
    }

    List<Widget> hits = [];

    for (int i = 0; i < jobDocs.length; i++) {
      if (jobDocs[i]
              .data['name']
              .toLowerCase()
              .contains(searchValue.toLowerCase()) ||
          jobDocs[i].data['categories'].contains(searchValue.toLowerCase()) ||
          _employerData[i]
              .data['businessName']
              .toLowerCase()
              .contains(searchValue.toLowerCase()) ||
          _employerData[i]
              .data['city']
              .toLowerCase()
              .contains(searchValue.toLowerCase())) {
        hits.add(JobCard(jobDocs[i]));
      }
    }

    return ListView(children: <Widget>[
      SearchBar(
          controller: myController, onChange: (value) => {setSearch(value)}),
      Container(
        height: 10,
      ),
      searchValue != ""
          ? Column(children: hits)
          : Container(
              //height: MediaQuery.of(context).size.height * 0.80,
              child: Column(
              children: <Widget>[
                Container(
                  child: Text("İşleri Keşfedin",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      )),
                  height: 30,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                ),
                Container(
                  child: Text("Farklı sektörlerden işleri görün!",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      )),
                  width: MediaQuery.of(context).size.width,
                  height: 20,
                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                ),
                Container(
                    height: 160,
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: ListView(
                      children: _topJobs,
                      scrollDirection: Axis.horizontal,
                    )),
                Container(
                  child: Text(
                    "Popüler İşler",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  height: 30,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                ),
                Container(
                  child: Text(
                    "Kendinize En Uygun İşi Bulun",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  height: 30,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: Wrap(
                    children: _createChildren(),
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.spaceEvenly,
                    runAlignment: WrapAlignment.spaceEvenly,
                  ),
                ),
              ],
            ))
    ]);
  }
}
