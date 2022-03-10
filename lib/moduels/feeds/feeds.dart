import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:matgar/componant/componant.dart';
import 'package:matgar/cubit/home_cubit.dart';
import 'package:matgar/cubit/home_state.dart';
import 'package:matgar/model/get_category.dart';
import 'package:matgar/model/home.dart';
import 'package:matgar/moduels/feeds/widgets/get_categories.dart';
import 'package:matgar/moduels/feeds/widgets/get_products.dart';
import 'package:matgar/theme/icon_broken.dart';

class Feeds extends StatelessWidget {
  const Feeds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit()
        ..getHome()
        ..getCategory(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);
          return cubit.homeModel != null && cubit.getCategoryModel != null
              ? SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        cubit.homeModel!.data!.banners != null
                            ? Container(
                                height: 200,
                                width: double.infinity,
                                child: CarouselSlider(
                                  items: cubit.homeModel!.data!.banners
                                      .map((e) => Image.network(
                                            '${e.image}',
                                            fit: BoxFit.cover,
                                          ))
                                      .toList(),
                                  options: CarouselOptions(
                                    autoPlayCurve: Curves.easeInOut,
                                    viewportFraction: 1,
                                    autoPlay: true,
                                    // autoPlayInterval:
                                    //     Duration(milliseconds: 200),
                                    // autoPlayAnimationDuration:
                                    //     Duration(seconds: 1),
                                    height: 200,
                                    initialPage: 1,
                                    pauseAutoPlayOnTouch: true,
                                    reverse: false,
                                  ),
                                ),
                              )
                            : Center(child: CircularProgressIndicator()),
                        SizedBox(
                          height: 10,
                        ),
                        customText(
                          txt: 'Category ',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        Container(
                          height: 140,
                          child:
                              cubit.getCategoryModel!.data!.dataList.length > 0
                                  ? ListView.separated(
                                      itemBuilder: (context, index) =>
                                          getCategory(cubit.getCategoryModel!
                                              .data!.dataList[index]),
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
                                        width: 4,
                                      ),
                                      itemCount: cubit.getCategoryModel!.data!
                                          .dataList.length,
                                      physics: BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                    )
                                  : CircularProgressIndicator(),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        customText(
                          txt: 'Products ',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: cubit.homeModel!.data!.products.isNotEmpty
                              ? GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 1 / 1,
                                    crossAxisSpacing: 4,
                                    mainAxisSpacing: 4,
                                  ),
                                  itemBuilder: (context, index) => getProducts(
                                      cubit.homeModel!.data!.products[index],
                                      context),
                                  itemCount:
                                      cubit.homeModel!.data!.products.length,
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                )
                              : CircularProgressIndicator(),
                        ),
                      ],
                    ),
                  ),
                )
              : Center(
                  child: LoadingBouncingGrid.square(
                    borderSize: 20,
                  ),
                );
        },
      ),
    );
  }
}
