import 'dart:io';
import 'dart:io';

import 'package:bdayapp/app_route.dart';
import 'package:bdayapp/db/db_helper.dart';
import 'package:bdayapp/db/model.dart';
import 'package:flutter/material.dart';

class ShowBdayScreen extends StatefulWidget {
  const ShowBdayScreen({Key? key}) : super(key: key);

  @override
  State<ShowBdayScreen> createState() => _ShowBdayScreenState();
}

class _ShowBdayScreenState extends State<ShowBdayScreen> {
  var birthdayList = <BirthDayModel>[];
  void getAllBirthDay() async {
    List<Map<String, dynamic>> birthday =
        await DBHelper.query() as List<Map<String, dynamic>>;
    setState(() {
      birthdayList =
          birthday.map((data) => BirthDayModel.fromJson(data)).toList();
      print(birthdayList);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getAllBirthDay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Birthday Person"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.home).then((value) {
            setState(() {});
          });
        },
      ),
      body: ListView.builder(
          itemCount: birthdayList.length,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: (birthdayList[index].image == null)
                          ? Image.asset(
                              "assets/download.png",
                              height: 100,
                              fit: BoxFit.cover,
                              width: 100,
                            )
                          : Image.file(
                              File("${birthdayList[index].image}"),
                              height: 100,
                              fit: BoxFit.cover,
                              width: 100,
                            ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${birthdayList[index].name}",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.1),
                        ),
                        Text(
                          "${birthdayList[index].date}",
                        ),
                        Text(
                          "${birthdayList[index].time}",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
