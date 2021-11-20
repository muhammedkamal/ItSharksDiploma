import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:market_app/data/models/product.dart';
import 'package:market_app/logic/providers/products_provider.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductsBloc extends Bloc<ProductEvent, ProductsState> {
  final ProductsProvider productsProvider = ProductsProvider();
  ProductsBloc() : super(ProductInitial()) {
    on<ProductEvent>((event, emit) async {
      emit(ProductsLoading());
      if (event is LoadAllProducts) {
        try {
          emit(
              ProductsLoaded(await productsProvider.getProductsFromFirebase()));
        } catch (e) {
          emit(ProductsLoadingFailed());
        }
      } else if (event is AddProduct) {
        await productsProvider.addNewProduct(event.product)
            ? emit(ProductsLoaded(
                await productsProvider.getProductsFromFirebase()))
            : emit(ProductsLoadingFailed());
      } else if (event is UpdateProduct) {
        await productsProvider.updateProduct(event.product)
            ? emit(ProductsLoaded(
                await productsProvider.getProductsFromFirebase()))
            : emit(ProductsLoadingFailed());
      } else if (event is DeleteProduct) {
        await productsProvider.deleteProduct(event.productId)
            ? emit(ProductsLoaded(
                await productsProvider.getProductsFromFirebase()))
            : emit(ProductsLoadingFailed());
      }
    });
  }
}
