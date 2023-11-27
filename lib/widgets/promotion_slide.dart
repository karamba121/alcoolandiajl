import 'package:alcoolandiajl/core/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_network/image_network.dart';
import 'package:ionicons/ionicons.dart';

class PromotionSlide extends StatelessWidget {
  const PromotionSlide({super.key, required this.model});

  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        child: Container(
          color: const Color(0xff1a1c1e),
          width: double.infinity,
          height: 100,
          child: Column(
            children: [
              const SizedBox(height: 15),
              Text(
                model.name,
                style: GoogleFonts.cormorantInfant(
                  color: const Color(0xffc5a483),
                  fontSize: 40,
                ),
              ),
              Text(
                'WHISKY',
                style: GoogleFonts.cormorantInfant(
                  color: const Color(0xffc5a483),
                  fontSize: 40,
                ),
              ),
              const Spacer(),
              ImageNetwork(
                image: model.imageUrl,
                height: 250,
                width: 150,
                duration: 1500,
                curve: Curves.easeIn,
                onPointer: true,
                debugPrint: false,
                fullScreen: false,
                fitAndroidIos: BoxFit.scaleDown,
                fitWeb: BoxFitWeb.scaleDown,
                onLoading: const CircularProgressIndicator(
                  color: Colors.brown,
                ),
                onError: const Icon(
                  Icons.error,
                  color: Colors.red,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(20),
                height: 200,
                width: 450,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                  border: Border.all(color: const Color(0xffc5a483)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 100,
                      height: 40,
                      color: Colors.white,
                    ),
                    OutlinedButton.icon(
                      icon: const Icon(
                        Ionicons.bag_outline,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'COMPRAR',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.all(25),
                        shape: const RoundedRectangleBorder(),
                        side: const BorderSide(
                          color: Color(0xffc5a483),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
