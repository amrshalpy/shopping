import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matgar/cubit/home_cubit.dart';
import 'package:matgar/cubit/home_state.dart';
import 'package:matgar/model/get_carts.dart';

Widget getCarts(CartItems cartItem, context) {
  return Dismissible(
    key: UniqueKey(),
    direction: DismissDirection.horizontal,
    onDismissed: (direction) {
      HomeCubit.get(context).addCart(cartItem.products!.id);
    },
    background: Icon(Icons.delete),
    child: Card(
      child: Container(
        height: 130,
        child: Row(
          children: [
            Image.network(
              '${cartItem.products!.image}',
              fit: BoxFit.cover,
              height: 100,
              width: 70,
            ),
            SizedBox(
              width: 17,
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Text(
                      '${cartItem.products!.name}',
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
                      '${cartItem.products!.price}',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      color: Colors.amber.shade200,
                      height: 30,
                      width: 110,
                      child: Row(
                        children: [
                          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                          Text(
                            '1',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.remove)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            BlocListener<HomeCubit, HomeState>(
              listener: (context, state) {},
              child: Expanded(
                flex: 1,
                child: Align(
                    alignment: AlignmentDirectional.bottomStart,
                    child: Column()),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
