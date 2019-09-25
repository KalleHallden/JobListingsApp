import 'package:flutter/material.dart';
import 'models/job.dart';

import 'models/global.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(40),
                  constraints: BoxConstraints.expand(height: 225),
                  decoration: BoxDecoration(
                    gradient: new LinearGradient(
                      colors: [lightBlueIsh, lightGreen],
                      begin: const FractionalOffset(1.0, 1.0),
                      end: const FractionalOffset(0.2, 0.2),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp
                    ),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight:  Radius.circular(30))
                  ),
                  child: Container(
                    padding: EdgeInsets.only(top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Find Your New Job', style: titleStyleWhite,)
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 120),
                  constraints: BoxConstraints.expand(height:200),
                  child: ListView(
                    padding: EdgeInsets.only(left: 40),
                    scrollDirection: Axis.horizontal,
                    children: getRecentJobs()
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  List<Job> findJobs() {
    List<Job> jobs = [];
    for (int i = 0; i < 10; i++) {
      jobs.add(new Job("Volvo", "Frontend Developer", 20000, "Remote", "Part time", new AssetImage("lib/assets/volvo.png")));
    }
    return jobs;
  }

  String makeSalaryToK(double salary) {
    String money = "";
    if (salary > 1000) {
      if (salary > 100000000) {
        salary = salary/100000000;
        money = salary.toInt().toString() + "M";
      } else {
        salary = salary/1000;
        money = salary.toInt().toString() + "K";
      }
    } else {
      money = salary.toInt().toString();
    }
    return "\$" + money;
  }

  List<Widget> getRecentJobs() {
    List<Widget> recentJobCards = [];
    List<Job> jobs = findJobs();
    for (Job job in jobs) {
      recentJobCards.add(getJobCard(job));
    }
    return recentJobCards;
  }

  Widget getJobCard(Job job) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(right: 20, bottom: 30, top: 30),
      height: 150,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          new BoxShadow(
            color: Colors.grey,
            blurRadius: 20.0,
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: job.companyLogo,
              ),
              Text(
                job.jobTitle,
                style: jobCardTitileStyleBlue,
              )
            ],
          ),
          Text(job.companyName + " - " + job.timeRequirement, style: jobCardTitileStyleBlack),
          Text(job.location),
          Text(makeSalaryToK(job.salary), style: salaryStyle)
        ],
      ),
    );
  }
}
