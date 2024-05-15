import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lmm_pos/screens/home_screen.dart';
import 'package:lmm_pos/screens/setting_screen.dart';
import 'package:lmm_pos/utils/styles/colors.dart';
import 'package:lmm_pos/widgets/textfont.dart';
import 'package:sizer/sizer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

int visit = 0;
final storage = GetStorage();

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    List pages = [HomeScreen(), SettingScreen()];
    List<TabItem> items = [
      TabItem(
        icon: Iconsax.home_2,
        title: tr('home_nav'),
      ),
      TabItem(
        icon: Iconsax.setting,
        title: tr('setting_nav'),
      ),
    ];
    return Scaffold(
      body: pages[visit],
      bottomNavigationBar: BottomBarDefault(
        items: items,
        backgroundColor: Colors.white,
        color: cr_textPrimary,
        colorSelected: cr_primary,
        titleStyle: storage.read('lang_id') == 'lo'
            ? GoogleFonts.notoSansLao(
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
              )
            : GoogleFonts.poppins(
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
              ),
        indexSelected: visit,
        onTap: (int index) => setState(() {
          visit = index;
        }),
      ),
    );
  }
}
