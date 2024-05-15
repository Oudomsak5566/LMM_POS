import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lmm_pos/screens/languages.dart';
import 'package:lmm_pos/utils/styles/boxdecoration.dart';
import 'package:lmm_pos/utils/styles/colors.dart';
import 'package:lmm_pos/utils/styles/icons.dart';
import 'package:lmm_pos/widgets/textfont.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final storage = GetStorage();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        behavior: HitTestBehavior.opaque,
        child: Container(
          child: Column(
            children: [
              Header(),
              const SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TextFont(
                                text: 'Most Popular Services',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextFont(
                              text: 'See All',
                              fontSize: 10,
                              color: cr_primary,
                            ),
                          ],
                        ),
                        Container(
                          height: 30.h,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TextFont(
                                text: 'Special Offers',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextFont(
                              text: 'See All',
                              fontSize: 10,
                              color: cr_primary,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Container(
                          // margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: 150.sp,
                          // color: cr_background,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Colors.blue, Colors.purple],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 2,
                                offset: Offset(1, 5),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget SearchFiled() {
    return Container(
      child: TextField(
        decoration: InputDecoration(
            hintText: tr('search'),
            hintStyle: storage.read('lang_id') == 'lo' ? GoogleFonts.notoSansLao() : GoogleFonts.poppins(),
            prefixIcon: const Icon(Iconsax.search_normal_1),
            suffixIcon: const Icon(Iconsax.more),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              // borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: cr_primary),
            ),
            filled: true,
            fillColor: cr_background),
      ),
    );
  }

  Container Header() {
    return Container(
      // height: 20.h,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(97, 131, 153, 1),
            Color.fromRGBO(60, 91, 111, 1),
            Color.fromRGBO(21, 52, 72, 1),
          ],
          stops: [0.0, 0.18, 1.0],
          transform: GradientRotation(152 * 3 / 180),
        ),
      ),
      child: SafeArea(
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: IntrinsicHeight(
                      child: Row(
                        children: [
                          Container(
                            width: 45.sp,
                            height: 45.sp,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/images/avatar_m.png'),
                                fit: BoxFit.cover,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 10,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    TextFont(
                                      text: 'Good Morning',
                                      color: cr_fff,
                                      fontSize: 10,
                                      maxLines: 2,
                                    ),
                                    SizedBox(width: 10),
                                    SizedBox(
                                      height: 13.sp,
                                      width: 13.sp,
                                      child: SvgPicture.asset(
                                        ic_handwave,
                                      ),
                                    ),
                                  ],
                                ),
                                TextFont(
                                  text: 'Oudomsak PHABOUDY',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: cr_fff,
                                  // maxLines: 2,
                                  noto: true,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        appbarLang(),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SearchFiled(),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget appbarLang() {
    return Container(
      // padding: const EdgeInsets.all(8),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              if (storage.read('lang_id') != null && storage.read('lang_flag') != null) {
                Get.to(() => const Language());
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
              decoration: defualtBoxDecorationWithShadow,
              child: storage.read('lang_id') == null && storage.read('lang_flag') == null
                  ? Container(
                      height: 6.w,
                      width: 6.w,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey[200]),
                    )
                  : Row(
                      children: [
                        SizedBox(
                          height: 6.w,
                          width: 6.w,
                          child: SvgPicture.asset(storage.read('lang_flag')),
                        ),
                        const SizedBox(width: 6),
                        TextFont(
                          text: storage.read('lang_id').toString().toUpperCase() == 'LO'
                              ? 'LA'
                              : storage.read('lang_id').toString().toUpperCase(),
                          poppin: true,
                          fontSize: 10,
                          color: cr_textPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
            ),
          ),
          // userController.isLogin.value
          //     ? InkWell(
          //         onTap: () => Get.to(() => NotificationBox()),
          //         child: badges.Badge(
          //           position: badges.BadgePosition.topEnd(top: -12, end: -2),
          //           badgeStyle: badges.BadgeStyle(
          //             shape: badges.BadgeShape.circle,
          //             borderRadius: BorderRadius.circular(30),
          //             padding: EdgeInsets.all(5),
          //             badgeColor: Color(0xff2ECC71),
          //           ),
          //           badgeContent: TextFont(
          //             text: '${homeController.messageUnread.value}',
          //             // text: '128',
          //             color: Colors.white,
          //             fontSize: 9,
          //             poppin: true,
          //           ),
          //           child: Padding(
          //             padding: const EdgeInsets.only(top: 2),
          //             child: SvgPicture.asset(MyIcon.ic_notification, width: 8.w),
          //           ),
          //         ),
          //       )
          //     : InkWell(
          //         onTap: () => login(),
          //         child: Padding(
          //           padding: const EdgeInsets.only(top: 2),
          //           child: SvgPicture.asset(MyIcon.ic_notification, width: 8.w),
          //         )),
        ],
      ),
    );
  }
}
