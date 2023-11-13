import 'package:alcoolandiajl/const.dart';
import 'package:alcoolandiajl/core/models/plant_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PlantService {
  Future<void> salePlant(PlantModel model) async {
    await kFirestore.collection('plants').doc().set(model.toJson());
  }

  Future<void> deleteSalePlant(String plantId) async {
    await kFirestore.collection('plants').doc(plantId).delete();
  }

  Future<void> likePlants(String plantId) async {
    await kFirestore.collection('plants').doc(plantId).delete();
  }

  Future<List<DocumentSnapshot<Map<String, dynamic>>>> fetchPlants() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await kFirestore.collection('plants').get();

      return snapshot.docs;
    } catch (error) {
      return <DocumentSnapshot<Map<String, dynamic>>>[];
    }
  }

  PlantModel fetchPlant(Map<String, dynamic> post) {
    List<String> like = (post['like'] is List)
        ? List<String>.from(post['like'] as List<dynamic>)
        : <String>[];
    PlantModel postModel = PlantModel(
      like: like,
      pot: post['pot'],
      price: post['price'],
      title: post['title'],
      height: post['height'],
      plantId: post['plantId'],
      imageUrl: post['imageUrl'],
      description: post['description'],
      temperature: post['temperature'],
    );
    return postModel;
  }
}
