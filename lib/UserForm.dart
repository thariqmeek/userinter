import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class UserForm extends StatefulWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  String uname = " ";
  String mobile = " ";
  final _formKey = GlobalKey<FormBuilderState>();
  List<UserDetail> users = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FormBuilderTextField(
                    name: "username",
                    validator: (value) =>
                        value == "" ? "Enter the username" : null,
                    onChanged: ((value) {
                      setState(() {
                        uname = value!;
                      });
                    }),
                    decoration: const InputDecoration(
                      // fillColor: Colors.white,

                      border: OutlineInputBorder(),
                      hintText: 'Username',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FormBuilderTextField(
                    name: "mobile",
                    validator: (value) =>
                        value == "" ? "Enter the mobile number" : null,
                    onChanged: ((value) {
                      setState(() {
                        mobile = value!;
                      });
                    }),
                    decoration: const InputDecoration(
                      // fillColor: Colors.white,

                      border: OutlineInputBorder(),
                      hintText: 'Mobile',
                    ),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () => {
                    if (_formKey.currentState!.validate())
                      {
                        _formKey.currentState!.save(),
                        setState(() {
                          users.add(UserDetail(
                              _formKey.currentState!.value["username"],
                              _formKey.currentState!.value["mobile"]));
                        }),
                        print(_formKey.currentState!.value)
                      }
                    else
                      {
                        print("NOT WORKING"),
                      }
                  },
              child: const Text("OK")),
          Row(
            children: users.map((e) => Text(e.name + " " + e.mobile)).toList(),
          ),
          //Text(mobile.toString()),
        ],
      ),
    );
  }
}

class UserDetail {
  final String name, mobile;

  UserDetail(this.name, this.mobile);
}
