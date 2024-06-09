import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vinnovate_task/Appconst/appcolors.dart';
import 'package:vinnovate_task/view/auth/sing_up.dart';
import 'package:vinnovate_task/view/common_textfield.dart';
import 'package:vinnovate_task/view/course_screen.dart';
import 'package:vinnovate_task/viewmodel/logincontroller.dart';


class Loginscreen extends GetView<LoginController> {
  const Loginscreen({Key? key}) : super(key: key);

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
                  TextFieldForms(controller:controller.emaillogin,label: "Email",icons: Icon(Icons.email,color:Colors.grey ,)),
                  SizedBox(height: 10,),
                  TextFieldForms(toggleEye:controller.isToggle.value , controller:controller.passlogin ,label: "Password",icons: Icon(Icons.lock,color:Colors.grey ,),flag: "pass",sufix: InkWell(onTap: (){
                    controller.isTogglePass();
                  }, child:controller.isToggle.value?Image.asset("assets/eyeoff.png",scale: 10.0,):Icon(Icons.remove_red_eye_sharp))),
                  SizedBox(height: 10,),
                  Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Forgot Password?",style: TextStyle(color: AppcColors.textcolor,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(height: 10,),
                controller.islogin.value==true?Center(child: CircularProgressIndicator(),) : TextButton(onPressed: (){controller.userlogin(email: controller.emaillogin.text, password: controller.passlogin.text).then((value){
                    if(value=="Success"){
                      Get.to(()=>CoursePage());
                    }else{
                      Get.snackbar("error", value??"");
                    }
                  });}, child: Text("Log In",style: TextStyle(color: AppcColors.white),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(AppcColors.red), minimumSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width/1,45)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)))),),
                  SizedBox(height: 10,),
    ],),
              ),),
            ),Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Do not have an account?",style: TextStyle(fontSize: 15)),SizedBox(width: 5,),InkWell(onTap: (){Get.to(()=>SignupScreen());}, child: Text( "Sign Up",style: TextStyle(color: AppcColors.textcolor,fontWeight: FontWeight.bold)))
              ],
            )],),),
        ),
      ),);
  }
}
