import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stat_managment/controller/product_controller.dart';

class ProductScreen extends StatelessWidget {
  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text("All Product List"),
        actions: [
          Row(
            children: [
              ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.shopping_cart),
                  label: GetX<ProductController>(
                    builder: (controller) {
                      return Text(productController.count.toString());
                    },
                  ))
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(child: GetBuilder<ProductController>(
            builder: (controller) {
              return ListView.builder(
                itemCount: productController.productData.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Theme.of(context).primaryColor, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      elevation: 5,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 120,
                            width: double.infinity,
                            child: Image.asset(productController
                                .productData[index].productImage),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  productController
                                      .productData[index].productName,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                IconButton(
                                  onPressed: () {
                                    productController.addTofavorite(
                                        productController.productData[index]);
                                  },
                                  icon: Icon(
                                    productController
                                            .productData[index].favorite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Price : ${productController.productData[index].price} ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    productController.addtocart(
                                        productController.productData[index]);
                                  },
                                  child: Text(
                                    'Add to Card',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          )),
          SizedBox(
            height: 10,
          ),
          GetX<ProductController>(
            builder: (controller) {
              return Text(
                "Total Amount : ${productController.totalPrice}",
                style: TextStyle(fontSize: 20, color: Colors.white),
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
