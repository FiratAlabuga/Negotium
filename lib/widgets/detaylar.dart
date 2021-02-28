import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'loading.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();

  DocumentSnapshot job;
  DetailPage(this.job);
}

class _DetailPageState extends State<DetailPage> {
  bool isClicked;
  bool loading;
  @override
  void initState() {
    isClicked = false;
    loading = true;
    checkApplication().then((boolean) {
      setState(() {
        isClicked = boolean;
        loading = false;
      });
    });
  }

  Future<bool> checkApplication() async {
    bool applied = false;
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    final uid = user.uid;

    DocumentReference userReference =
        Firestore.instance.collection("users").document(uid);
    List<dynamic> currentApplicants = widget.job.data['applicants'];

    currentApplicants.forEach((applicant) {
      if (applicant.path == userReference.path) {
        applied = true;
      }
    });
    return applied;
  }

  @override
  Widget build(BuildContext context) {
    String date =
        DateFormat.MMMMd().format(widget.job.data['beginTime'].toDate());
    String time =
        DateFormat.jm().format(widget.job.data['beginTime'].toDate()) +
            " - " +
            DateFormat.jm().format(widget.job.data['endTime'].toDate());
    if (loading) {
      return Loading();
    } else {
      return new Scaffold(
        body: new Container(
          constraints: new BoxConstraints.expand(),
          color: Colors.white,
          child: new Stack(
            children: <Widget>[
              _getContent(context, date, time),
              _getToolbar(context),
            ],
          ),
        ),
      );
    }
  }

  Container _getBackground() {
    return new Container(
      child: Image(
        image: new NetworkImage(
            "https://source.unsplash.com/featured/?" + widget.job['name']),
        fit: BoxFit.cover,
        height: 150.0,
      ),
      constraints: new BoxConstraints.expand(height: 295.0),
    );
  }

  Container _getContent(BuildContext context, String date, String time) {
    return new Container(
      child: new ListView(
        padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 32.0),
        children: <Widget>[
          _getBackground(),
          new Container(
            padding: new EdgeInsets.symmetric(horizontal: 10.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Column(children: <Widget>[
                    Container(
                      height: 20,
                    ),
                    Align(
                      child: Text(
                        widget.job['name'].toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 2,
                      color: Colors.grey,
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.calendar_today,
                                color: Colors.grey,
                              ),
                              Container(
                                height: 10,
                              ),
                              Text(
                                "Tarih",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                height: 10,
                              ),
                              Text(
                                date,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              Container(
                                height: 30,
                              ),
                              Icon(
                                Icons.local_activity,
                                color: Colors.grey,
                              ),
                              Container(
                                height: 10,
                              ),
                              Text("Zaman",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              Container(
                                height: 10,
                              ),
                              Text(
                                time,
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                          width: MediaQuery.of(context).size.width * 0.4,
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.attach_money, color: Colors.grey),
                              Container(
                                height: 10,
                              ),
                              Text(
                                "Ücret",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                height: 10,
                              ),
                              Text(
                                widget.job['salary'].toString() + " /saat",
                                style: TextStyle(fontSize: 18),
                              ),
                              Container(
                                height: 30,
                              ),
                              Icon(
                                Icons.chat_bubble_outline,
                                color: Colors.grey,
                              ),
                              Container(
                                height: 10,
                              ),
                              Text(
                                "Dil",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              Container(
                                height: 10,
                              ),
                              Text("Türkçe", style: TextStyle(fontSize: 18)),
                            ],
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                          width: MediaQuery.of(context).size.width * 0.3,
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 2,
                      color: Colors.grey,
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    ),
                  ]),
                  margin: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.05,
                      0,
                      MediaQuery.of(context).size.width * 0.05,
                      0),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Align(
                        child: Text(
                          "Yapacağınız İş : ",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      Container(
                        height: 15,
                      ),
                      Align(
                        child: Text(widget.job['description'].toString()),
                        alignment: Alignment.centerLeft,
                      ),
                      Container(
                        height: 20,
                      ),
                      Align(
                        child: Text(
                          "Çalışan Gereksinimleri :",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      Container(
                        height: 8,
                      ),
                    ],
                  ),
                  margin: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * .05,
                      0,
                      MediaQuery.of(context).size.width * .05,
                      0),
                ),
                Container(
                  child: Column(
                      children: <Widget>[Text(widget.job.data['requirements'])],
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start),
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.05,
                      0,
                      MediaQuery.of(context).size.width * 0.05,
                      0),
                ),
                Container(
                  alignment: Alignment(0.0, 0.0),
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: RaisedButton(
                    child: Text(
                      isClicked ? "Başvuruldu" : "Şimdi Başvur",
                      style: TextStyle(color: Colors.white),
                    ),
                    elevation: 6.0,
                    color: Colors.green,
                    onPressed: () {
                      isClicked ? null : applyNow(context);
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void applyNow(BuildContext context) {
    var alertDialog = AlertDialog(
      content: Container(
          height: 50,
          width: 100,
          child: Column(
            children: <Widget>[
              Text(
                "Başvuru",
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.check,
                color: Colors.green,
              )
            ],
          )),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });

    inputData(widget.job);
  }

  Container _getToolbar(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: new BackButton(color: Colors.white),
    );
  }

  void inputData(DocumentSnapshot job) async {
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    final uid = user.uid;

    DocumentReference userReference =
        Firestore.instance.collection("users").document(uid);

    List<dynamic> applicants = job.data['applicants'];

    setState(() {
      isClicked = true;
    });

    applicants.add(userReference);
    Firestore.instance
        .collection('listings')
        .document(job.documentID)
        .updateData({"applicants": applicants});

    DocumentSnapshot currentUser = await Firestore.instance
        .collection("users")
        .document(uid.toString())
        .get();

    dynamic currentJobs = currentUser.data['listings'];

    DocumentReference newJob = await Firestore.instance
        .collection("listings")
        .document(job.documentID);

    currentJobs.add(newJob);

    Firestore.instance
        .collection("users")
        .document(uid.toString())
        .updateData({'listings': currentJobs});

    Firestore.instance
        .collection("listings")
        .document(job.documentID)
        .updateData({"numberOfApplicants": job.data['applicants'].length + 1});
  }
}
