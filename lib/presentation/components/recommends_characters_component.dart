import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:marvel/domain/entities/character_entity.dart';
import 'package:marvel/presentation/views/pages/details_character_page/details_character_page.dart';
import 'package:marvel/presentation/views/pages/details_recommend_character_page/details_recommend_character_page.dart';
import 'package:marvel/presentation/views/utils/consts_util.dart';
import 'package:marvel/presentation/views/utils/size_extesion_util.dart';

class RecommendsCharactersComponent extends StatelessWidget {
  final List<CharacterEntity> characters;
  const RecommendsCharactersComponent({super.key, required this.characters});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: ConstsUtils.defaultPadding
      ),
      scrollDirection: Axis.horizontal,
      children: List.generate(
        characters.length,
        (index) => Container(
          margin: const EdgeInsets.only(left: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () =>Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => DetailsRecommendCharacterPage(character: characters[index])
                    )
                  ),
                  child: CircleAvatar(
                    radius: context.sizedDevice.height / 25,
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(
                      characters[index].getUrlImg() ?? 'https://via.placeholder.com/350x150' 
                    ),
                  ),
                ),
                Text(
                  characters[index].name ?? "Sem nome",
                  style: TextStyle(
                    fontFamily: ConstsUtils.fRegular,
                    fontSize: context.sizedDevice.height / 50
                  ),
                ),
              ],
            ),
          )
        )
      );
  }
}
