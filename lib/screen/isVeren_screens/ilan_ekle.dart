import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:provider/provider.dart';
import 'package:zamanisinde/model/kullanici.dart';
import 'package:zamanisinde/services/dialog_goster.dart';
import 'package:zamanisinde/services/fireStore.dart';
import 'package:zamanisinde/widgets/tarih_picker.dart';
import 'package:zamanisinde/widgets/zaman_picker.dart';

var data = [
  {
    "display": "Bakım",
    "value": "Bakım",
  },
  {
    "display": "Onarım",
    "value": "Onarım",
  },
  {
    "display": "Halkla İlişkiler",
    "value": "Halkla İlişkiler",
  },
  {
    "display": "Temizlik",
    "value": "Temizlik",
  },
  {
    "display": "İnşaat",
    "value": "İnşaat",
  },
  {
    "display": "Tasarım",
    "value": "Tasarım",
  },
  {
    "display": "Eğitim",
    "value": "Eğitim",
  },
    {
    "display": "Ev Yemekleri",
    "value": "Ev Yemekleri",
  },
];

class AddListingsScreen extends StatefulWidget {
  @override
  _AddListingsScreenState createState() => _AddListingsScreenState();
}

class _AddListingsScreenState extends State<AddListingsScreen> {
  int currentStep = 0;
  bool complete = false;
  bool categoriesComplete = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _requirementsController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();
  static String name;

