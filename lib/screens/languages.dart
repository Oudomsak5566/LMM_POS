// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lmm_pos/controllers/home_controller.dart';
import 'package:lmm_pos/utils/styles/boxdecoration.dart';
import 'package:lmm_pos/utils/styles/colors.dart';
import 'package:lmm_pos/utils/styles/icons.dart';
import 'package:lmm_pos/widgets/textfont.dart';
import 'package:sizer/sizer.dart';

class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   leading: IconButton(
      //     icon: Icon(
      //       Icons.arrow_back,
      //       color: Colors.black,
      //     ),
      //     onPressed: () {
      //       Get.back();
      //     },
      //   ),
      //   iconTheme: IconThemeData(color: Colors.black),
      //   backgroundColor: Colors.white,
      // ),
      // backgroundColor: Colors.white,
      body: Obx(
        () => SingleChildScrollView(
          child: Container(
            height: Get.height,
            decoration: backgroundDecoration,
            child: SafeArea(
              child: Column(
                children: [
                  AppBar(
                    automaticallyImplyLeading: false,
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    iconTheme: IconThemeData(color: cr_fff),
                    backgroundColor: Colors.transparent,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: SvgPicture.asset(
                          ic_languange,
                          width: 20.w,
                        )),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          ...homeController.lang.map((e) {
                            return InkWell(
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    children: [
                                      Row(children: [
                                        Stack(
                                          children: [
                                            SvgPicture.asset(e.flat!, width: 10.w),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        e.langId == 'lo'
                                            ? TextFont(text: e.name!, color: cr_fff, noto: true)
                                            : TextFont(text: e.name!, color: cr_fff, poppin: true),
                                        Spacer(),
                                        _iconControl(e.isSelected!)
                                      ]),
                                      Divider()
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  homeController.setLocal(e, context);
                                  Get.back();
                                });
                          })
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _iconControl(bool like) {
    if (like == false) {
      return SizedBox(
        width: 0,
        height: 0,
      );
    } else {
      return Icon(
        Icons.check_rounded,
        color: cr_primary,
        size: 18.sp,
      );
    }
  }
}
