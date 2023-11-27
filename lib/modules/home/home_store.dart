import 'dart:async';

import 'package:alcoolandiajl/core/models/product_model.dart';
import 'package:alcoolandiajl/core/repositories/products_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class HomeStore extends Store<Map<String, List<ProductModel>>> {
  HomeStore() : super({'slides': [], 'filtered': []});

  final ProductsRepository _repository = Modular.get<ProductsRepository>();
  List<ProductModel> products = [];
  Timer? _debounce;

  Future<void> getProducts() async {
    try {
      setLoading(true);
      products = await _repository.get();
      update({
        'slides': products.where((e) => e.isSlide).toList(),
        'filtered': products
      });
      setLoading(false);
    } catch (e) {
      setError(e.toString());
    }
  }

  Future<void> filter(String filter) async {
    setLoading(true);
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      final filtered =
          products.where((element) => element.name.toLowerCase().contains(filter.toLowerCase())).toList();
      update({
        'slides': products.where((e) => e.isSlide).toList(),
        'filtered': filtered
      });
    });

    setLoading(false);
  }
}
