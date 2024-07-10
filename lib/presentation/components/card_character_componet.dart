import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marvel/domain/entities/character_entity.dart';
import 'package:marvel/presentation/views/utils/consts_util.dart';
import 'package:marvel/presentation/views/utils/size_extesion_util.dart';

class CardCharactersComponent extends StatelessWidget {
  final CharacterEntity characterEntity;
  const CardCharactersComponent({super.key, required this.characterEntity});

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
            child: characterEntity.getUrlImg() == null ?
              Container(
                color: Colors.grey.withOpacity(.1),
              )
            : FadeInImage(
              placeholder: const AssetImage(ConstsUtils.placeHolder),
                image: CachedNetworkImageProvider(
                  characterEntity.getUrlImg() ?? 'https://via.placeholder.com/350x150',
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
                  characterEntity.name ?? "Sem nome",
                  style: TextStyle(
                    fontFamily: ConstsUtils.fBold,
                    fontSize: context.sizedDevice.height / 35
                  ),
                ),
            
                Text(
                  characterEntity.description == null || characterEntity.description == ""
                    ? "Sem descrição disponível"
                    : "${characterEntity.description!.length < 40 ? characterEntity.description : (characterEntity.description ?? "").substring(0, 40)}...",
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