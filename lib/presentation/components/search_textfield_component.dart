import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvel/presentation/views/utils/consts_util.dart';

class SearchTextfieldComponent extends StatefulWidget {
  final TextEditingController controller;
  final void Function(String)? onSubmitted;
  final void Function() onClosed;
  const SearchTextfieldComponent({super.key, required this.onSubmitted, required this.controller, required this.onClosed});

  @override
  State<SearchTextfieldComponent> createState() => _SearchTextfieldComponentState();
}

class _SearchTextfieldComponentState extends State<SearchTextfieldComponent> {

  String value = "";
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
      child: TextField(
        controller: widget.controller,
        onSubmitted: widget.onSubmitted,
        onChanged: (v) => setState(() => value = v),
        style: const TextStyle(
          fontFamily: ConstsUtils.fRegular,
          color: Colors.black
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: const Icon(
            CupertinoIcons.search,
          ),
          hintText: "Procure aqui...",
          suffixIcon: value.trim().isEmpty ? null : GestureDetector(
            onTap: () {
              widget.onClosed();
              widget.controller.clear();
              setState(() => value = "");
            },
            child: const Icon(
              Icons.close,
            ),
          ),
        ),
      ),
    );
  }
}