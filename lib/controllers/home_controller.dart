import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lmm_pos/models/setting_model.dart';
import 'package:lmm_pos/utils/styles/icons.dart';

class HomeController extends GetxController with WidgetsBindingObserver {
  final storage = GetStorage();
  late RxList<Lang> lang = RxList();

  getListLang() {
    lang.add(Lang(name: 'ພາສາລາວ', isSelected: false, code: const Locale('lo'), langId: 'lo', flat: flag_lao));
    lang.add(Lang(name: 'English', isSelected: false, code: const Locale('en', 'US'), langId: 'en', flat: flag_usa));
  }

  getStorgeLocal() {
    var langId = storage.read('lang_id');
    var langflag = storage.read('lang_flag');
    if (langId == null) {
      storage.write('lang_id', 'en');
      langId = 'en';
    }
    if (langflag == null) {
      langflag == flag_usa;
      storage.write('lang_flag', flag_lao);
    }
    Lang langs = lang.singleWhere((e) => e.langId == langId);
    langs.isSelected = true;
  }

  setLocal(Lang e, BuildContext context) async {
    for (var element in lang) {
      element.isSelected = false;
    }
    e.isSelected = true;
    storage.write('lang_id', e.langId);
    storage.write('lang_flag', e.flat);
    await context.setLocale(e.code!);
    Get.updateLocale(e.code!);
  }

  @override
  void onReady() async {
    super.onReady();

    getListLang();
    getStorgeLocal();
  }
}
