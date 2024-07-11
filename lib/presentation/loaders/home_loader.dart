import 'package:flutter/material.dart';
import 'package:marvel/presentation/views/utils/size_extesion_util.dart';
import 'package:skeletons/skeletons.dart';

class HomeLoader extends StatelessWidget {
  final bool showOnlyCharacters;
  const HomeLoader({super.key, this.showOnlyCharacters = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: context.sizedDevice.height,
        width: context.sizedDevice.width,
        padding: showOnlyCharacters 
          ? const EdgeInsets.only(top: 20) 
          : const EdgeInsets.only(top: 60, right: 16, left: 16),
        child: Column(
          children: [
      
            showOnlyCharacters ? const SizedBox() : SkeletonLine(
              style: SkeletonLineStyle(
                height: context.sizedDevice.height / 15,
                width: context.sizedDevice.width,
                borderRadius: BorderRadius.circular(30)
              ),
            ),
            showOnlyCharacters ? const SizedBox() : SizedBox(height: context.sizedDevice.height / 30,),
      
            Expanded(
              child: Column(
                children: List.generate(
                  5, 
                  (index) => Expanded(
                    child: Container(
                      //height: context.sizedDevice.height / 6,
                      margin: const EdgeInsets.only(bottom: 15),
                      child: Row(
                        children: [
                          Expanded(
                            child: SkeletonLine(
                              style: SkeletonLineStyle(
                                height: double.infinity,
                                width: context.sizedDevice.width,
                                borderRadius: BorderRadius.circular(8)
                              ),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          
                          Expanded(
                            flex: 3,
                            child: SkeletonLine(
                              style: SkeletonLineStyle(
                                height: double.infinity,
                                width: context.sizedDevice.width,
                                borderRadius: BorderRadius.circular(8)
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ),
              ),
            ),

            showOnlyCharacters ? const SizedBox() : SizedBox(
              height: 60,
              width: context.sizedDevice.width,
              child: Row(
                children: List.generate(
                  10, 
                  (index) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 3,
                        bottom: 3,
                        right: 5
                      ),
                      child: SkeletonLine(
                        style: SkeletonLineStyle(
                          height: double.infinity,
                          width: context.sizedDevice.width,
                          borderRadius: BorderRadius.circular(8)
                        ),
                      ),
                    ),
                  )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
