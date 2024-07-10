import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvel/presentation/views/utils/consts_util.dart';

class SearchTextfieldComponent extends StatelessWidget {
  const SearchTextfieldComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ConstsUtils.primaryColor.withOpacity(.1),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          width: .5,
          color: ConstsUtils.primaryColor.withOpacity(.3)
        )
      ),
      child: const TextField(
        style: TextStyle(
          fontFamily: ConstsUtils.fRegular,
          color: Colors.black
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            CupertinoIcons.search,
          ),
          hintText: "Procure aqui..."
        ),
      ),
    );
  }
}