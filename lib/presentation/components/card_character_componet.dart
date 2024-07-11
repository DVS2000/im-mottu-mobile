import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel/domain/entities/character_entity.dart';
import 'package:marvel/presentation/views/pages/details_character_page/details_character_page.dart';
import 'package:marvel/presentation/views/utils/consts_util.dart';
import 'package:marvel/presentation/views/utils/size_extesion_util.dart';

class CardCharactersComponent extends StatelessWidget {
  final CharacterEntity character;
  const CardCharactersComponent({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(DetailsCharacterPage(character: character,)),
      child: Container(
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
              child: character.getUrlImg() == null 
              ? Container(
                  color: Colors.grey.withOpacity(.1),
                )
              : FadeInImage(
                  placeholder: const AssetImage(ConstsUtils.placeHolder),
                    image: CachedNetworkImageProvider(
                      character.getUrlImg() ?? 'https://via.placeholder.com/350x150',
                    ),
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
                    character.name ?? "Sem nome",
                    style: TextStyle(
                      fontFamily: ConstsUtils.fBold,
                      fontSize: context.sizedDevice.height / 35
                    ),
                  ),
              
                  Text(
                    character.description == null || character.description == ""
                      ? "Sem descrição disponível"
                      : "${character.description!.length < 40 ? character.description : (character.description ?? "").substring(0, 40)}...",
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
      ),
    );
  }
}