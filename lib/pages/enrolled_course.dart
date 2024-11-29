import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sprout_lms/components/course_structure.dart';

class enrolledCourses extends StatefulWidget {
  const enrolledCourses({super.key});

  @override
  State<enrolledCourses> createState() => _enrolledCoursesState();
}

class _enrolledCoursesState extends State<enrolledCourses> {


  List<CourseStructure> enrolledCourses= [
    CourseStructure(courseAvatar: 'course1.jpg', courseInstructor: 'Victor', courseName: 'English Beginner', courseLength: 14, courseStatus: 'Enrolled', userProgress: 0,courseStartDate: '15/09/2024'),
    // CourseStructure(courseAvatar: 'course2.jpg', courseInstructor: 'John', courseName: 'Problem Solving', courseLength: 11, courseStatus: 'Enrolled', userProgress: 0,courseStartDate: '28/09/2024'),
  ];

  @override
  Widget build(BuildContext context) {
    return
    ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
    itemCount: enrolledCourses.length,
      itemBuilder: (context, index) {
        return Card(
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 0.0),
              child: ListTile(
                onTap: () {},
                title: Text(enrolledCourses[index].courseName,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                  ),),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/${enrolledCourses[index].courseAvatar}'),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.only(top: 05.0),
                  child: Text('Instructor: ${enrolledCourses[index].courseInstructor}',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                trailing: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Course Starts on ${enrolledCourses[index].courseStartDate}",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
          ),
          color: Colors.orangeAccent,
        );
      },
    );
  }
}
