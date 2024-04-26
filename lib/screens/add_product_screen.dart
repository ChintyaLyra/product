import 'package:flutter/material.dart';
import 'package:product/screens/home_screen.dart';
import 'package:product/services/product_service.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController _controllerCode = TextEditingController();
  final TextEditingController _controllerName = TextEditingController();
  final ProductService _productService = ProductService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                      controller: _controllerCode,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Kode Produk',
                      ),
                    ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _controllerName,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Nama Produk',
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
              onPressed: () {
                _productService.addProduct(_controllerCode.text, _controllerName.text);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen())
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('Tambah'),
          ),
        ],
      ),
    );
  }
}
