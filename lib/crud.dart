import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:userinter/usermodel.dart';

class crud extends StatefulWidget {
  const crud({Key? key}) : super(key: key);

  @override
  _crudState createState() => _crudState();
}

class _crudState extends State<crud> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _formKey2 = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    Customer cust = new Customer(username: " ", phone: " ", uid: " ");
    return Container(
      child: Column(
        children: [
          FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                FormBuilderTextField(
                  name: "uname",
                  validator: (value) =>
                      value == "" ? "Enter the username" : null,
                  decoration: const InputDecoration(
                    // fillColor: Colors.white,

                    border: OutlineInputBorder(),
                    hintText: 'Username',
                  ),
                ),
                FormBuilderTextField(
                  name: "mobile",
                  validator: (value) => value == "" ? "Enter the mobile" : null,
                  decoration: const InputDecoration(
                    // fillColor: Colors.white,

                    border: OutlineInputBorder(),
                    hintText: 'Mobile Number',
                  ),
                )
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () => {
                    if (_formKey.currentState!.validate())
                      {
                        _formKey.currentState!.save(),
                        cust = Customer(
                            username: _formKey.currentState!.value["uname"],
                            phone: _formKey.currentState!.value["mobile"],
                            uid: " "),
                        FirebaseFirestore.instance
                            .collection("users")
                            .add(cust.toMap()),
                        // print(_formKey.currentState!.value)
                      }
                    else
                      {
                        print("NOT WORKING"),
                      }
                  },
              child: const Text("OK")),
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: StreamBuilder<List<Customer>>(
                  stream: FirebaseFirestore.instance
                      .collection("users")
                      .snapshots()
                      .map(
                    (event) {
                      final result = event.docs
                          .map((e) => Customer.fromMap(e.data(), e.id))
                          .toList();
                      return result;
                    },
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.length == 0) {
                        return Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: Text("EMPTY DATA"),
                        );
                      } else {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                  leading: IconButton(
                                      onPressed: () => showDialog<String>(
                                            context: context,
                                            builder: (ctx) => AlertDialog(
                                              title: Text("Alert Dialog Box"),
                                              content: Container(
                                                child: Column(children: [
                                                  FormBuilder(
                                                    key: _formKey2,
                                                    child: Column(
                                                      children: [
                                                        FormBuilderTextField(
                                                          initialValue: snapshot
                                                              .data![index]
                                                              .username,
                                                          name: "uname",
                                                          validator: (value) =>
                                                              value == ""
                                                                  ? "Enter the username"
                                                                  : null,
                                                          decoration:
                                                              const InputDecoration(
                                                            // fillColor: Colors.white,

                                                            border:
                                                                OutlineInputBorder(),
                                                            hintText:
                                                                'Username',
                                                          ),
                                                        ),
                                                        FormBuilderTextField(
                                                          initialValue: snapshot
                                                              .data![index]
                                                              .phone,
                                                          name: "mobile",
                                                          validator: (value) =>
                                                              value == ""
                                                                  ? "Enter the mobile"
                                                                  : null,
                                                          decoration:
                                                              const InputDecoration(
                                                            // fillColor: Colors.white,

                                                            border:
                                                                OutlineInputBorder(),
                                                            hintText:
                                                                'Mobile Number',
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  ElevatedButton(
                                                      onPressed: () => {
                                                            if (_formKey2
                                                                .currentState!
                                                                .validate())
                                                              {
                                                                _formKey2
                                                                    .currentState!
                                                                    .save(),
                                                                cust = Customer(
                                                                    username: _formKey2
                                                                            .currentState!
                                                                            .value[
                                                                        "uname"],
                                                                    phone: _formKey2
                                                                        .currentState!
                                                                        .value["mobile"],
                                                                    uid: " "),
                                                                FirebaseFirestore
                                                                    .instance
                                                                    .collection(
                                                                        "users")
                                                                    .doc(
                                                                      snapshot
                                                                          .data![
                                                                              index]
                                                                          .uid,
                                                                    )
                                                                    .set(cust
                                                                        .toMap()),
                                                                Navigator.of(
                                                                        ctx)
                                                                    .pop(),
                                                                // print(_formKey.currentState!.value)
                                                              }
                                                            else
                                                              {
                                                                print(
                                                                    "NOT WORKING"),
                                                              }
                                                          },
                                                      child: const Text("OK")),
                                                ]),
                                              ),
                                              actions: <Widget>[
                                                FlatButton(
                                                  onPressed: () {
                                                    Navigator.of(ctx).pop();
                                                  },
                                                  child: Text("CANCEL"),
                                                ),
                                              ],
                                            ),
                                          ),
                                      icon: Icon(Icons.edit)),
                                  subtitle: Text(
                                    snapshot.data![index].phone,
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 15),
                                  ),
                                  trailing: IconButton(
                                      onPressed: () => {
                                            FirebaseFirestore.instance
                                                .collection("users")
                                                .doc(
                                                  snapshot.data![index].uid,
                                                )
                                                .delete(),
                                          },
                                      icon: Icon(Icons.delete)),
                                  title: Text(
                                    snapshot.data![index].username,
                                  ));
                            });
                      }
                    } else {
                      return Text("LOADING");
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
