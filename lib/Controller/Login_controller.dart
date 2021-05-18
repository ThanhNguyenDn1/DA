import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/Home/bottom_nav_bar.dart';
import 'package:ticketapp/Models/accountObj.dart';
import 'package:ticketapp/http/request.dart';

class LoginController extends GetxController {
  var eye=true.obs;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late AccountObj accountObj;
  @override
  void onInit() {
    // TODO: implement onInit
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void apiLogin() async {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
    var headers = {"Content-type": "application/json"};
    Request request=Request(Url:"https://qlbvxk.herokuapp.com/api/accounts/validate/",body:jsonEncode({
      "Email" : emailController.text,
      "MatKhau" : passwordController.text
    }),header: headers);
    request.post().then((value){
      print(value.body);
      AccountObj accountObj =AccountObj.fromJson(json.decode(value.body));
      print(accountObj.maNd);
      if(accountObj.maNd>0){
        this.accountObj=accountObj;
        Get.back();
        emailController.text ="";

        Get.off(()=>BottomNavBar());
      }
      else{
        Get.back();
        Get.snackbar("Error", "Lỗi Tài Khoản");
      }
    }
    ).catchError((e){

    });
  }
  
}
