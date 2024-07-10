import 'package:flutter/material.dart';
import 'package:marvel/presentation/views/utils/consts_util.dart';
import 'package:marvel/presentation/views/utils/size_extesion_util.dart';

class DetailsCharacterPage extends StatefulWidget {
  const DetailsCharacterPage({super.key});

  @override
  State<DetailsCharacterPage> createState() => _DetailsCharacterPageState();
}

class _DetailsCharacterPageState extends State<DetailsCharacterPage> {
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
              child: Image.asset(
                ConstsUtils.iSpider,
                width: context.sizedDevice.width,
                height: context.sizedDevice.height / 2,
                fit: BoxFit.cover,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: ConstsUtils.defaultPadding
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Spider-Man".toUpperCase(),
                            style: TextStyle(
                              fontFamily: ConstsUtils.fBold,
                              fontSize: context.sizedDevice.height / 30
                            ),
                          ),
                          
                          Text(
                            '''O Homem-Aranha (Spider-Man) é um super-herói fictício criado por Stan Lee e Steve Ditko para a Marvel Comics. Sua primeira aparição foi na revista "Amazing Fantasy" #15, em agosto de 1962. O alter ego do Homem-Aranha é Peter Parker, um jovem que ganha''',
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
                      child: ListView(
                        padding: const EdgeInsets.symmetric(
                          horizontal: ConstsUtils.defaultPadding
                        ),
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                          6, 
                          (index) => Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: context.sizedDevice.height / 25,
                                  backgroundColor: ConstsUtils.primaryColor,
                                  backgroundImage: AssetImage(
                                    ConstsUtils.imgsCarrousel[index]
                                  ),
                                ),

                                Text(
                                  "Spider-Man",
                                  style: TextStyle(
                                    fontFamily: ConstsUtils.fRegular,
                                    fontSize: context.sizedDevice.height / 50
                                  ),
                                ),

                              ],
                            ),
                          )
                        ),
                      ),
                    )
                  ],
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