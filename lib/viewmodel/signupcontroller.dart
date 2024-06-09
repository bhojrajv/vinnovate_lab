import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpcontroller extends GetxController{
  RxBool isSignup=false.obs;
  final TextEditingController email=TextEditingController();
  final TextEditingController password=TextEditingController();
  //makeing user signup
  Future<String?> userSignup({
    required String email,
    required String password,
  }) async {
    try {
      isSignup(true);
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      isSignup(false);
      Get.snackbar("message", "you have sign up successfully");
      return 'Success';
    } on FirebaseAuthException catch (e) {
      isSignup(false);
      if (e.code == 'weak-password') {
        isSignup(false);
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        isSignup(false);
        return 'The account already exists for that email.';
      } else {
        isSignup(false);
        return e.message;
      }
    } catch (e) {
      isSignup(false);
      return e.toString();
    }
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    password.dispose();
  }
}