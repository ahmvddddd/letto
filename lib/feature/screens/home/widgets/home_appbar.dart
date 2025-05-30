import 'package:flutter/material.dart';
import '../../../../utils/constants/custom_sizes.dart';
import '../../../../utils/constants/images.dart';
import '../../../../utils/helper/helper_functions.dart';
import '../../../custom_widgets/containers/custom_container.dart';
class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key,});
  

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    double screenHeight = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //avatar and greetings
        GestureDetector(
          onTap: () {
          },
          child: CircularContainer(
            width: screenHeight * 0.045,
            height: screenHeight * 0.045,
            radius: 100,
            backgroundColor: dark ? Colors.black : Colors.white,
            padding: Sizes.xs,
            child: Image.asset(
            Images.avatarM1,
              fit: BoxFit.contain,
              height: screenHeight * 0.40,
            ),
          ),
        ),
    
        //notifications
            GestureDetector(
              onTap: (){
              },
              child: Stack(children: [
                const Icon(
                  Icons.notifications,
                  size: Sizes.iconMd,
                  color: Colors.white,
                ),
                Positioned(
                    right: -0.3,
                    child: Container(
                      width: 15,
                      height: 15,
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            100,
                          ),
                          color: Colors.red[900]),
                      child: Center(
                        child: Text(
                          '3',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(color: Colors.white, fontSize: 8),
                        ),
                      ),
                    ))
      ],
              )
            )
      ]
    );
  }
}