  final Map<String, dynamic> listing = {};

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _requirementsController.dispose();
    _salaryController.dispose();
    super.dispose();
  }

  List _listingCategories;
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _listingCategories = [];
  }

  setCategories(List categories) {
    this.setState(() {
      _listingCategories = categories;
    });
  }

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() => currentStep = step);
  }

  DateTime _date;
  TimeOfDay _begin;
  TimeOfDay _end;

  @override
  Widget build(BuildContext context) {
    final Kullanici user = Provider.of<Kullanici>(context);
    print(user.uid);

    next() {
      switch (currentStep) {
        case 0:
          if (_descriptionController.text == "") {
            ShowDialog.error(context);
            return;
          }
          listing["description"] = _descriptionController.text;
          break;
        case 1:
          if (_requirementsController.text == "") {
            ShowDialog.error(context);
            return;
          }
          listing["requirements"] = _requirementsController.text;
          break;
        case 2:
          if (_salaryController.text == "") {
            ShowDialog.error(context);
            return;
          } else if (double.tryParse(_salaryController.text) == null) {
            ShowDialog.custom(
                context, "Geçersiz ", " Maaş bir sayı olmalıdır!");
            return;
          } else if (double.tryParse(_salaryController.text) < 14.25) {
            ShowDialog.custom(
                context, "Geçersiz ", " Maaş 14,25'ten fazla olmalıdır!");
          }
          listing["salary"] = double.tryParse(_salaryController.text);
          FirestoreService(uid: user.uid).addListing(listing).then((ref) {
            Navigator.of(context).pop();
            ShowDialog.custom(context, "Tebrikler!",
                "İlanınız, moderatörlerimiz inceledikten sonra herkese açık olacak!");
          });

          break;
      }
      currentStep + 1 != 3
          ? goTo(currentStep + 1)
          : setState(() => complete = true);
    }

    List<Step> steps = [
      Step(
        title: const Text('Açıklama'),
        isActive: true,
        state: StepState.complete,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "İşinizi Açıklayınız. Bu ne tür bir iş?",
              style: TextStyle(
                fontSize: 30,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              autocorrect: true,
              decoration: InputDecoration(labelText: 'Açıklama'),
              keyboardType: TextInputType.multiline,
              controller: _descriptionController,
              maxLines: null,
              maxLength: 200,
            ),
          ],
        ),
      ),
      Step(
        isActive: true,
        state: StepState.editing,
        title: const Text('Gereksinimler'),
        content: Column(
          children: <Widget>[
            Text(
              "İdeal aday hangi becerilere sahip olmalıdır?",
              style: TextStyle(
                fontSize: 30,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              autocorrect: true,
              decoration: InputDecoration(labelText: 'Gereksinimler'),
              keyboardType: TextInputType.multiline,
              controller: _requirementsController,
              maxLines: null,
              maxLength: 200,
            ),
          ],
        ),
      ),
      Step(
        state: StepState.indexed,
        isActive: true,
        title: const Text('Maaş'),
        content: Column(
          children: <Widget>[
            Text(
              "Ne kadar ödeyeceksiniz?",
              style: TextStyle(
                fontSize: 30,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Saatlik ücret'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              controller: _salaryController,
              maxLength: 6,
            ),
          ],
        ),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("İş ilanınızı ekleyin"),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Theme.of(context).accentColor,
      ),
      body: categoriesComplete
          ? Column(
              children: <Widget>[
                Expanded(
                  child: Stepper(
                    steps: steps,
                    type: StepperType.horizontal,
                    currentStep: currentStep,
                    onStepContinue: next,
                    onStepTapped: (step) => goTo(step),
                    onStepCancel: cancel,
                  ),
                ),
              ],
            )
          : (Center(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 10),
                        Text(
                          "İş ilanınızı yayınlayalım!",
                          style: TextStyle(fontSize: 30),
                          textAlign: TextAlign.left,
                        ),
                        TextFormField(
                          controller: _nameController,
                          autocorrect: false,
                          decoration: InputDecoration(labelText: 'İlan Adı'),
                        ),
                        SizedBox(height: 30),
                        Text(
                          "Size gereken iş bölümlerini seçebilirsiniz!",
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 20),
                        Container(
                          child: MultiSelectFormField(
                            autovalidate: false,
                            title: Text('İlan Kategorileri'),
                            validator: (value) {
                              if (value == null || value.length == 0) {
                                return 'Lütfen bir veya daha fazla seçenek seçin';
                              }
                              return null;
                            },
                            dataSource: data,
                            textField: 'display',
                            valueField: 'value',
                            okButtonLabel: 'Tamam',
                            cancelButtonLabel: 'İptal',
                            required: true,
                            hintWidget:
                                Text('Lütfen bir veya daha fazla seçin.'),
                            initialValue: _listingCategories,
                            onSaved: (value) {
                              if (value == null) return;
                              setState(() {
                                _listingCategories = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 30),
                        Text(
                          "Bu iş ne zaman yapılacak?",
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 10),
                        DateTimePicker(
                          labelText: "Giriş Zamanı",
                          onFinish: (DateTime date, TimeOfDay time) {
                            this.setState(() {
                              _date = date;
                              _begin = time;
                            });
                          },
                        ),
                        TimePicker(
                          onFinish: (TimeOfDay time) {
                            this.setState(() {
                              _end = time;
                            });
                          },
                          labelText: "Bitiş Zamanı",
                          disabled: () {
                            return _date == null;
                          },
                        ),
                        SizedBox(height: 30),
                        Container(
                          padding: EdgeInsets.all(8),
                          alignment: AlignmentDirectional.center,
                          child: RaisedButton(
                            child: Text('Sonraki Adım'),
                            onPressed: () {
                              DateTime now = DateTime.now();
                              if (_listingCategories.length > 0 &&
                                  _nameController.text != '' &&
                                  _date != null &&
                                  _begin != null &&
                                  _end != null) {
                                if ((_date.month == now.month &&
                                        _date.day == now.day &&
                                        _date.year == now.year) &&
                                    ((_begin.hour == now.hour &&
                                            _begin.minute < now.minute) ||
                                        (_begin.hour < now.hour))) {
                                  ShowDialog.custom(context, "HATA",
                                      "Başlangıç zamanı gelecekte olmalı!");
                                } else if (_begin.hour == _end.hour &&
                                    _begin.minute < _end.minute) {
                                  ShowDialog.custom(context, "HATA",
                                      "Bitiş zamanı, başlangıç zamanından sonra olmalıdır!");
                                } else if (_begin.hour > _end.hour) {
                                  ShowDialog.custom(context, "HATA",
                                      "Bitiş zamanı, başlangıç zamanından sonra olmalıdır!");
                                } else {
                                  this.setState(() {
                                    categoriesComplete = true;
                                    name = _nameController.toString();
                                  });
                                  listing["beginTime"] = DateTime(
                                      _date.year,
                                      _date.month,
                                      _date.day,
                                      _begin.hour,
                                      _begin.minute);
                                  listing["endTime"] = DateTime(
                                      _date.year,
                                      _date.month,
                                      _date.day,
                                      _end.hour,
                                      _end.minute);
                                  listing["categories"] = _listingCategories;
                                  listing["name"] = _nameController.text;
                                  print(
                                      "Begin Time ${DateTime(_date.year, _date.month, _date.day, _begin.hour, _begin.minute).toString()}");
                                  print(
                                      "End Time ${DateTime(_date.year, _date.month, _date.day, _end.hour, _end.minute).toString()}");
                                  print(
                                      "Selected Categores ${_listingCategories.toString()}");
                                  print(
                                      "Selected Name: ${_nameController.text}");
                                }
                              } else {
                                ShowDialog.error(context);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )),
    );
  }
}
