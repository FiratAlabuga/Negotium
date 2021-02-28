import 'package:flutter/material.dart';

var months = {
  1: "Ocak",
  2: "Şubat",
  3: "Mart",
  4: "Nisan",
  5: "Mayıs",
  6: "Haziran",
  7: "Temmuz",
  8: "Ağustos",
  9: "Eylül",
  10: "Ekim",
  11: "Kasım",
  12: "Aralık",
};

class DateTimePicker extends StatefulWidget {
  final Function onFinish;
  final String labelText;

  DateTimePicker({@required this.onFinish, @required this.labelText});

  @override
  _DateTimePickerState createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  DateTime _date;
  TimeOfDay _time;

  Future<Null> _selectDateTime(BuildContext context) async {
    final DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      initialDate: DateTime.now(),
      lastDate: DateTime(2022, 12, 29),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Theme.of(context).accentColor,
            accentColor: Theme.of(context).accentColor,
            buttonTheme: ButtonTheme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: Theme.of(context).accentColor,
              ),
            ),
          ),
          child: child,
        );
      },
    );

    if (date != null) {
      final TimeOfDay time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: Theme.of(context).accentColor,
              accentColor: Theme.of(context).accentColor,
              buttonTheme: ButtonTheme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: Theme.of(context).accentColor,
                ),
              ),
            ),
            child: child,
          );
        },
      );
      if (time != null) {
        this.setState(() {
          _date = date;
          _time = time;
        });
        widget.onFinish(_date, time);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        elevation: 4.0,
        color: Colors.white,
        onPressed: () {
          _selectDateTime(context);
        },
        child: Container(
          alignment: Alignment.center,
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.access_time,
                          size: 18.0,
                          color: Theme.of(context).accentColor,
                        ),
                        Text(
                          _date == null
                              ? "Ayarlanamadı"
                              : " ${months[_date.month]}, ${_date.day} ${_time.format(context)}",
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Text(
                widget.labelText,
                style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
