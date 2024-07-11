import 'dart:developer';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:marvel/presentation/components/card_character_componet.dart';
import 'package:marvel/presentation/components/item_pagination_component.dart';
import 'package:marvel/presentation/components/search_textfield_component.dart';
import 'package:marvel/presentation/controllers/character_controller.dart';
import 'package:marvel/presentation/loaders/home_loader.dart';
import 'package:marvel/presentation/views/utils/consts_util.dart';
import 'package:marvel/presentation/views/utils/size_extesion_util.dart';

class HomePage extends StatefulWidget {
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  const HomePage({super.key, required this.analytics, required this.observer});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  static const MethodChannel _channel = MethodChannel('internet_checker_channel');

  final _characterController = GetIt.I.get<CharacterController>();
  final _txtSearchController = TextEditingController();
  int offset = 0;

  @override
  void initState() {
    _characterController.getCharacters(offset: offset);
    _channel.setMethodCallHandler(_handleMethodCall);
    super.initState();
  }


  Future<void> _handleMethodCall(MethodCall call) async {
    if (call.method == 'updateConnectionStatus') {
      log(call.arguments);
      Get.showSnackbar(
        GetSnackBar(
          title: "Estado da internet",
          message: call.arguments,
          backgroundColor: call.arguments.toString() == "online" ? Colors.green : Colors.red,
          duration: const Duration(seconds: 3),
        )
      );
    }
  }

  void _logSearchEvent(String query) async {
    await widget.analytics.logSearch(
      searchTerm: query
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if(_characterController.isLoading.value && _characterController.characters.value.characters!.isEmpty) {
          return const HomeLoader();

        } else {
          return Scaffold(
            body: Container(
              height: context.sizedDevice.height,
              width: context.sizedDevice.width,
              padding: const EdgeInsets.only(
                top: 60,
                right: 16,
                left: 16
              ),
              child: Column(
                children: [
                  SearchTextfieldComponent(
                    controller: _txtSearchController,
                    onSubmitted: (value) {
                      if (value.trim().isNotEmpty) {
                        setState(() => offset = 0);
                        _characterController.searchByName(name: value, offset: offset);
                        _logSearchEvent(value);
                      }
                    },
                    onClosed: () {
                      _characterController.getCharacters(offset: offset);
                    },
                  ),
              
                  Expanded(
                    child: _characterController.isLoading.value 
                    ? const HomeLoader(showOnlyCharacters: true,)
                    : RefreshIndicator(
                      onRefresh: () => _characterController.getCharacters(offset: offset),
                      child: ListView(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20
                          ),
                          children: _characterController.characters.value.characters!.map(
                            (character) => CardCharactersComponent(character: character,)
                          ).toList()
                        ),
                    ),
                  )
                ],
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
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(
                      (_characterController.characters.value.total! / 20).ceil(), // COM ESSE NUMERO DE PÁGINA CONSEGUIMOS CHEGAR ATÉ O HEROI 1000 DA LISTA DE HEROIS
                      (index) => ItemPaginationComponent(
                        index: index, 
                        selected: index == offset,
                        onTap: () {
                          if(index != offset && !_characterController.isLoading.value) {
                            setState(() => offset = index);

                            if (_txtSearchController.text.trim().isEmpty) {
                              _characterController.getCharacters(
                                offset: index == 0 ? 0 : index * 20
                              );

                            } else {
                              _characterController.searchByName(
                                name: _txtSearchController.text.trim(), 
                                offset: offset
                              );
                            }
                          }
                        },
                      )
                    ),
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