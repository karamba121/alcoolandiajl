import 'package:alcoolandiajl/core/models/product_model.dart';
import 'package:alcoolandiajl/main.dart';
import 'package:alcoolandiajl/widgets/product_card.dart';
import 'package:alcoolandiajl/widgets/promotion_slide.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import 'home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textEditingController = TextEditingController();
  final store = Modular.get<HomeStore>();

  @override
  void initState() {
    store.getProducts();
    super.initState();
  }

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
          style: GoogleFonts.rye(
              color: Theme.of(context).colorScheme.secondary,
              fontStyle: FontStyle.normal),
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
                      child: ScopedBuilder<HomeStore,
                          Map<String, List<ProductModel>>>(
                        store: store,
                        onState: (context, state) {
                          return FlutterCarousel(
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
                            items: state['slides']!
                                .map((model) => PromotionSlide(model: model))
                                .toList(),
                          );
                        },
                        onLoading: (context) =>
                            const Center(child: CircularProgressIndicator()),
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
                            onChanged: (String value) async =>
                                store.filter(value),
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
        body: ScopedBuilder<HomeStore, Map<String, List<ProductModel>>>(
          store: store,
          onState: (context, state) {
            return StaggeredGridView.countBuilder(
              staggeredTileBuilder: (int index) =>
                  const StaggeredTile.count(1, 1.8),
              crossAxisCount: calcScreenWidth(context) == Screen.web ? 6 : 2,
              padding: const EdgeInsets.only(
                  left: 25, right: 25, top: 20, bottom: 100),
              itemCount: state['filtered']!.length,
              mainAxisSpacing: 10,
              crossAxisSpacing: 25,
              itemBuilder: (BuildContext context, int index) {
                if (index % 2 == 0) {
                  return FadeInUp(
                    duration: const Duration(seconds: 1),
                    child: Transform.translate(
                      offset: const Offset(0.0, 100.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: ProductCard(
                          model: state['filtered']![index],
                          click: () => print('teste'),
                          key: widget.key,
                        ),
                      ),
                    ),
                  );
                } else {
                  return FadeInDown(
                    duration: const Duration(seconds: 1),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: ProductCard(
                          model: state['filtered']![index],
                          click: () => print('teste'),
                          key: widget.key,
                        ),
                      ),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}
