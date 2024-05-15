import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lmm_pos/utils/styles/colors.dart';
// import 'package:mmoney_merchant_x/utils/styles/colors.dart';
import 'package:sizer/sizer.dart';

class TextFont extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final int maxLines;
  final bool noto;
  final bool poppin;
  final bool args;
  final List<String>? arguments;
  TextFont({
    Key? key,
    required this.text,
    this.textAlign = TextAlign.left,
    this.color = cr_textPrimary,
    this.fontSize = 12.5,
    this.fontWeight = FontWeight.normal,
    this.noto = false,
    this.poppin = false,
    this.maxLines = 1,
    this.args = false,
    this.arguments,
  }) : super(key: key);

  final storage = GetStorage();
  @override
  Widget build(BuildContext context) {
    if (noto) {
      if (args) {
        return Text(text,
                textAlign: textAlign,
                maxLines: maxLines,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.notoSansLao(color: color, fontSize: fontSize.sp, fontWeight: fontWeight))
            .tr(args: arguments);
      } else {
        return Text(
          text,
          textAlign: textAlign,
          style: GoogleFonts.notoSansLao(color: color, fontSize: fontSize.sp, fontWeight: fontWeight),
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
        ).tr();
      }
    } else if (poppin) {
      return Text(
        text,
        textAlign: textAlign,
        style: GoogleFonts.poppins(color: color, fontSize: fontSize.sp, fontWeight: fontWeight),
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
      ).tr();
    } else if (args) {
      return Text(
        text,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: storage.read('lang_id') == 'lo'
            ? GoogleFonts.notoSansLao(color: color, fontSize: fontSize.sp, fontWeight: fontWeight)
            : GoogleFonts.poppins(color: color, fontSize: fontSize.sp, fontWeight: fontWeight),
      ).tr(args: arguments);
    } else {
      return Text(
        text,
        textAlign: textAlign,
        style: storage.read('lang_id') == 'lo'
            ? GoogleFonts.notoSansLao(color: color, fontSize: fontSize.sp, fontWeight: fontWeight)
            : GoogleFonts.poppins(color: color, fontSize: fontSize.sp, fontWeight: fontWeight),
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
      ).tr();
    }
  }
}

class RichTextFont extends StatelessWidget {
  final String titleText;
  final String subText;
  final TextAlign textAlign;
  final Color color;
  final Color subcolor;
  final double fontSize;
  final FontWeight fontWeight;
  final FontWeight subfontWeight;
  final int maxLines;
  final bool noto;
  final bool poppin;
  final bool args;
  final List<String>? arguments;
  final VoidCallback? func;

  RichTextFont({
    Key? key,
    required this.titleText,
    required this.subText,
    this.textAlign = TextAlign.left,
    this.color = cr_primary,
    this.subcolor = cr_textPrimary,
    this.fontSize = 12.5,
    this.fontWeight = FontWeight.normal,
    this.subfontWeight = FontWeight.normal,
    this.noto = false,
    this.poppin = false,
    this.maxLines = 1,
    this.args = false,
    this.arguments,
    this.func,
  }) : super(key: key);

  final storage = GetStorage();
  @override
  Widget build(BuildContext context) {
    if (noto) {
      return RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: titleText.tr(),
              style: GoogleFonts.notoSansLao(color: color, fontSize: fontSize.sp, fontWeight: fontWeight),
            ),
            TextSpan(
              text: ' ${subText.tr()}',
              style: GoogleFonts.notoSansLao(color: subcolor, fontSize: fontSize.sp, fontWeight: subfontWeight),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  if (func != null) {
                    func!();
                  }
                },
            ),
          ],
        ),
      );
    } else if (poppin) {
      return RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: titleText.tr(),
              style: GoogleFonts.poppins(color: color, fontSize: fontSize.sp, fontWeight: fontWeight),
            ),
            TextSpan(
              text: ' ${subText.tr()}',
              style: GoogleFonts.poppins(color: subcolor, fontSize: fontSize.sp, fontWeight: subfontWeight),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  if (func != null) {
                    func!();
                  }
                },
            ),
          ],
        ),
      );
    } else {
      return RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: titleText.tr(),
              style: storage.read('lang_id') == 'lo'
                  ? GoogleFonts.notoSansLao(color: color, fontSize: fontSize.sp, fontWeight: fontWeight)
                  : GoogleFonts.poppins(color: color, fontSize: fontSize.sp, fontWeight: fontWeight),
            ),
            TextSpan(
              text: ' ${subText.tr()}',
              style: storage.read('lang_id') == 'lo'
                  ? GoogleFonts.notoSansLao(color: subcolor, fontSize: fontSize.sp, fontWeight: subfontWeight)
                  : GoogleFonts.poppins(color: subcolor, fontSize: fontSize.sp, fontWeight: subfontWeight),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  if (func != null) {
                    func!();
                  }
                },
            ),
          ],
        ),
      );
    }
  }
}
