// // ignore_for_file: prefer_const_constructors, deprecated_member_use

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:lmm_pos/widgets/textfont.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';
// import 'package:sizer/sizer.dart';

// import '../styles/colors.dart';
// import '../styles/icons.dart';

// class DialogHelper {
//   static void showErrorDialog({
//     String title = 'something went wrong.',
//     String description = 'ການເຊື່ອມຕໍ່ລະບົບມີບັນຫາ, ກະລຸນາລອງໃຫມ່ອີກຄັ້ງ.',
//     VoidCallback? onClose,
//   }) {
//     Get.dialog(
//       WillPopScope(
//         onWillPop: () async => false,
//         child: Dialog(
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//           child: Padding(
//             padding: const EdgeInsets.all(0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Stack(
//                   alignment: Alignment.bottomCenter,
//                   children: [
//                     ClipPath(
//                       clipper: CustomShape(), // this is my own class which extendsCustomClipper
//                       child: Container(
//                         decoration: BoxDecoration(
//                             color: Color(0xffFCD9DB),
//                             borderRadius:
//                                 BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
//                         height: 120,
//                       ),
//                     ),
//                     SvgPicture.asset(
//                       dialog_warning_red,
//                       height: 75,
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10),
//                 TextFont(
//                   text: title,
//                   fontWeight: FontWeight.bold,
//                   color: cr_primary,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 10),
//                         child: TextFont(
//                           text: description,
//                           textAlign: TextAlign.center,
//                           maxLines: 5,
//                           fontWeight: FontWeight.normal,
//                           color: Color(0xff636E72),
//                         ),
//                       ),
//                       const SizedBox(height: 30),
//                       SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               backgroundColor: cr_background,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(6), // <-- Radius
//                               ),
//                               elevation: 0,
//                               padding: EdgeInsets.symmetric(vertical: 10)),
//                           onPressed: () {
//                             hide();
//                             if (onClose != null) {
//                               onClose();
//                             }
//                           },
//                           child: TextFont(
//                               text: 'close',
//                               textAlign: TextAlign.center,
//                               color: Colors.white,
//                               fontWeight: FontWeight.normal),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   static void showSuccessDialog(
//       {String title = 'Success.', String description = 'ດຳເນີນການສຳເລັດ.', VoidCallback? onClose}) {
//     Get.dialog(
//       WillPopScope(
//         onWillPop: () async => false,
//         child: Dialog(
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//           child: Padding(
//             padding: const EdgeInsets.all(0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Stack(
//                   alignment: Alignment.bottomCenter,
//                   children: [
//                     ClipPath(
//                       clipper: CustomShapeOut(), // this is my own class which extendsCustomClipper
//                       child: Container(
//                         decoration: BoxDecoration(
//                             color: Color(0xffFDF7EC),
//                             borderRadius:
//                                 BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
//                         height: 130,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 10),
//                       child: SvgPicture.asset(
//                         dialog_success,
//                         height: 75,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 6),
//                 TextFont(
//                   text: title,
//                   fontWeight: FontWeight.bold,
//                   color: cr_primary,
//                   poppin: true,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 10),
//                         child: TextFont(
//                           text: description,
//                           textAlign: TextAlign.center,
//                           maxLines: 5,
//                           color: Color(0xff636E72),
//                         ),
//                       ),
//                       const SizedBox(height: 30),
//                       SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               backgroundColor: cr_background,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(6), // <-- Radius
//                               ),
//                               elevation: 0,
//                               padding: EdgeInsets.symmetric(vertical: 10)),
//                           onPressed: () {
//                             hide();
//                             if (onClose != null) {
//                               onClose();
//                             }
//                           },
//                           child: TextFont(
//                             text: 'close',
//                             textAlign: TextAlign.center,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   static Future<bool> confirmYseOrNo({
//     String title = 'confirm',
//     String description = 'question_confirm_logout',
//   }) async {
//     bool? result = await showDialog<bool>(
//       context: Get.overlayContext!,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextFont(
//                 text: title,
//                 fontSize: 20,
//                 fontWeight: FontWeight.w300,
//               ),
//               SizedBox(
//                 height: 25,
//               ),
//               TextFont(
//                 text: description,
//                 fontWeight: FontWeight.w300,
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   TextButton(
//                     onPressed: () => Get.back(result: false),
//                     child: TextFont(
//                       text: "cancel",
//                       fontWeight: FontWeight.w300,
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () => Get.back(result: true),
//                     child: TextFont(
//                       text: "confirm",
//                       fontWeight: FontWeight.w300,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         );
//       },
//     );

//     return result ?? false;
//   }

//   static void showSuccessDialogNew({String description = 'ດຳເນີນການສຳເລັດ.', VoidCallback? onClose}) {
//     Get.dialog(
//       WillPopScope(
//         onWillPop: () async => false,
//         child: Dialog(
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//           backgroundColor: Colors.white,
//           child: Padding(
//             padding: const EdgeInsets.only(top: 40, bottom: 40),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Image.asset(
//                   img_complete,
//                   width: 40.w,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 10),
//                         child: TextFont(
//                           text: description,
//                           textAlign: TextAlign.center,
//                           maxLines: 5,
//                           color: cr_primary,
//                           fontWeight: FontWeight.w600,
//                           fontSize: 13,
//                         ),
//                       ),
//                       const SizedBox(height: 30),
//                       SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               backgroundColor: cr_background,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(6), // <-- Radius
//                               ),
//                               elevation: 0,
//                               padding: EdgeInsets.symmetric(vertical: 10)),
//                           onPressed: () {
//                             hide();
//                             if (onClose != null) {
//                               onClose();
//                             }
//                           },
//                           child: TextFont(
//                             text: 'close',
//                             textAlign: TextAlign.center,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   static void showWarnDialog({
//     String title = 'Oops.',
//     String description = 'ການເຊື່ອມຕໍ່ລະບົບມີບັນຫາ, ກະລຸນາລອງໃຫມ່ອີກຄັ້ງ.',
//     VoidCallback? onClose,
//   }) {
//     Get.dialog(
//       WillPopScope(
//         onWillPop: () async => false,
//         child: Dialog(
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//           child: Padding(
//             padding: const EdgeInsets.all(0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Stack(
//                   alignment: Alignment.bottomCenter,
//                   children: [
//                     ClipPath(
//                       clipper: CustomShape(), // this is my own class which extendsCustomClipper
//                       child: Container(
//                         decoration: BoxDecoration(
//                             color: Color(0xffFDF7EC),
//                             borderRadius:
//                                 BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
//                         height: 120,
//                       ),
//                     ),
//                     SvgPicture.asset(
//                       dialog_warning_green,
//                       height: 75,
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10),
//                 TextFont(
//                   text: title,
//                   fontWeight: FontWeight.bold,
//                   color: cr_primary,
//                   poppin: true,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 10),
//                         child: TextFont(
//                           text: description,
//                           textAlign: TextAlign.center,
//                           fontWeight: FontWeight.normal,
//                           maxLines: 5,
//                           color: Color(0xff636E72),
//                         ),
//                       ),
//                       const SizedBox(height: 30),
//                       SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               backgroundColor: cr_background,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(6), // <-- Radius
//                               ),
//                               elevation: 0,
//                               padding: EdgeInsets.symmetric(vertical: 10)),
//                           onPressed: () {
//                             hide();
//                             if (onClose != null) {
//                               onClose();
//                             }
//                           },
//                           child: TextFont(
//                             text: 'close',
//                             textAlign: TextAlign.center,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   static void showErrorWithFunctionLaterDialog({
//     String title = 'something went wrong',
//     String description = 'ການເຊື່ອມຕໍ່ລະບົບມີບັນຫາ, ກະລຸນາລອງໃຫມ່ອີກຄັ້ງ.',
//     String closeTitle = 'close',
//     Function()? onClose,
//   }) {
//     Get.dialog(
//       WillPopScope(
//         onWillPop: () async => false,
//         child: Dialog(
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//           child: Padding(
//             padding: const EdgeInsets.all(0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Stack(
//                   alignment: Alignment.bottomCenter,
//                   children: [
//                     ClipPath(
//                       clipper: CustomShape(), // this is my own class which extendsCustomClipper
//                       child: Container(
//                         decoration: BoxDecoration(
//                             color: Color(0xffFCD9DB),
//                             borderRadius:
//                                 BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
//                         height: 120,
//                       ),
//                     ),
//                     SvgPicture.asset(
//                       dialog_warning_red,
//                       height: 75,
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10),
//                 TextFont(
//                   text: title,
//                   // poppin: true,
//                   fontWeight: FontWeight.bold,
//                   color: cr_primary,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 10),
//                         child: TextFont(
//                           text: description,
//                           textAlign: TextAlign.center,
//                           maxLines: 8,
//                           fontWeight: FontWeight.normal,
//                           color: Color(0xff636E72),
//                         ),
//                       ),
//                       const SizedBox(height: 30),
//                       Flex(
//                         direction: Axis.horizontal,
//                         children: [
//                           Expanded(
//                             flex: 1,
//                             child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                   backgroundColor: cr_background,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(6), // <-- Radius
//                                   ),
//                                   elevation: 0,
//                                   padding: EdgeInsets.symmetric(vertical: 10)),
//                               onPressed: onClose,
//                               child: TextFont(
//                                   text: closeTitle,
//                                   textAlign: TextAlign.center,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.normal),
//                             ),
//                           ),
//                           SizedBox(width: 6),
//                           Expanded(
//                             flex: 1,
//                             child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                   backgroundColor: cr_background,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(6), // <-- Radius
//                                   ),
//                                   elevation: 0,
//                                   padding: EdgeInsets.symmetric(vertical: 10)),
//                               onPressed: () => Get.back(),
//                               child: TextFont(
//                                   text: 'later',
//                                   textAlign: TextAlign.center,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.normal),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   static void hide() {
//     if (Get.isDialogOpen!) Get.back();
//   }
// }

