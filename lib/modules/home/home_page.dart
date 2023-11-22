import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Icon(
          Ionicons.beer_outline,
          color: Theme.of(context).colorScheme.secondary,
        ),
        title: Text(
          'Alcoolandia',
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Modular.to.navigate('/auth/'),
            child: Text(
              'Login',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          IconButton(
            onPressed: () => Modular.to.navigate('/'),
            icon: Icon(
              Ionicons.cart_outline,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).colorScheme.primary,
          child: Column(
            children: [
              const SizedBox(height: 100),
              FlutterCarousel(
                options: CarouselOptions(
                  height: 700,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 7),
                  viewportFraction: 0.8,
                  enlargeCenterPage: true,
                  showIndicator: false,
                  slideIndicator: CircularWaveSlideIndicator(),
                  floatingIndicator: false,
                ),
                items: sliders,
              ),
              const SizedBox(height: 100),
              Container(
                color: Colors.white,
                height: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Slide {
  Slide({
    required this.title,
    required this.height,
    required this.color,
  });

  final Color color;
  final double height;
  final String title;
}

var slides = List.generate(
  6,
  (index) => Slide(
    title: 'OAK AGED',
    height: 100.0 + index * 50,
    color: const Color(0xff1a1c1e),
  ),
);

final List<Widget> sliders = slides
    .map(
      (item) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
          child: Container(
            color: item.color,
            width: double.infinity,
            height: item.height,
            child: Column(
              children: [
                const SizedBox(height: 15),
                Text(
                  item.title,
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
                Image.asset('jack_daniels_single_barrel.png', fit: BoxFit.scaleDown, height: 250,),
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
      ),
    )
    .toList();
