import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/Home/ketquaSearch.dart';
import 'package:ticketapp/Models/accountObj.dart';
import 'package:ticketapp/Models/busstation.dart';
import 'package:ticketapp/Models/chairObj.dart';
import 'package:ticketapp/Models/searchObj.dart';
import 'package:ticketapp/Models/ticketInforObj.dart';
import 'package:ticketapp/Models/ticketObj.dart';
import 'package:ticketapp/http/request.dart';

class HomeController extends GetxController {
// var noidi = RxString("");
// var noiden = RxString("");
  var day="".obs;
  final TextEditingController noidi = TextEditingController();
  final TextEditingController noiden = TextEditingController();
  final RxList listHistory = [].obs;

  List<String> listSelected = [];
  List<TicketObj> listsearch = [
    // TicketObj("Hạnh Luyến", "Quảng Bình", "Đà Nẵng", "6h", "10h", 200000, 12),
    // TicketObj("Trung Tính", "Quảng Bình", "Đà Nẵng", "4h", "8h", 250000, 20),
    // TicketObj("Hạnh Luyến", "Quảng Bình", "Đà Nẵng", "13h", "17h", 220000, 15),
  ];
  List<String> inforAccount = [
    "Phạm Văn Phương",
    "0776261632",
    "Quảng Bình",
    "5277224242233"
  ];
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

  List<TicketInforObj> listTicketed = [];

  void apiGetAllBusStation() async {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
    var headers = {"Content-type": "application/json"};
    Request request = Request(
        Url: "https://qlbvxk.herokuapp.com/api/busstations",
        body: jsonEncode({"Email": noidi.text, "MatKhau": noiden.text}),
        header: headers);
    request.get().then((value) {
      var responseData = jsonDecode(value.body) as List;
      print(responseData.length);
      List<BusStation> ListBusStation = responseData.map((e) {
        return BusStation(maBx: e["maBx"], tenBx: e["tenBx"]);
      }).toList();
      print("hi: ${ListBusStation.length}");
      tk(ListBusStation);
    }).catchError((e) {
      print("loi ${e.toString()}");
    });
  }

  void tk(List<BusStation> s) {
    if (s.length != 0) {
      if (getMaBx(s, noidi.text.toUpperCase()) != 0) {
        if (getMaBx(s, noiden.text.toUpperCase()) != 0) {
          print(getMaBx(s, noidi.text.toUpperCase()));
          print(getMaBx(s, noiden.text.toUpperCase()));
          int maBxdi = getMaBx(s, noidi.text.toUpperCase());
          int maBxden = getMaBx(s, noiden.text.toUpperCase());
          String url =
              "https://qlbvxk.herokuapp.com/api/bustrips/search?dep=$maBxdi&dest=$maBxden&date=${Swap(day.value)}";
          var headers = {"Content-type": "application/json"};
          print(url);
          Request request = Request(
              Url: url,
              body: jsonEncode({"Email": noidi.text, "MatKhau": noiden.text}),
              header: headers);
          request.get().then((value) {
            if (value.body != "") {
              var responseDatas = json.decode(value.body) as List;
              listsearch = responseDatas.map((e) {
                return TicketObj.fromJson(e);
              }).toList();

              Get.back();

              Get.to(() => KetquaSearch(
                    noidi: getTenBx(s, noidi.text.toUpperCase()),
                    noiden: getTenBx(s, noiden.text.toUpperCase()),
                    day: day.value,
                  ));
            } else
              print("size null");
          });
        } else {
          Get.back();
          Get.to(() => KetquaSearch(
                noidi: getTenBx(s, noidi.text),
                noiden: getTenBx(s, noiden.text),
                day: day.value,
              ));
        }
      } else {
        Get.back();
        Get.to(() => KetquaSearch(
              noidi: getTenBx(s, noidi.text),
              noiden: getTenBx(s, noiden.text),
              day: day.value,
            ));
      }
    }
  }

  int getMaBx(List<BusStation> bus, String s) {
    for (int i = 0; i < bus.length; i++) {
      if (bus[i].tenBx.toUpperCase().contains(s)) {
        return bus[i].maBx;
      }
    }
    return 0;
  }

  String getTenBx(List<BusStation> bus, String s) {
    for (int i = 0; i < bus.length; i++) {
      if (bus[i].tenBx.toUpperCase().contains(s)) {
        String ss = bus[i].tenBx.substring(7, bus[i].tenBx.length);
        String sss = ss[0];
        sss = sss.toUpperCase();
        ss = ss.replaceRange(0, 1, sss);
        return ss;
      }
    }
    return "hi";
  }

  String Swap(String s) {
    String yyyy = s.substring(6, s.length);
    String mm = s.substring(2, 6);
    String dd = s.substring(0, 2);
    print("${dd + mm + yyyy}");
    return (yyyy + mm + dd);
  }
}
