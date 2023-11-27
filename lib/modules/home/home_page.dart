import 'package:alcoolandiajl/main.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_network/image_network.dart';
import 'package:ionicons/ionicons.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textEditingController = TextEditingController();

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
          'ALCOOLÂNDIA',
          style:
              GoogleFonts.rye(color: Theme.of(context).colorScheme.secondary, fontStyle: FontStyle.normal),
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
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.transparent,
              leading: const SizedBox.shrink(),
              expandedHeight: 1100.0,
              floating: false,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                stretchModes: const <StretchMode>[
                  StretchMode.zoomBackground,
                  StretchMode.blurBackground,
                  StretchMode.fadeTitle,
                ],
                centerTitle: false,
                expandedTitleScale: 1.1,
                background: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 50),
                      color: Theme.of(context).colorScheme.primary,
                      child: FlutterCarousel(
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
                    ),
                    const SizedBox(height: 130),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 1.4,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: CupertinoTextField(
                            cursorColor:
                                Theme.of(context).colorScheme.secondary,
                            prefix: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Icon(
                                Ionicons.search_outline,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                            suffix: GestureDetector(
                              onTap: () {
                                _textEditingController.clear();
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Icon(
                                  Icons.close,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            ),
                            keyboardAppearance: Brightness.dark,
                            controller: _textEditingController,
                            placeholder: 'Pesquisar',
                            placeholderStyle: TextStyle(
                                color: Theme.of(context).colorScheme.secondary),
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary),
                            decoration: const BoxDecoration(),
                            maxLines: 1,
                            onChanged: (String value) {
                              setState(() {});
                            },
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            maxLength: 50,
                            padding: const EdgeInsets.all(16.0),
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (BuildContext context) => ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40),
                                ),
                                child: Container(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  height:
                                      MediaQuery.of(context).size.height / 1.8,
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    children: <Widget>[
                                      const SizedBox(height: 15),
                                      Container(
                                        width: 70,
                                        height: 5,
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Text(
                                        'Filtrar',
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            fontSize: 25),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              Icons.display_settings_rounded,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ];
        },
        body: StaggeredGridView.countBuilder(
          staggeredTileBuilder: (int index) =>
              const StaggeredTile.count(1, 1.8),
          crossAxisCount: calcScreenWidth(context) == Screen.web ? 6 : 2,
          padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
          itemCount: 12,
          mainAxisSpacing: 10,
          crossAxisSpacing: 25,
          itemBuilder: (BuildContext context, int index) {
            if (index % 2 == 0) {
              if (index == 0) {
                return FadeInUp(
                  duration: const Duration(seconds: 1),
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Transform.translate(
                        offset: const Offset(0.0, 100.0),
                        child: Card(
                          key: widget.key,
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(0.0, -100.0),
                        child: Text(
                          'encontrados ${slides.length} resultados',
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 28),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return FadeInUp(
                duration: const Duration(seconds: 1),
                child: Transform.translate(
                  offset: const Offset(0.0, 100.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Card(
                      key: widget.key,
                    ),
                  ),
                ),
              );
            } else {
              return FadeInDown(
                duration: const Duration(seconds: 1),
                child: Card(
                  key: widget.key,
                ),
              );
            }
          },
        ),
      ),
      // body: Container(
      //   color: Theme.of(context).colorScheme.primary,
      //   child: SingleChildScrollView(
      //     child: Column(
      //       children: [
      //         const SizedBox(height: 100),
      //         FlutterCarousel(
      //           options: CarouselOptions(
      //             height: 700,
      //             autoPlay: true,
      //             autoPlayInterval: const Duration(seconds: 7),
      //             viewportFraction: 0.8,
      //             enlargeCenterPage: true,
      //             showIndicator: false,
      //             slideIndicator: CircularWaveSlideIndicator(),
      //             floatingIndicator: false,
      //           ),
      //           items: sliders,
      //         ),
      //         const SizedBox(height: 100),
      //         Container(
      //           padding: const EdgeInsets.symmetric(horizontal: 30),
      //           height: 300,
      //           child: CupertinoTextField(
      //             cursorColor: Theme.of(context).colorScheme.secondary,
      //             prefix: Padding(
      //               padding: const EdgeInsets.only(left: 15),
      //               child: Icon(
      //                 Ionicons.search_outline,
      //                 color: Theme.of(context).colorScheme.secondary,
      //               ),
      //             ),
      //             suffix: GestureDetector(
      //               onTap: () {
      //                 focus.unfocus();
      //                 _textEditingController.clear();
      //               },
      //               child: Padding(
      //                 padding: const EdgeInsets.only(right: 15),
      //                 child: Icon(
      //                   Icons.close,
      //                   color: Theme.of(context).colorScheme.secondary,
      //                 ),
      //               ),
      //             ),
      //             keyboardAppearance: Brightness.light,
      //             focusNode: focus,
      //             controller: _textEditingController,
      //             placeholder: 'teste',
      //             placeholderStyle:
      //                 TextStyle(color: Theme.of(context).colorScheme.secondary),
      //             style:
      //                 TextStyle(color: Theme.of(context).colorScheme.secondary),
      //             decoration: const BoxDecoration(),
      //             maxLines: 1,
      //             onChanged: (String value) {
      //               setState(() {});
      //             },
      //             maxLengthEnforcement: MaxLengthEnforcement.enforced,
      //             maxLength: 50,
      //             padding: const EdgeInsets.all(16.0),
      //           ),
      //         ),
      //         const SizedBox(height: 100),
      //         SizedBox(
      //           height: 1400,
      //           child: StaggeredGridView.countBuilder(
      //             staggeredTileBuilder: (int index) =>
      //                 const StaggeredTile.count(1, 1.8),
      //             crossAxisCount:
      //                 calcScreenWidth(context) == Screen.web ? 6 : 2,
      //             padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
      //             itemCount: 12,
      //             mainAxisSpacing: 10,
      //             crossAxisSpacing: 25,
      //             itemBuilder: (BuildContext context, int index) {
      //               if (index % 2 == 0) {
      //                 if (index == 0) {
      //                   return FadeInUp(
      //                     duration: const Duration(seconds: 1),
      //                     child: Stack(
      //                       alignment: Alignment.center,
      //                       children: <Widget>[
      //                         Transform.translate(
      //                           offset: const Offset(0.0, 100.0),
      //                           child: Card(
      //                             key: widget.key,
      //                           ),
      //                         ),
      //                         Transform.translate(
      //                           offset: const Offset(0.0, -100.0),
      //                           child: Text(
      //                             'encontrados ${slides.length} resultados',
      //                             style: const TextStyle(
      //                                 color: Colors.white,
      //                                 fontWeight: FontWeight.bold,
      //                                 fontSize: 28),
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                   );
      //                 }
      //                 return FadeInUp(
      //                   duration: const Duration(seconds: 1),
      //                   child: Transform.translate(
      //                     offset: const Offset(0.0, 100.0),
      //                     child: ClipRRect(
      //                       borderRadius: BorderRadius.circular(20),
      //                       child: Card(
      //                         key: widget.key,
      //                       ),
      //                     ),
      //                   ),
      //                 );
      //               } else {
      //                 return FadeInDown(
      //                   duration: const Duration(seconds: 1),
      //                   child: Card(
      //                     key: widget.key,
      //                   ),
      //                 );
      //               }
      //             },
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
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
                const ImageNetwork(
                  image:
                      'https://jackdanielsbottles.com/wp-content/uploads/2014/06/Single_Barrel_New-800x1408.png',
                  height: 250,
                  width: 150,
                  duration: 1500,
                  curve: Curves.easeIn,
                  onPointer: true,
                  debugPrint: false,
                  fullScreen: false,
                  fitAndroidIos: BoxFit.scaleDown,
                  fitWeb: BoxFitWeb.scaleDown,
                  onLoading: CircularProgressIndicator(
                    color: Colors.brown,
                  ),
                  onError: Icon(
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
      ),
    )
    .toList();
