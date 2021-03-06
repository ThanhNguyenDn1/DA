import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ticketapp/Controller/Home_controller.dart';
import 'package:ticketapp/Home/historySearch.dart';
import 'package:ticketapp/Home/ketquaSearch.dart';
import 'package:ticketapp/Models/searchObj.dart';
import 'package:ticketapp/Theme/colors.dart';
import 'package:ticketapp/Theme/styles.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  DateTime date = DateTime.now();
  String pickday = DateFormat('dd-MM-yyyy').format(DateTime.now());

  Future _selectDate() async {

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2020),
      lastDate: new DateTime(2022),
    );
    pickday = DateFormat('dd-MM-yyyy').format(picked!);
    if (picked != null)  pickday =  pickday.toString();
   // homeController.day.value = pickday;

  }
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {

    // homeController.gethistory();
    //print(homeController.day.value);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent,statusBarIconBrightness: Brightness.light));
    return Scaffold(
      body: Container(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Container(
                          width: double.infinity,
                          height: 250,
                          decoration: BoxDecoration(
                              color: AppColors.background,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.background.withOpacity(0.3),
                                  blurRadius: 10,
                                  offset: Offset(4, 8),
                                )
                              ]),
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 30),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Ch??o b???n!",
                                        style: AppThemes.text30container,
                                      ),
                                      Text(
                                        "B???n mu???n ??i ????u ?",
                                        style: AppThemes.text18container,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 70,
                                  ),
                                  Icon(
                                    Icons.directions_bus_rounded,
                                    size: 100,
                                    color: Colors.black,
                                  ),
                                  Expanded(
                                    child: Container(),
                                  ),
                                ],
                              )
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 180, 20, 20),
                      child: Container(
                        padding: EdgeInsets.only(top: 15, bottom: 15),
                        height: 205,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.primary,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.shadow,
                                blurRadius: 20,
                                offset: Offset(4, 7),
                              )
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Icon(
                                      Icons.album,
                                      size: 22,
                                      color: Colors.deepPurpleAccent,
                                    ),
                                    Text("???", style: TextStyle(color: Colors.grey)),
                                    Text("???", style: TextStyle(color: Colors.grey)),
                                    Text("???", style: TextStyle(color: Colors.grey)),
                                    Text("???", style: TextStyle(color: Colors.grey)),
                                    Icon(
                                      Icons.album,
                                      size: 22,
                                      color: Colors.red,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "N??i xu???t ph??t",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.grey),
                                    ),
                                    Container(
                                      height: 35,
                                      width: 290,
                                      child: TextField(
                                        textCapitalization:
                                        TextCapitalization.words,
                                        controller: homeController.noidi,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          // focusedBorder: UnderlineInputBorder(
                                          //     borderSide: BorderSide(
                                          //         color: Colors.black12,
                                          //         width: 1.5)),
                                          hintText: "H?? N???i",
                                          hintStyle: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        cursorColor: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      width: 290,
                                      color: Colors.black12,
                                      height: 1.5,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "B???n mu???n ??i ????u ?",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.grey),
                                    ),
                                    Container(
                                      height: 35,
                                      width: 290,
                                      child: TextField(
                                        textCapitalization:
                                        TextCapitalization.words,
                                        controller: homeController.noiden,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "???? N???ng",
                                          hintStyle: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        cursorColor: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(children: <Widget>[
                              SizedBox(
                                width: 18,
                              ),
                              Expanded(
                                child: Container(
                                  color: Colors.black12,
                                  height: 1.5,
                                ),
                              )
                            ]),
                            SizedBox(height: 8),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(
                                            Icons.calendar_today_rounded,
                                            size: 22,
                                            color: Colors.blue,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Ng??y ??i",
                                            style: TextStyle(
                                                fontSize: 15, color: Colors.grey),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            child: GestureDetector(
                                              onTap: () {
                                                _selectDate();
                                              },
                                              child: Text(
                                                pickday,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ]),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: SizedBox(
                      width: 360,
                      height: 50,
                      child: InkWell(
                          onTap: () {
                            homeController.day.value= pickday;
                            onsearch();
                            // Get.to(() => KetquaSearch(day:pickday));
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xff1b1b3d),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                              child: Center(
                                child: Text(
                                  "T??m chuy???n",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              )))),
                ),
                SizedBox(height: 35),
                Container(
                  // decoration: BoxDecoration(
                  //     border: Border.all(color: Colors.red, width: 2)),
                  width: 420,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(width: 15),
                        Container(
                          child: Text(
                            "T??m ki???m g???n ????y",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              InkWell(
                                child: Text(
                                  "X??a t???t c???",
                                  style: TextStyle(
                                      color: Colors.deepPurpleAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                                onTap: () {
                                 homeController.deleteHistory();
                                },
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: 15),
                      ]),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 110,
                  decoration: BoxDecoration(color: Colors.transparent),
                  child: Obx(()=>homeController.listHistory.length==0?Center(child: Container(),):ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: homeController.listHistory.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          //decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40)),color: Colors.deepPurpleAccent),
                            height: 120,
                            width: 230,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                              elevation: 2,
                              child: InkWell(
                                onTap: () {
                                  //
                                },
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        SizedBox(width: 10),
                                        Icon(
                                          Icons.album,
                                          size: 13,
                                          color: Colors.deepPurpleAccent,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "${homeController.listHistory[index].noiDi}",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        Expanded(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: <Widget>[
                                                Icon(
                                                  Icons.arrow_forward,
                                                  color: Colors.grey,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                )
                                              ],
                                            ))
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        SizedBox(width: 10),
                                        Icon(
                                          Icons.album,
                                          size: 13,
                                          color: Colors.red,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "${homeController.listHistory[index].noiDen}",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: 32,
                                        ),
                                        Text(
                                          "${homeController.listHistory[index].ngayDi}",
                                          style: TextStyle(
                                              fontSize: 18, color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      );
                    },
                  ))
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onsearch() {
    if (homeController.noidi.text.isEmpty || homeController.noiden.text.isEmpty) {
      Get.snackbar(
        'L???i t??m ki???m',
        'Nh???p n??i ?????n v?? n??i ??i',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.color_snackbar,

      );
    } else {
      //homeController.listHistory.add(SearchObj(homeController.noidi.text, homeController.noiden.text, pickday));
      homeController.apiGetAllBusStation();
    }
  }
}