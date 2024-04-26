import 'package:firebase_database/firebase_database.dart';

class ProductService {
  final DatabaseReference _db = FirebaseDatabase.instance.ref().child('product_list');

  Stream<Map<String, String>> getProductList() {
    return _db.onValue.map((event) {
      final Map<String, String> items = {};
      DataSnapshot snapshot = event.snapshot;

      if(snapshot.value != null){
        Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
        values.forEach((key, value) {
          items[key] = 'product_code: ${value['product_code']} \nproduct_name: ${value['product_name']}';
        });
      }
      return items;
    });
  }

  void addProduct(String itemCode, String itemName){
    _db.push().set(
      {
        'product_code': itemCode,
        'product_name': itemName,
      }
    );
  }

  Future<void> removeProduct(String key) async {
    await _db.child(key).remove();
  }
}