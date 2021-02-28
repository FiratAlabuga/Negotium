import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zamanisinde/model/kullanici.dart';
import 'package:zamanisinde/routes.dart';
import 'package:zamanisinde/services/fireStore.dart';
import 'package:zamanisinde/widgets/aramaBar.dart';
import 'package:zamanisinde/widgets/ilan_card.dart';
import 'package:zamanisinde/widgets/loading.dart';

class ListingsScreen extends StatefulWidget {
  @override
  _ListingsScreenState createState() => _ListingsScreenState();
}

class _ListingsScreenState extends State<ListingsScreen> {
  TextEditingController _controller = TextEditingController();
  String _search;
  bool loading;
  List data;

  @override
  void initState() {
    this.loading = true;
    this.data = [];
    super.initState();
  }

  void changeSearch(String value) {
    this.setState(() => {_search = value});
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Kullanici>(context);
    final FirestoreService firestoreService = FirestoreService(uid: user.uid);

    Future setup() async {
      List references = await firestoreService.getListings();
      List list = [];
      references.forEach((reference) {
        list.add({"snapshot": reference, "ref": reference});
      });
      return await Future.wait(list.map((obj) => obj["snapshot"].get()));
    }

    void setData() async {
      List snapshots = await setup();
      List data = [];
      snapshots.forEach((snapshot) {
        dynamic object = snapshot.data;
        object["beginTime"] = object["beginTime"].toDate();
        object["endTime"] = object["endTime"].toDate();
        object["ref"] = snapshot.reference;
        data.add(object);
      });
      this.setState(() {
        this.loading = false;
        this.data = data;
      });
    }

    List filteredData = _search == "" || _search == null
        ? data
        : data.where((obj) {
            return obj["description"]
                    .toLowerCase()
                    .contains(_search.toLowerCase()) ||
                obj["requirements"]
                    .toLowerCase()
                    .contains(_search.toLowerCase()) ||
                obj["name"].toLowerCase().contains(_search.toLowerCase());
          }).toList();

    if (loading) {
      setData();
      return Loading();
    }

    List<Widget> widgets = filteredData
        .map((obj) => Container(
              child: ListingCard(
                applicants: obj["applicants"],
                beginTime: obj["beginTime"],
                endTime: obj["endTime"],
                categories: obj["categories"],
                description: obj["description"],
                name: obj["name"],
                requirements: obj["requirements"],
                numberOfApplicants: obj["numberOfApplicants"],
                salary: obj["salary"],
                reference: obj["ref"],
                filledBy: obj["filledBy"],
                postDate: DateTime.parse(obj["postTime"].toDate().toString()),
              ),
            ))
        .toList();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          Yonlendirici.sailor.navigate('/employer/add');
        },
      ),
      body: SafeArea(
        child: this.loading
            ? Loading()
            : widgets.length == 0
                ? Center(
                    child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Text(
                      "Aktif listeniz yok, şimdi bir tane eklemek için '+' düğmesine basın!",
                      style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).accentColor),
                    ),
                  ))
                : ListView(
                    children: [
                      SearchBar(
                        controller: _controller,
                        onChange: this.changeSearch,
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: MediaQuery.of(context).size.height - 150,
                        child: ListView(children: widgets),
                        margin: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.05, 0, 0, 0),
                      ),
                    ],
                  ),
      ),
    );
  }
}
