import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matgar/componant/componant.dart';
import 'package:matgar/cubit/home_cubit.dart';
import 'package:matgar/cubit/home_state.dart';
import 'package:matgar/moduels/carts/carts.dart';
import 'package:readmore/readmore.dart';

class ProductDetails extends StatelessWidget {
  String name;
  String image;
  String description;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  bool inFavorite;
  bool inCart;
  dynamic id;

  ProductDetails(
      {Key? key,
      required this.image,
      required this.id,
      required this.inFavorite,
      required this.inCart,
      required this.discount,
      required this.name,
      required this.oldPrice,
      required this.price,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: customText(
              txt: 'Details',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      Image.network(
                        image,
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              name,
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  '${price}\$',
                                  style: const TextStyle(
                                      fontSize: 17,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                                if (discount != 0)
                                  Text(
                                    '${oldPrice}\$',
                                    style: const TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: 13,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal),
                                  ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: AlignmentDirectional.bottomStart,
                              child: customText(
                                txt: 'Description:',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ReadMoreText(
                    description,
                    lessStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.normal),
                    moreStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        fontWeight: FontWeight.normal),
                    style: const TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                    trimLines: 10,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'read more',
                    trimExpandedText: 'show less',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: double.infinity,
                      child: buttonText(
                          txt: 'Add to Cart',
                          onPressed: () {
                            HomeCubit.get(context).addCart(id);
                            nextPage(context: context, page: CartScreen());
                          }))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
