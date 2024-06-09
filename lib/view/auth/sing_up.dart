import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vinnovate_task/Appconst/appcolors.dart';
import 'package:vinnovate_task/view/common_textfield.dart';
import 'package:vinnovate_task/view/course_screen.dart';
import 'package:vinnovate_task/viewmodel/signupcontroller.dart';

class SignupScreen extends GetView<SignUpcontroller> {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(leading: Icon(Icons.arrow_back_ios,color: AppcColors.textcolor,),backgroundColor: AppcColors.light_grey, elevation: 0),
      backgroundColor: AppcColors.light_grey,
      body: Obx(
        ()=> SingleChildScrollView(
          child: Container(alignment: Alignment.center,padding: EdgeInsets.all(5.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [ Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)), color: AppcColors.white,shadowColor: AppcColors.white,borderOnForeground: true, elevation: 2,child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  Image.asset("assets/login.jpg",height:100,width: 100,alignment: Alignment.center,fit: BoxFit.cover,),
                  SizedBox(height: 10,),
                  TextFieldForms(controller:controller.email ,label: "Email",icons: Icon(Icons.email,color:Colors.grey ,)),
                  SizedBox(height: 10,),
                  TextFieldForms(controller:controller.password ,label: "Password",icons: Icon(Icons.lock,color:Colors.grey ,),flag: "pass",sufix: Icon(Icons.remove_red_eye_sharp)),

                  SizedBox(height: 10,),
                 controller.isSignup.value==true?Center(child: CircularProgressIndicator(),): TextButton(onPressed: (){controller.userSignup(email: controller.email.text, password:controller.password.text)
                  .then((value) => value=="Success"?Get.to(CoursePage()):Get.snackbar("Error", value??""));}, child: Text("Sign Up",style: TextStyle(color: AppcColors.white),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(AppcColors.red), minimumSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width/1,45)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)))),),
                  SizedBox(height: 10,),
                ],),
              ),),
            ),Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already Do have an account?",style: TextStyle(fontSize: 15)),SizedBox(width: 5,),Text("Login In",style: TextStyle(color: AppcColors.textcolor,fontWeight: FontWeight.bold))
              ],
            )],),),
        ),
      ),);
  }
}
