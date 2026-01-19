import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/features/home/models/home_product_data_model.dart';
import 'package:flutter_bloc_app/features/wishList/bloc/wishlist_bloc_bloc.dart';

class WishlistTile extends StatelessWidget {
  final ProductDataModel productDataModel;
  final WishlistBlocBloc wishlistBloc;
  const WishlistTile({super.key, required this.productDataModel, required this.wishlistBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(productDataModel.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                productDataModel.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // homeBloc.add(HomeproductWishlistButtonClickedEvent(clickedProduct: productDataModel));
                    },
                    icon: Icon(Icons.favorite),
                  ),
                  IconButton(
                    onPressed: () {
                    // wishlistBloc.add(WishlistRemoveFromCartEvent(productDataModel: productDataModel));
                    },
                    icon: Icon(Icons.shopping_bag),
                  ),
                ],
              ),
            ],
          ),
          Text(productDataModel.description),
          const SizedBox(height: 20),
          Text(
            'Rs.' + productDataModel.price.toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text('Quantity: ${productDataModel.quantity}'),
        ],
      ),
    );
  }
}
