import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:marvel/presentation/views/utils/consts_util.dart';
import 'package:marvel/presentation/views/utils/size_extesion_util.dart';

class CardCharactersComponent extends StatelessWidget {
  const CardCharactersComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: .5,
          color: ConstsUtils.primaryColor.withOpacity(.3)
        ),
        boxShadow: [
          BoxShadow(
            color: ConstsUtils.primaryColor.withOpacity(.1),
            offset: const Offset(0.0, 10),
            blurRadius: 10
          )
        ]
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              ConstsUtils.iSpider,
              fit: BoxFit.cover,
              height: context.sizedDevice.height / 7,
              width: context.sizedDevice.width / 4,
            ),
          ),
          const SizedBox(width: 10,),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Spider-Man",
                  style: TextStyle(
                    fontFamily: ConstsUtils.fBold,
                    fontSize: context.sizedDevice.height / 35
                  ),
                ),
            
                Text(
                  '''O Homem-Aranha (Spider-Man) é um super-herói fictício criado por Stan Lee e Steve Ditko...''',
                  style: TextStyle(
                    fontFamily: ConstsUtils.fRegular,
                    fontSize: context.sizedDevice.height / 50
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}