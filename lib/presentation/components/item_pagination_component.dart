import 'package:flutter/material.dart';
import 'package:marvel/presentation/views/utils/consts_util.dart';
import 'package:marvel/presentation/views/utils/size_extesion_util.dart';

class ItemPaginationComponent extends StatelessWidget {
  final int index;
  final void Function()? onTap;
  final bool selected;
  const ItemPaginationComponent({super.key, required this.index, required this.selected, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: selected
            ? ConstsUtils.primaryColor
            : ConstsUtils.primaryColor.withOpacity(.1),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            width: .5, 
            color: ConstsUtils.primaryColor.withOpacity(.3)
          )
        ),
        alignment: Alignment.center,
        child: Text(
          (index + 1).toString(),
          style: TextStyle(
            fontFamily: ConstsUtils.fBold,
            fontSize: context.sizedDevice.height / 50,
            color: selected ? Colors.white : Colors.black
          ),
        ),
      ),
    );
  }
}
