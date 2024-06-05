
import 'package:domain/model/cart_model.dart';
import 'package:domain/repo/cart_repo.dart';

class GetCartUseCase {
  final CartRepo _cartRepo;

  GetCartUseCase(this._cartRepo);

  Future<CartModel> execute(GetCartUsecaseParam params) async {
    return await _cartRepo.getCart(params.userId);
  }
}
class GetCartUsecaseParam {
  final int userId;

  GetCartUsecaseParam(this.userId);
}