import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class UHelperFunctions {
  UHelperFunctions._();

  // Size, Height, and Width of the Screen
  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  // Dark Mode
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  // Given a string => Return a Color
  static Color? getColor(String value) {
    if (value == 'Green') {
      return Colors.green;
    }
    if (value == 'Red') {
      return Colors.red;
    }
    if (value == 'Blue') {
      return Colors.blue;
    }
    if (value == 'Pink') {
      return Colors.pink;
    }
    if (value == 'Yellow') {
      return Colors.yellow;
    }
    if (value == 'Black') {
      return Colors.black;
    }
    if (value == 'White') {
      return Colors.white;
    }
    if (value == 'Purple') {
      return Colors.purple;
    }
    if (value == 'Orange') {
      return Colors.orange;
    }
    if (value == 'Brown') {
      return Colors.brown;
    }
    if (value == 'Grey') {
      return Colors.grey;
    }
    if (value == 'Lime') {
      return Colors.lime;
    }
    if (value == 'Amber') {
      return Colors.amber;
    }

    return null;
  }

  static String getFormattedDate(DateTime date,
      {String format = 'dd MMM yyy'}) {
    return DateFormat(format).format(date);
  }
}
