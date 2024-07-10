import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:marvel/presentation/components/card_character_componet.dart';
import 'package:marvel/presentation/components/search_textfield_component.dart';
import 'package:marvel/presentation/views/utils/consts_util.dart';
import 'package:marvel/presentation/views/utils/size_extesion_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
                  children: List.generate(10, (index) => const CardCharactersComponent())
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
              12, 
              (index) => Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: index == 0 ? ConstsUtils.primaryColor : ConstsUtils.primaryColor.withOpacity(.1),
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
                    color: index == 0 ? Colors.white : Colors.black
                  ),
                ),
              )
            ),
          ),
        ),
      ),
    );
  }
}