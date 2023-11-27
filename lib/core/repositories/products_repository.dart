import 'package:alcoolandiajl/core/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsRepository {
  Future<List<ProductModel>> get() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('products').get();
    final list = snapshot.docs.map((e) => ProductModel.fromMap(e.data()));

    return list.toList();
  }
}
