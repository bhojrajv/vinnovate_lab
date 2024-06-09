import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vinnovate_task/model/coursemodel.dart';
import 'package:vinnovate_task/viewmodel/services.dart';

class CourseController extends GetxController{
  final ApiServices apiServices;
  final RxList<CourseModel>_courselist=<CourseModel>[].obs;
   RxSet<CourseModel>new_course=<CourseModel>{}.obs;
  RxBool hasMoreData = true.obs;

  final int limit=5;
  RxInt page=1.obs;
  final ScrollController scrcontroller=ScrollController();
  CourseController({required this.apiServices});

  List<CourseModel>getCourses()=>_courselist.value;

  @override
  void onInit() {
    // TODO: implement onInit
    _courselist.clear();
    new_course.clear();
    super.onInit();
    fetchCourse(limit: limit);
    scrcontroller.addListener(() {
      if(scrcontroller.position.pixels==scrcontroller.position.maxScrollExtent){
        fetchCourse(limit: limit*page.value);
        log("addlistener2");
      }
    }) ;
  }
  //fetching courses
  RxBool isloading=false.obs;
 Future<void>fetchCourse({required int limit})async{
  // _courselist.value.clear();
   //new_course.value.clear();
   if (isloading.value) return; // Prevent multiple simultaneous requests
   isloading(true);
   var courseRes=await apiServices.getCourses(limit: limit,page:page.value);
  if(courseRes.isEmpty){
  hasMoreData(false);
  }else{
    for(var course in courseRes){
      new_course.add(CourseModel.fromJson(course));
    }
   /* if(new_course.value.length<limit){
      hasMoreData(false);
    }else{*/
      _courselist.value.addAll(new_course.value.where((element) => !_courselist.contains(element)));
      page.value++;
   // }

    isloading(false);
  }
   update();
 }
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrcontroller.dispose();
  }
}