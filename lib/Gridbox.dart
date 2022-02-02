import 'package:flutter/material.dart';
import 'package:userinter/Responsive.dart';

class Gridbox extends StatefulWidget {
  const Gridbox({Key? key}) : super(key: key);

  @override
  _GridboxState createState() => _GridboxState();
}

class _GridboxState extends State<Gridbox> {
  int quant = 6;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        child: GridView.count(
            crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
            crossAxisSpacing: 50.0,
            mainAxisSpacing: 50.0,
            children: List.generate(10, (index) {
              return Center(child: UserDetailCard());
            })),
      ),
    );
  }
}

class UserDetailCard extends StatelessWidget {
  const UserDetailCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: (() {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              // backgroundColor: Colors.b,
              content: Text(
            'TRANSACTION ERROR. Try after sometime',
          )),
        );
      }),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.blueGrey, borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(50)),
            ),
            Text('Name'),
            Text('Age'),
            Text('Phone'),
          ],
        ),
      ),
    );
  }
}
