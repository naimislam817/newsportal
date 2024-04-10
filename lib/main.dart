import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget

///Inheritance
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello World Travel App"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "This is the body of the paragraph",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "lets start",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(
                height: 30,
              ),
              Image.network(
                  "https://images.freeimages.com/images/large-previews/9c0/forest-1400475.jpg",
                  height: 300),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    contactUs(context);
                  },
                  child: Text("Contact Now")),
            ],
          ),
        ),
      ),
    );
  }

  void contactUs(BuildContext context) {
    var alertBox = AlertDialog(
      title: Text("Contact Us"),
      content: Text("naimislam231@gmail.com"),
      actions: <Widget>[
        TextButton(
          child: Text("Close"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertBox;
        });
  }
}
