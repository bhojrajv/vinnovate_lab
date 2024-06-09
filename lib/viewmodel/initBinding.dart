import 'package:get/get.dart';
import 'package:vinnovate_task/viewmodel/courseController.dart';
import 'package:vinnovate_task/viewmodel/logincontroller.dart';
import 'package:vinnovate_task/viewmodel/services.dart';
import 'package:vinnovate_task/viewmodel/signupcontroller.dart';

class InitiBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => CourseController(apiServices: ApiServices()));
    Get.lazyPut(() => SignUpcontroller());
    Get.lazyPut(() => LoginController());
  }

}