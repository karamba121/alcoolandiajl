import 'dart:ui';

import 'package:alcoolandiajl/const.dart';
import 'package:alcoolandiajl/core/services/plant_service.dart';
import 'package:alcoolandiajl/features/theme/theme.dart';
import 'package:alcoolandiajl/features/widgets/card_page.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iconsax/iconsax.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import 'post_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textEditingController = TextEditingController();
  FocusNode focus = FocusNode();
  @override
  Widget build(BuildContext context) {
    Color color =
        localUser.getBool('darkmode')! ? AppColor.secondary : AppColor.white;
    Color rcolor =
        !localUser.getBool('darkmode')! ? AppColor.secondary : AppColor.white;
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: color,
      appBar: AppBar(
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              HapticFeedback.mediumImpact();
              Modular.to.navigate('/profile/');
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 30, top: 8, bottom: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                // child: const Placeholder(),
                child: CachedNetworkImage(
                  imageUrl: localUser.getString('profile_pic') ?? kP,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
        flexibleSpace: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              height: 100,
              color: Colors.black.withOpacity(0),
              width: MediaQuery.of(context).size.width / 1,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Pesquisar',
          style: TextStyle(color: rcolor),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          HapticFeedback.mediumImpact();
          Navigator.push(
            context,
            CupertinoPageRoute<Widget>(
              fullscreenDialog: true,
              builder: (BuildContext context) => const PostPage(),
            ),
          );
        },
        child: Hero(
          tag: 'back',
          child: Container(
            height: 70,
            width: 70,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColor.primary),
            child: const Icon(
              Iconsax.add_circle,
              color: Colors.white,
              size: 35,
            ),
          ),
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.transparent,
              leading: const SizedBox.shrink(),
              expandedHeight: 100.0,
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
                    sh(100),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: dw(context) / 1.4,
                          height: 50,
                          decoration: BoxDecoration(
                            color: !localUser.getBool('darkmode')!
                                ? Colors.white
                                : Colors.black,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: CupertinoTextField(
                            cursorColor: AppColor.primary,
                            prefix: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Icon(
                                Iconsax.search_normal,
                                color: rcolor,
                              ),
                            ),
                            suffix: GestureDetector(
                              onTap: () {
                                focus.unfocus();
                                _textEditingController.clear();
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Icon(
                                  Icons.close,
                                  color: rcolor,
                                ),
                              ),
                            ),
                            keyboardAppearance: localUser.getBool('darkmode')!
                                ? Brightness.dark
                                : Brightness.light,
                            focusNode: focus,
                            controller: _textEditingController,
                            placeholder: 'plantas',
                            placeholderStyle: TextStyle(color: rcolor),
                            style: TextStyle(color: rcolor),
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
                        sw(10),
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
                                  color: color,
                                  height: dh(context) / 1.8,
                                  width: dw(context),
                                  child: Column(
                                    children: <Widget>[
                                      sh(15),
                                      Container(
                                        width: 70,
                                        height: 5,
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      sh(20),
                                      Text(
                                        'filtrar plantas',
                                        style: TextStyle(
                                            color: rcolor, fontSize: 25),
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
                              color: !localUser.getBool('darkmode')!
                                  ? Colors.white
                                  : Colors.black,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              Icons.display_settings_rounded,
                              color: rcolor,
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
        body: FeedPlantPage(key: widget.key),
      ),
    );
  }
}

class FeedPlantPage extends StatefulWidget {
  const FeedPlantPage({super.key});

  @override
  State<FeedPlantPage> createState() => _FeedPlantPageState();
}

class _FeedPlantPageState extends State<FeedPlantPage> {
  Color rcolor =
      !localUser.getBool('darkmode')! ? AppColor.secondary : AppColor.white;
  Color color =
      localUser.getBool('darkmode')! ? AppColor.secondary : AppColor.white;

  late Future<List<DocumentSnapshot<Map<String, dynamic>>>> plants;

  @override
  void initState() {
    PlantService state = Modular.get<PlantService>();
    plants = state.fetchPlants();
    super.initState();
  }

  bool _isRefreshing = false;
  Future<void> _refreshPosts() async {
    setState(() {
      _isRefreshing = true;
    });

    await Future<void>.delayed(const Duration(seconds: 2));
    final PlantService state = Modular.get<PlantService>();
    setState(() {
      _isRefreshing = false;
      plants = state.fetchPlants();
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshPosts,
      backgroundColor: color,
      child: FutureBuilder<List<DocumentSnapshot<Map<String, dynamic>>>>(
        future: plants,
        builder: (BuildContext context,
            AsyncSnapshot<List<DocumentSnapshot<Map<String, dynamic>>>>
                snapshot) {
          if (snapshot.hasError) {
            return Container();
          }
          if (snapshot.connectionState == ConnectionState.waiting ||
              _isRefreshing) {
            return Container();
          }
          final List<DocumentSnapshot<Map<String, dynamic>>>? plants =
              snapshot.data;
          return StaggeredGridView.countBuilder(
            staggeredTileBuilder: (int index) =>
                const StaggeredTile.count(1, 1.8),
            crossAxisCount: 2,
            padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
            itemCount: plants?.length ?? 0,
            mainAxisSpacing: 10,
            crossAxisSpacing: 25,
            itemBuilder: (BuildContext context, int index) {
              final DocumentSnapshot<Map<String, dynamic>> plantsDoc =
                  plants![index];
              final Map<String, dynamic>? plant = plantsDoc.data();
              PlantService state = Modular.get<PlantService>();
              if (index % 2 == 0) {
                if (index == 0) {
                  return FadeInUp(
                    duration: const Duration(seconds: 1),
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Transform.translate(
                          offset: const Offset(0.0, 100.0),
                          child: CardPage(
                            key: widget.key,
                            plant: state.fetchPlant(plant!),
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(0.0, -100.0),
                          child: Text(
                            'encontrados \n${plants.length} resultados',
                            style: TextStyle(
                                color: rcolor,
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
                      child: CardPage(
                        key: widget.key,
                        plant: state.fetchPlant(plant!),
                      ),
                    ),
                  ),
                );
              } else {
                return FadeInDown(
                  duration: const Duration(seconds: 1),
                  child: CardPage(
                    key: widget.key,
                    plant: state.fetchPlant(plant!),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
