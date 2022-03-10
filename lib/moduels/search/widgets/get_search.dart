import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matgar/cubit/home_cubit.dart';
import 'package:matgar/cubit/home_state.dart';
import 'package:matgar/model/search.dart';

Widget getSearch(Products? products, BuildContext context) {
  return Dismissible(
    key: UniqueKey(),
    direction: DismissDirection.horizontal,
    onDismissed: (direction) {
      HomeCubit.get(context).changeFavorites(products!.id);
    },
    background: Icon(Icons.delete),
    child: Card(
      child: Container(
        height: 110,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(
              '${products!.image}',
              fit: BoxFit.cover,
              height: 100,
              width: 70,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Text(
                    '${products.name}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${products.price}',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            BlocListener<HomeCubit, HomeState>(
              listener: (context, state) {},
              child: Expanded(
                flex: 1,
                child: Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          HomeCubit.get(context).changeFavorites(products.id);
                        },
                        icon: HomeCubit.get(context).favorites[products.id] ==
                                true
                            ? Icon(Icons.favorite_border)
                            : Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.shopping_cart,
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
