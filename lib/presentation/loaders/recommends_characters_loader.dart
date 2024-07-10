import 'package:flutter/material.dart';
import 'package:marvel/presentation/views/utils/consts_util.dart';
import 'package:marvel/presentation/views/utils/size_extesion_util.dart';
import 'package:skeletons/skeletons.dart';

class RecommendsCharactersLoader extends StatelessWidget {
  const RecommendsCharactersLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: ConstsUtils.defaultPadding
      ),
      scrollDirection: Axis.horizontal,
      children: List.generate(
        8,
        (index) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SkeletonAvatar(
              style: SkeletonAvatarStyle(
                borderRadius: BorderRadius.circular(100),
                height: context.sizedDevice.height / 15,
                width: context.sizedDevice.height / 15,
                padding: const EdgeInsets.only(left: 8.0),
              ),
            ),
            const SizedBox(height: 5),
            SkeletonLine(
              style: SkeletonLineStyle(
                height: 10,
                width: 40,
                borderRadius: BorderRadius.circular(4)),
              ),
            ],
          )
        ),
    );
  }
}
