import 'package:get/get.dart';
import 'package:stat_managment/models/product_model.dart';

class ProductController extends GetxController {
  List<Product> productData = [];

  List<Product> cartitem = List<Product>.empty().obs;

  addtocart(Product item) {
    print("calling add to cart");
    cartitem.add(item);
  }

  double get totalPrice => cartitem.fold(0, (sum, item) => sum + item.price);
  int get count => cartitem.length;

  @override
  void onInit() {
    super.onInit();
    fatchProductData();
  }

  fatchProductData() async {
    await Future.delayed(Duration(seconds: 5));

    List<Product> serverResponce = [
      Product(
          id: 1,
          productName: 'T-shirt',
          productImage: 'assets/images/Blue_Tshirt.jpg',
          productDes: 'some description about product',
          price: 499,
          favorite: false),
      Product(
          id: 2,
          productName: 'shoes',
          productImage: 'assets/images/shoes.jpg',
          productDes: 'some description about product',
          price: 299,
          favorite: false),
      Product(
          id: 3,
          productName: 'jeans',
          productImage: 'assets/images/jeans.png',
          productDes: 'some description about product',
          price: 399,
          favorite: false)
    ];

    productData.assignAll(serverResponce);
    print(productData);

    update();
  }

  addTofavorite(id) {
    var index = productData.indexWhere((element) => element.id == id);
    productData[index].favorite = !productData[index].favorite;
    update();
  }
}
