import 'package:cubit_api_test/model/product_model.dart';
import 'package:cubit_api_test/sevice/api_service.dart';

class ApiRepository {
  final ApiSevice apiSevice = ApiSevice();

  Future<List<ProductElement>> fetchProducts() {
    return apiSevice.getProducts();
  }
}
