import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:zamanisinde/model/kullanici.dart';
import 'package:zamanisinde/services/auth.dart';
import 'package:zamanisinde/services/fireStore.dart';

class Registration extends StatefulWidget {
  final VoidCallback setRegister;
  Registration({this.setRegister});
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _auth = AuthService();
  int currentStep = 0;
  bool complete = false;
  int currentIndex = 0;


   changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });

  }

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
    widget.setRegister();
    _auth.signOut();
  }

  goTo(int step) {
    setState(() => currentStep = step);
  }

  final fnameController = TextEditingController();
  final lnameController = TextEditingController();

  final businessNameController = TextEditingController();
  final addressStreetController = TextEditingController();
  final addressApartmentController = TextEditingController();
  final addressCityController = TextEditingController();
  final addressProvinceController = TextEditingController();
  final addressPostalCodeController = TextEditingController();

  @override
  void dispose() {
    fnameController.dispose();
    lnameController.dispose();

    businessNameController.dispose();
    addressStreetController.dispose();
    addressApartmentController.dispose();
    addressCityController.dispose();
    addressProvinceController.dispose();
    addressPostalCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Kullanici>(context);
    var uid = user.uid;
    final _firestore = FirestoreService(uid: uid);

    List<Step> steps = [
      Step(
        title: Text("Temel bilgiler"),
        isActive: true,
        state: StepState.complete,
        content: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "Ben :",
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 10),
            ToggleSwitch(
              minWidth: 100.0,
              initialLabelIndex: 0,
              cornerRadius: 20.0,
              activeFgColor: Colors.white,
              inactiveBgColor: Colors.grey,
              inactiveFgColor: Colors.white,
              labels: ['İşçiyim', 'İş verenim'],
              activeBgColors: [Colors.blue, Colors.green],
              onToggle: (index) {
                changeIndex(index);
              },
            ),
            /*ToggleSwitch(
              minWidth: 90.0,
              initialLabelIndex: 0,
              cornerRadius: 20.0,
              activeBgColor: Colors.cyan,
              activeFgColor: Colors.white,
              inactiveBgColor: Colors.grey,
              inactiveFgColor: Colors.white,
              labels: ['İşçiyim', 'İşverenim'],
              icons: [Icons.verified_user, Icons.person],
              onToggle: (index) {
                setState(() {
                  changeIndex(index);
                });

                print('switched to: $index');
              },
            ),*/
            //-------------------------------------
/*             ToggleSwitch(
              minWidth: 150.0,
              initialLabelIndex: 0,
              activeBgColor: Colors.blue,
              activeFgColor: Colors.white,
              inactiveBgColor: Colors.grey,
              inactiveFgColor: Colors.grey[900],
              labels: ['İşçiyim', 'İşverenim'],
              onToggle: (index) {
                changeIndex(index);
              },
            ), */
            SizedBox(height: 15),
            TextFormField(
                controller: fnameController,
                decoration: InputDecoration(labelText: 'Adınız')),
            TextFormField(
                controller: lnameController,
                decoration: InputDecoration(labelText: 'Soyadınız')),
          ],
        ),
      ),
      Step(
        title: currentIndex == 0 ? Text("Adresiniz") : Text("İş Adresiniz"),
        isActive: true,
        state: StepState.editing,
        content: Column(
          children: <Widget>[
            currentIndex == 1
                ? TextFormField(
                    controller: businessNameController,
                    decoration: InputDecoration(labelText: 'İş Adı'),
                  )
                : SizedBox(),
            TextFormField(
              controller: addressStreetController,
              decoration: InputDecoration(labelText: 'Sokak adresi'),
            ),
            TextFormField(
              controller: addressApartmentController,
              decoration: InputDecoration(labelText: 'Apartman, Daire, vb'),
            ),
            TextFormField(
              controller: addressCityController,
              decoration: InputDecoration(labelText: 'Şehir'),
            ),
            SizedBox(
              child: Row(children: <Widget>[
                Expanded(
                  child: TextFormField(
                    controller: addressProvinceController,
                    decoration: InputDecoration(labelText: 'Bölge'),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextFormField(
                    controller: addressPostalCodeController,
                    decoration: InputDecoration(labelText: 'Posta Kodu'),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
      Step(
        title: Text("Kimliğinizi yükleyin"),
        content: Column(children: <Widget>[
          Text("Kimliğinizi seçin"),
        ]),
        state: StepState.indexed,
        isActive: true,
      ),
    ];

    void _showDialog() {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("HATA"),
            content: new Text("Form alanları boş bırakılmamalıdır!"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Kapat"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    next() {
      switch (currentStep) {
        case 0:
          if (fnameController.text == "" || lnameController.text == "") {
            _showDialog();
            return;
          }
          _firestore.registerBasicInformation(
              fnameController.text, lnameController.text, currentIndex == 1);
          break;
        case 1:
          if (currentIndex == 1 && businessNameController.text == "") {
            _showDialog();
            return;
          } else if (currentIndex == 1) {
            _firestore.registerBusinessName(businessNameController.text);
          }
          if (addressPostalCodeController.text == "" ||
              addressCityController.text == "" ||
              addressStreetController.text == "" ||
              addressProvinceController.text == "") {
            _showDialog();
            return;
          }
          _firestore.registerAddress(
              addressStreetController.text,
              addressApartmentController.text,
              addressCityController.text,
              addressProvinceController.text,
              addressPostalCodeController.text);
          break;
      }
      currentStep + 1 != steps.length
          ? goTo(currentStep + 1)
          : () {
              _firestore.onUserFinishRegister();
              widget.setRegister();
              _auth.signOut();
            }();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Hesap Ayrıntılarını Kaydet'),
        backgroundColor: Theme.of(context).accentColor,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stepper(
              steps: steps,
              currentStep: currentStep,
              onStepContinue: next,
              onStepTapped: (step) => goTo(step),
              onStepCancel: cancel,
            ),
          )
        ],
      ),
    );
  }
}
