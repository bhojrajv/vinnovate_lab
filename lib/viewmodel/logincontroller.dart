import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  RxBool islogin=false.obs;
 RxBool isToggle=false.obs;

 final TextEditingController emaillogin=TextEditingController();
 final TextEditingController passlogin=TextEditingController();

  Future<String?> userlogin({
    required String email,
    required String password,
  }) async {
    try {
      islogin(true);
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      islogin(false);
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        islogin(false);
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        islogin(false);
        return 'Wrong password provided for that user.';
      } else {
        islogin(false);
        return e.message;
      }
    } catch (e) {
      islogin(false);
      return e.toString();
    }
  }
  void isTogglePass(){
    isToggle.value=!isToggle.value;
    update();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emaillogin.dispose();
    passlogin.dispose();
  }
}