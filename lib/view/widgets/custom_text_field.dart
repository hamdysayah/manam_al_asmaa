import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:manjam_asmaa/controller/app_contrller.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.hintText,
    required this.textEditingController,
    required this.showSuffixIcon,
    required this.suffixIconClick,
    required this.onChanged,
  });

  AppController appController = Get.find();

  String hintText;
  Function(String) onChanged;
  TextEditingController textEditingController;
  bool showSuffixIcon;
  VoidCallback suffixIconClick;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      textInputAction: TextInputAction.next,
      onChanged: onChanged,
      inputFormatters: [
        LengthLimitingTextInputFormatter(1)
      ],
      decoration: InputDecoration(
          suffixIcon: Visibility(
            visible: showSuffixIcon,
            child: IconButton(
                icon: const Icon(Icons.clear_sharp),
                onPressed: suffixIconClick),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          filled: true,
          hintStyle: TextStyle(color: Colors.grey[700], fontSize: 10.sp),
          hintText: hintText,
          fillColor: Colors.white70),
    );
  }
}
