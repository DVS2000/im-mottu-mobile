import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:marvel/presentation/components/card_character_componet.dart';
import 'package:marvel/presentation/components/item_pagination_component.dart';
import 'package:marvel/presentation/components/search_textfield_component.dart';
import 'package:marvel/presentation/controllers/character_controller.dart';
import 'package:marvel/presentation/views/utils/consts_util.dart';
import 'package:marvel/presentation/views/utils/size_extesion_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _characterController = GetIt.I.get<CharacterController>();
  int offset = 0;

  @override
  void initState() {
    _characterController.getCharacters(offset: 0);
    super.initState();
  }

  @override
  void dispose() {
    _characterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if(_characterController.isLoading.value && _characterController.characters.isEmpty) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );

        } else {
          return Scaffold(
            body: SizedBox(
              height: context.sizedDevice.height,
              width: context.sizedDevice.width,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 60,
                  right: 16,
                  left: 16
                ),
                child: Column(
                  children: [
                    const SearchTextfieldComponent(),
                
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20
                        ),
                        children: _characterController.characters.map(
                          (character) => CardCharactersComponent(characterEntity: character,)
                        ).toList()
                      ),
                    )
                  ],
                ),
              ),
            ),
          
            bottomNavigationBar: Container(
              height: 60,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8)
                ),
                boxShadow: [
                  BoxShadow(
                    color: ConstsUtils.primaryColor.withOpacity(.1),
                    offset: const Offset(0.0, -10),
                    blurRadius: 10
                  )
                ]
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: List.generate(
                    50, // COM ESSE NUMERO DE PÁGINA CONSEGUIMOS CHEGAR ATÉ O HEROI 1000 DA LISTA DE HEROIS
                    (index) => ItemPaginationComponent(
                      index: index, 
                      selected: index == offset,
                      onTap: () {
                        if(index != offset && !_characterController.isLoading.value) {
                          setState(() => offset = index);
                          _characterController.getCharacters(
                            offset: index == 0 ? 0 : index * 20
                          );
                        }
                      },
                    )
                  ),
                ),
              ),
            ),
          );
        }
      }
    );
  }
}