import 'package:bloc/bloc.dart';
import 'package:cubit_api_test/cubit/product/products_state.dart';
import 'package:cubit_api_test/model/failure.dart';
import 'package:cubit_api_test/repository/api_repository.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ApiRepository repository = ApiRepository();

  ProductsCubit() : super(ProductsInitial());

  Future<void> fetchProducts() async {
    emit(ProductsLoading());
    try {
      final productList = await repository.fetchProducts();
      emit(ProductLoaded(products: productList));
    } on Failure catch (e) {
      emit(ProductError(failure: e));
    } catch (e) {
      throw e.toString();
    }
  }
}
