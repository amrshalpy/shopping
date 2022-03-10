import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:matgar/componant/componant.dart';
import 'package:matgar/cubit/home_cubit.dart';
import 'package:matgar/cubit/home_state.dart';
import 'package:matgar/model/get_carts.dart';
import 'package:matgar/moduels/carts/widgets/get_carts.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit()..getCartItems(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);
          return Builder(builder: (context) {
            return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  title: customText(
                    txt: 'Carts',
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                  backgroundColor: Colors.white,
                  elevation: 0,
                ),
                body: cubit.getCarts != null
                    ? Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            cubit.getCarts!.data!.cartItems.isNotEmpty
                                ? Expanded(
                                    child: ListView.builder(
                                      itemBuilder: (context, index) => getCarts(
                                          cubit
                                              .getCarts!.data!.cartItems[index],
                                          context),
                                      itemCount: cubit
                                          .getCarts!.data!.cartItems.length,
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                    ),
                                  )
                                : Center(
                                    child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/images/undraw_Shopping_re_3wst.png',
                                        height: 400,
                                        width: double.infinity,
                                        fit: BoxFit.contain,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      customText(
                                        txt:
                                            'Cart Screen is empty you can fill it',
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ],
                                  )),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Total Price',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      '2233 \$',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.red),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Container(
                                    child: buttonText(
                                        txt: 'Check Out', onPressed: () {}),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : Center(child: LoadingBouncingGrid.square()),
              ),
            );
          });
        },
      ),
    );
  }
}
