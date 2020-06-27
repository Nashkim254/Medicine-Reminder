import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController doseController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  String selectedTime;

  void _onButtonPressed() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Color(0xff737373),
            child: Container(
              child: bottomMenu(),
              decoration: BoxDecoration(
                color:Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0))),
            ),
          );
        });
  }

  ListView bottomMenu() {
    return ListView(
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Add New Medicine',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 120.0),
              child: IconButton(
                icon: Icon(
                  Icons.cancel,
                  color: Color(0xff00ffab),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Name',
            ),
            onChanged: (value) {},
            controller: nameController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Dose',
            ),
            onChanged: (value) {},
            controller: doseController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Shape'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  _pickTime();
                },
                child: Container(
                    height: 30.0,
                    width: 30.0,
                    child: Image.asset('lib/assets/drug.png')),
              ),
              GestureDetector(
                onTap: () {
                  _pickTime();
                },
                child: Container(
                    height: 30.0,
                    width: 30.0,
                    child: Image.asset('lib/assets/inhaler.png')),
              ),
              GestureDetector(
                onTap: () {
                  _pickTime();
                },
                child: Container(
                    height: 30.0,
                    width: 30.0,
                    child: Image.asset('lib/assets/pill_rounded.png')),
              ),
              GestureDetector(
                onTap: () {
                  _pickTime();
                },
                child: Container(
                    height: 30.0,
                    width: 30.0,
                    child: Image.asset('lib/assets/pill.png')),
              ),
              GestureDetector(
                onTap: () {
                  _pickTime();
                },
                child: Container(
                    height: 30.0,
                    width: 30.0,
                    child: Image.asset('lib/assets/syringe.png')),
              ),
            ],
          ),
        ),
        Container(
          height: 50.0,
          width: 5.0,
          child: RaisedButton(
              color: Color(0xff00ffab),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              child: Text(
                'ADD MEDICINE',
                style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold,fontSize:20.0),
              ),
              onPressed: () {}),
        ),
      ],
    );
  }
  Future<void> _pickTime() async {
    final TimeOfDay picked = await showTimePicker(
        context: context, initialTime: TimeOfDay(hour: 5, minute: 10));
    if (picked != null) {
      setState(() {
        selectedTime = picked.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Medicine Reminder',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25.0),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 80.0,
              width: 80.0,
              margin: EdgeInsets.only(top: 250.0),
              child: Image.asset('lib/assets/emergency.png'),
            ),
            Text(
              'No Medicine Added yet',
              style: TextStyle(
                  fontSize: 20.0, color: Colors.grey.withOpacity(0.5)),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () => _onButtonPressed(),
      ),
    );
  }
}
