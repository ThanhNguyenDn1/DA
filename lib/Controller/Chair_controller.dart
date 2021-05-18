import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/Controller/Home_controller.dart';
import 'package:ticketapp/Controller/Login_controller.dart';
import 'package:ticketapp/Models/SeatInfor.dart';
import 'package:ticketapp/Models/chairObj.dart';
import 'package:ticketapp/Models/seats.dart';
import 'package:ticketapp/Models/ticketInforObj.dart';
import 'package:ticketapp/http/request.dart';

class ChairController extends GetxController{
  HomeController homeController=Get.find();
  LoginController loginController=Get.find();

  var maCX;
  List<String> inforAccount = [
    "Phạm Văn Phương",
    "0776261632",
    "Quảng Bình",
    "5277224242233"
  ];
  List<TicketInforObj> listTicketed = [];
  List<SeatInfor> listSelected = [];
  var listSeat=<Seats>[].obs;
  List<ChairObj> listChair = [
    ChairObj(
      01,
      "A1",
      true,
      Colors.white,
    ),
    ChairObj(
      02,
      "A2",
      false,
      Colors.white,
    ),
    ChairObj(03, "A3", false, Colors.white),
    ChairObj(04, "B1", false, Colors.white),
    ChairObj(05, "B2", false, Colors.white),
    ChairObj(06, "B3", false, Colors.white),
    ChairObj(07, "A4", false, Colors.white),
    ChairObj(08, "A5", false, Colors.white),
    ChairObj(09, "A6", true, Colors.white),
    ChairObj(10, "B4", true, Colors.white),
    ChairObj(11, "B5", false, Colors.white),
    ChairObj(12, "B6", false, Colors.white),
    ChairObj(13, "A7", true, Colors.white),
    ChairObj(14, "A8", false, Colors.white),
    ChairObj(15, "A9", false, Colors.white),
    ChairObj(16, "B7", false, Colors.white),
    ChairObj(17, "B8", false, Colors.white),
    ChairObj(18, "B9", false, Colors.white),
    ChairObj(19, "A10", false, Colors.white),
    ChairObj(20, "A11", false, Colors.white),
    ChairObj(21, "A12", false, Colors.white),
    ChairObj(22, "B10", false, Colors.white),
    ChairObj(23, "B11", false, Colors.white),
    ChairObj(24, "B12", false, Colors.white),
    ChairObj(25, "A13", false, Colors.white),
    ChairObj(26, "A14", false, Colors.white),
    ChairObj(27, "A15", false, Colors.white),
    ChairObj(28, "B13", false, Colors.white),
    ChairObj(29, "B14", false, Colors.white),
    ChairObj(30, "B15", false, Colors.white),
    ChairObj(31, "A16", false, Colors.white),
    ChairObj(32, "A17", false, Colors.white),
    ChairObj(33, "A18", false, Colors.white),
    ChairObj(34, "B16", false, Colors.white),
    ChairObj(35, "B17", false, Colors.white),
    ChairObj(36, "B18", false, Colors.white),
  ];
  @override
  void onInit() {
    // TODO: implement onInit
    apiGetChair();
    super.onInit();
  }


  void apiBookTicket( String s) async{
    Get.dialog(Center(child: CircularProgressIndicator()),barrierDismissible: false);
    var headers = {"Content-type": "application/json"};
    Request request = Request(
        Url: "https://qlbvxk.herokuapp.com/api/seats/search?bustripid=${homeController.maCx}",
        body: jsonEncode({
          "MaKh" : loginController.accountObj.maNd,
          "MaChoNgoi" : [s],
          "MaChuyenXe" : homeController.maCx,
          "GhiChu": "Go"
        }),
        header: headers);
    print("[$s]");
  }

  void apiGetChair() async{
    var headers = {"Content-type": "application/json"};
    Request request = Request(
        Url: "https://qlbvxk.herokuapp.com/api/seats/search?bustripid=${homeController.maCx}",
        body: jsonEncode({"Email": "i", "MatKhau": "i"}),
        header: headers);
    request.get().then((value){
      print(request.Url);
      var responsedata=jsonDecode(value.body) as List;
      listSeat.value=responsedata.map((e){
        return Seats.fromJson(e);
      }).toList();
      print(listSeat.length);
      for(int i=0; i<listSeat.length; i++){
        listChair[i].id=listSeat[i].maChoNgoi;
        listChair[i].tinhtrang=listSeat[i].tinhTrangChoNgoi;
      }
    }).catchError((onError){
      print("Loi chair: ${onError.toString()}");
    });
  }
}