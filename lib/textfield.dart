import 'package:flutter/material.dart';

class Textfield extends StatefulWidget {
  const Textfield({Key? key}) : super(key: key);

  @override
  _TextfieldState createState() => _TextfieldState();
}

class _TextfieldState extends State<Textfield> {
  String thariq = '';

  String bala = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          color: const Color.fromARGB(255, 225, 232, 233),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Small"),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: ((value) {
                    setState(() {
                      thariq = value;
                    });
                  }),
                  decoration: const InputDecoration(
                    // fillColor: Colors.white,

                    border: OutlineInputBorder(),
                    hintText: 'Enter a search term',
                  ),
                ),
              ),
              ElevatedButton(
                child: const Text('Click'),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                ),
                onPressed: () {
                  setState(() {
                    bala = thariq;
                  });
                },
              ),

              Text(thariq), //dynamically chanes

              Text(bala), //after button pressed
            ],
          )),
    );
  }
}

// In this file we get input from user and display it right below.

//Inside textfield we have onchange function which gets the inout from user and stores it in a defauot variable value and
// then we transfer the data of value to a predefined empty string variable "thariq",


// Inside button under onPressed Functionality we create a setsate method to transfer the data from thariq to another variable bala
// and store it  in bala and display it below



// In order to display the value after "Button click" 2 variables must be used else 1 variable is enough







