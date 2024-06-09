import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class ApiServices{
  //creating singletone
  static ApiServices? _intance;
  ApiServices._internal();
  factory ApiServices(){
    if(_intance==null){
     return _intance=ApiServices._internal();
    }else{
      return _intance??ApiServices();
    }
  }
  Future<dynamic>getCourses({int?limit,int?page})async{
    var jsonResponse;
    try{
      String?url="https://fakestoreapi.com/products?limit=${limit}&page=$page";
      final response=await http.get(Uri.parse(url));
      if(response.statusCode==200){
        jsonResponse=jsonDecode(response.body);
      }else{
        Get.snackbar("Error", "${response.statusCode} ${jsonResponse}");
      }
    }catch(ex){
      Get.snackbar("Error", "${ex.toString()}");
    }
    return jsonResponse;
  }
}