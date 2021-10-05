import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'This is a title not a treasure',
      home: ButtonExperiment(),
    );
  }
}

class ButtonExperiment extends StatefulWidget {
  const ButtonExperiment({Key? key}) : super(key: key);

  @override
  _ButtonExperimentState createState() => _ButtonExperimentState();
}

class _ButtonExperimentState extends State<ButtonExperiment> {
  int numShown = 0; // the num to be played with, shown in the middle of page

  @override
  Widget build(BuildContext context) {
    //  style for both clear and increment buttons
    final btnStyle = ButtonStyle(
      elevation: MaterialStateProperty.all(0),
      padding: MaterialStateProperty.all<EdgeInsets>(
        EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      ),
      overlayColor: MaterialStateProperty.all<Color>(Colors.orangeAccent),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: BorderSide(color: Colors.black, width: 2),
        ),
      ),
    );

    const space = 20.0;

    void clearNumShown() {
      setState(() {
        numShown = 0;
      });
    }

    void incNumShown() {
      setState(() {
        numShown++;
      });
    }

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            numShown.toString(),
            style: TextStyle(
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
          SizedBox(height: space * 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: btnStyle,
                onPressed: clearNumShown,
                child: Text("Clear"),
              ),
              SizedBox(width: space),
              ElevatedButton(
                style: btnStyle,
                onPressed: incNumShown,
                child: Text("+"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
