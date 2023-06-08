import 'package:flutter/material.dart';

void main() {
  runApp(Halaman2());
}

class Halaman2 extends StatelessWidget {
  const Halaman2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlue,
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('images/3.jpeg'),
              radius: 75.0,
            ),
            Text(
              'Ravi M. Akhyar',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Pacifico'),
            ),
            Text(
              'Dosen Pemrograman',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.lightBlue.shade100,
                  fontFamily: 'Source Sans Pro'),
            ),
            Divider(
              color: Colors.lightBlue.shade100,
              height: 20.0,
              thickness: 1.0,
              indent: 80,
              endIndent: 80,
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: ListTile(
                leading: Icon(
                  Icons.phone_android,
                  size: 28,
                  color: Colors.lightBlue,
                ),
                title: Text(
                  '+62123456789',
                  style: TextStyle(color: Colors.lightBlue, fontSize: 18),
                ),
              ),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  size: 28,
                  color: Colors.lightBlue,
                ),
                title: Text(
                  'ravi@gmail.com',
                  style: TextStyle(color: Colors.lightBlue, fontSize: 18),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
