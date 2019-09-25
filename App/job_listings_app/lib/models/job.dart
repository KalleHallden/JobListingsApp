import 'package:flutter/material.dart';

class Job {
  String jobTitle;
  String companyName;
  double salary;
  AssetImage companyLogo;
  String location;
  String timeRequirement;

  Job(this.companyName, this.jobTitle, this.salary, this.location, this.timeRequirement, this.companyLogo);
}


