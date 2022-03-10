import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matgar/componant/componant.dart';
import 'package:matgar/cubit/home_cubit.dart';
import 'package:matgar/cubit/home_state.dart';
import 'package:matgar/model/home.dart';
import 'package:matgar/moduels/carts/carts.dart';
import 'package:matgar/moduels/product_details/product_details.dart';
import 'package:matgar/theme/icon_broken.dart';

Widget getProducts(Products product, context) {
  return InkWell(
    onTap: () {
      nextPage(
          context: context,
          page: ProductDetails(
            id: product.id,
            description: '${product.description}',
            image: '${product.image}',
            name: '${product.name}',
            oldPrice: product.oldPrice,
            price: product.price,
            discount: product.discount,
            inCart: false,
            inFavorite: false,
          ));
    },
    child: Container(
      decoration: BoxDecoration(
          border: Border.all(width: .2), color: Colors.grey.shade200),
      height: 160,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image.network(
                    '${product.image}',
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  if (product.discount != 0)
                    Container(
                        height: 15,
                        width: 60,
                        color: Colors.red,
                        child: Center(
                          child: Text(
                            'discount',
                            style: TextStyle(color: Colors.white),
                          ),
                        ))
                ],
              ),
              BlocListener<HomeCubit, HomeState>(
                listener: (context, state) {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        HomeCubit.get(context).addCart(product.id);
                        print('cart');
                      },
                      icon: HomeCubit.get(context).carts[product.id] == false
                          ? Icon(Icons.shopping_cart_outlined)
                          : Icon(
                              Icons.shopping_cart,
                              color: Colors.red,
                            ),
                    ),
                    IconButton(
                      onPressed: () {
                        HomeCubit.get(context).changeFavorites(product.id);
                      },
                      icon:
                          HomeCubit.get(context).favorites[product.id] == false
                              ? Icon(
                                  Icons.favorite_border,
                                  color: Colors.grey,
                                )
                              : Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            '${product.name}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '${product.price}\$',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (product.discount != 0)
                Text(
                  '${product.oldPrice}\$',
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
            ],
          ),
        ],
      ),
    ),
  );
}
