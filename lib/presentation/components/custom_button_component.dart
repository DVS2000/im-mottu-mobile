import 'package:flutter/material.dart';
import 'package:marvel/presentation/views/utils/consts_util.dart';
import 'package:marvel/presentation/views/utils/size_extesion_util.dart';

class CustomButtonComponent extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  const CustomButtonComponent({super.key, this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(ConstsUtils.defaultPadding),
        decoration: BoxDecoration(
          color: ConstsUtils.primaryColor,
          borderRadius: BorderRadius.circular(8)
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: context.sizedDevice.height / 40,
            fontFamily: ConstsUtils.fBold
          ),
        ),
      ),
    );
  }
}
