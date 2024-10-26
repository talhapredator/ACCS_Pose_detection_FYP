import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:talha_s_application_demo/core/app_export.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:talha_s_application_demo/presentation/iphone_14_15_pro_max_one_screen/iphone_14_15_pro_max_one_screen.dart';

class Iphone1415ProMax1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 2,
          sigmaY: 2,
        ),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/images/iphone_1415_pro_max_1.jpeg',
              ),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: -21,
                right: -22,
                top: 0,
                bottom: -101,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xB2000000),
                  ),
                  child: Container(
                    width: 430,
                    height: 932,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter, // Aligns the column to the bottom center
                child: GestureDetector(
                  onTap: () {
                    // Navigate to a new screen when the button is tapped
                    onTapFive();
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(21, 0, 22, 181),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end, // Align the column content to the bottom
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 91),
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/images/rectangle_5.png',
                              ),
                            ),
                          ),
                          width: 387,
                          height: 165,
                        ),
                        SizedBox(height: 250),
                        Container(
                          width: 225,
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 17), // Added top padding
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Color(0xE5DF7412),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x40000000),
                                offset: Offset(0, 4),
                                blurRadius: 2,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              'Continue',
                              style: GoogleFonts.getFont(
                                'Public Sans',
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                height: 1.2,
                                color: Colors.white,
                                decoration: TextDecoration.none, // Remove underline
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  onTapFive() {
    Get.toNamed(
      AppRoutes.iphone1415ProMaxOneScreen,
    );
  }


}
