// [GRAPHICAL INTERFACE] handler
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/models/plant_model.dart';

late SharedPreferences localUser;

Widget sh(double val) {
  return SizedBox(height: val);
}

Widget sw(double val) {
  return SizedBox(width: val);
}

double dh(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double dw(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

String kP =
    'https://cdn.vectorstock.com/i/preview-1x/20/76/man-avatar-profile-vector-21372076.jpg';

// [FIREBASE] handler
final FirebaseFirestore kFirestore = FirebaseFirestore.instance;
final FirebaseAuth kAuth = FirebaseAuth.instance;
final Reference kStorage = FirebaseStorage.instance.ref();
final FirebaseAnalytics kAnalytics = FirebaseAnalytics.instance;

List<PlantModel> plants = [
  PlantModel(
    pot: 'pot',
    like: ['1', '2', '3'],
    title: 'title',
    price: '5.00',
    height: '3',
    plantId: '123123123',
    imageUrl: 'https://entreraizes.com.br/cdn/shop/files/IMG_9959.jpg?v=1690142428&width=480',
    description: 'description',
    temperature: '3° C'
  ),
  PlantModel(
    pot: 'pot',
    like: ['1', '2', '3'],
    title: 'title',
    price: '5.00',
    height: '3',
    plantId: '123123123',
    imageUrl: 'https://entreraizes.com.br/cdn/shop/files/IMG_9959.jpg?v=1690142428&width=480',
    description: 'description',
    temperature: '3° C'
  ),
  PlantModel(
    pot: 'pot',
    like: ['1', '2', '3'],
    title: 'title',
    price: '5.00',
    height: '3',
    plantId: '123123123',
    imageUrl: 'https://entreraizes.com.br/cdn/shop/files/IMG_9959.jpg?v=1690142428&width=480',
    description: 'description',
    temperature: '3° C'
  ),
  PlantModel(
    pot: 'pot',
    like: ['1', '2', '3'],
    title: 'title',
    price: '5.00',
    height: '3',
    plantId: '123123123',
    imageUrl: 'https://entreraizes.com.br/cdn/shop/files/IMG_9959.jpg?v=1690142428&width=480',
    description: 'description',
    temperature: '3° C'
  )
];