// class Loading {
//   static void hide() {
//     Get.back();
//   }

//   static void show() {
//     Get.dialog(
//       Dialog(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SvgPicture.asset(
//                 ic_mmoneyx,
//                 height: 80,
//                 width: 80,
//               ),
//               LoadingAnimationWidget.horizontalRotatingDots(color: cr_background, size: 40),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CustomShape extends CustomClipper<Path> {
//   @override
//   getClip(Size size) {
//     double height = size.height;
//     double width = size.width;
//     var path = Path();
//     // path.lineTo(0, height - 50);
//     // path.quadraticBezierTo(width / 2, height, width, height - 50);
//     // path.lineTo(width, 0);
//     // path.close();
//     path.lineTo(0, height);
//     path.quadraticBezierTo(width * 0.5, height - 60, width, height);
//     path.lineTo(width, 0);
//     path.close();

//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper oldClipper) {
//     return true;
//   }
// }

// class CustomShapeOut extends CustomClipper<Path> {
//   @override
//   getClip(Size size) {
//     double height = size.height;
//     double width = size.width;
//     var path = Path();
//     path.lineTo(0, height - 30);
//     path.quadraticBezierTo(width * 0.5, height + 30, width, height - 30);
//     path.lineTo(width, 0);
//     path.close();

//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper oldClipper) {
//     return true;
//   }
// }
