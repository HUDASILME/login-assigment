import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_work_and_sql/HomeWork/WelcomeScreen.dart';
import 'package:home_work_and_sql/HomeWork/sp_helper.dart';

class Body extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('add Data'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 130,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 0, bottom: 0),
              // padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'enter your name',
                    hintText: 'Enter value'),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 0, bottom: 0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'enter your email',
                    hintText: 'Enter value'),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                  onPressed: () {
                    if (emailController.text == null &&
                        nameController.text == null) {
                      showAlertDialog(context, "put data to save");
                    } else {
                      SPHelper.sp
                          .insetStringData("password", nameController.text);
                      SPHelper.sp
                          .insetStringData("email", emailController.text);
                    }
                  },
                  child: Text('Save data')),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                  onPressed: () {
                    var email = SPHelper.sp.getData("email");
                    var pass = SPHelper.sp.getData("password");
                    if (email != null && pass != null) {
                      if (emailController.text == email &&
                          nameController.text == pass) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return WelcomeScreen();
                            },
                          ),
                        );
                      } else {
                        showAlertDialog(context, "your data not match");
                      }
                    } else {
                      showAlertDialog(context, "no data found");
                    }
                  },
                  child: Text('get data')),
            ),
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context, String s) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("My title"),
      content: Text(s),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
