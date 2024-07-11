import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:marvel/domain/entities/character_entity.dart';
import 'package:marvel/presentation/components/recommends_characters_component.dart';
import 'package:marvel/presentation/controllers/character_controller.dart';
import 'package:marvel/presentation/loaders/recommends_characters_loader.dart';
import 'package:marvel/presentation/views/utils/consts_util.dart';
import 'package:marvel/presentation/views/utils/size_extesion_util.dart';

class DetailsCharacterPage extends StatefulWidget {
  final CharacterEntity character;
  const DetailsCharacterPage({super.key, required this.character});

  @override
  State<DetailsCharacterPage> createState() => _DetailsCharacterPageState();
}

class _DetailsCharacterPageState extends State<DetailsCharacterPage> {

  final _characterController = GetIt.I.get<CharacterController>();


  @override
  void initState() {
    _characterController.getRecommends(characterId: widget.character.id ?? 110369 /* ID DO CAPTAIN AMERICA */);
    super.initState();
  }

  @override
  void dispose() {
    //_characterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: context.sizedDevice.height,
        width: context.sizedDevice.width,
        child: Stack(
          children: [
            
            Align(
              alignment: Alignment.topCenter,
              child: FadeInImage(
                placeholder: const AssetImage(ConstsUtils.placeHolder),
                  image: CachedNetworkImageProvider(
                    widget.character.getUrlImg() ?? 'https://via.placeholder.com/350x150',
                  ),
                fit: BoxFit.cover,
                width: context.sizedDevice.width,
                height: context.sizedDevice.height / 2,
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: context.sizedDevice.height / 1.5,
                width: context.sizedDevice.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.white,
                      Colors.white,
                      Colors.white,
                      Colors.white,
                      Colors.white
                    ]
                  )
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: ConstsUtils.defaultPadding
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: context.sizedDevice.height / 10,),
                  
                            Text(
                              (widget.character.name ?? "").toUpperCase(),
                              style: TextStyle(
                                fontFamily: ConstsUtils.fBold,
                                fontSize: context.sizedDevice.height / 30
                              ),
                            ),
                            
                            Text(
                               widget.character.description == null || widget.character.description == ""
                                ? "Sem descrição disponível"
                                : widget.character.description ?? "Sem descrição disponível",
                              style: TextStyle(
                                fontFamily: ConstsUtils.fRegular,
                                fontSize: context.sizedDevice.height / 45
                              ),
                            ),
                            const SizedBox(height: 20,),
                            
                            Text(
                              "Personagens relacionados".toUpperCase(),
                              style: TextStyle(
                                fontFamily: ConstsUtils.fBold,
                                fontSize: context.sizedDevice.height / 50,
                                color: ConstsUtils.primaryColor
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: context.sizedDevice.height / 6,
                        width: context.sizedDevice.width,
                        child: Obx(
                          () {
                            if(_characterController.isLoadingRecommends.value) {
                              return const RecommendsCharactersLoader();
                  
                            } else {
                              return RecommendsCharactersComponent(characters: _characterController.charactersRecommends);
                            
                            }
                          }
                        )
                      )
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              top: 60,
              left: 16,
              child: FloatingActionButton(    
                backgroundColor: Colors.white,
                onPressed: () => Navigator.pop(context),
                child: const Center(
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}