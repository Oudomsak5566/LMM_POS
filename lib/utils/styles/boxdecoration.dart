import 'package:flutter/material.dart';
import 'package:lmm_pos/utils/styles/colors.dart';

final defualtBoxDecorationWithShadow = BoxDecoration(
  color: cr_fff,
  borderRadius: BorderRadius.circular(10),
  boxShadow: const [
    BoxShadow(
      color: Colors.black26,
      blurRadius: 2,
      offset: Offset(1, 1),
    ),
  ],
);

final backgroundDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      const Color.fromRGBO(97, 131, 153, 1),
      const Color.fromRGBO(60, 91, 111, 1).withOpacity(0.5),
      const Color.fromRGBO(21, 52, 72, 1).withOpacity(0.9),
    ],
    stops: const [0.0, 0.08, 1.0],
    transform: const GradientRotation(152 * 3 / 180),
  ),
);
