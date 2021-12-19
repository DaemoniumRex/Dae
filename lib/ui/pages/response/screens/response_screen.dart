import 'package:flutter/material.dart';
import 'package:getglam/data/services/product_pool.dart';
import 'package:getglam/domain/model/product_model.dart';
import 'package:getglam/controller/themecontroller.dart';

class ResponseScreen extends StatelessWidget {
  final ThemeController controller;

  const ResponseScreen({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductPoolService service = ProductPoolService();
    Future<List<ProductModel>> futureProducts = service.fecthData();
    return FutureBuilder<List<ProductModel>>(
      future: futureProducts,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final items = snapshot.data!;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              ProductModel product = items[index];
              return Card(
                child: Row(
                  children: [
                    Image.network(product.imageUrl,
                      width: 100,
                    ),
                    const SizedBox(width: 5,),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Nombre: ${product.name}"),
                          Text("Marca: ${product.brand}"),
                          Text("Categoria: ${product.category}"),
                          Text("Descripcion: ${product.description}"),
                          Text("Precio: ${product.price}"),
                        ],
                      ),
                    )
                  ],
                ),
              );;
            },
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
