import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:matgar/cubit/home_cubit.dart';
import 'package:matgar/cubit/home_state.dart';
import 'package:matgar/moduels/feeds/widgets/get_categories.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit()..getCategory(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);
          return cubit.getCategoryModel != null
              ? Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      cubit.getCategoryModel!.data!.dataList.isNotEmpty
                          ? ListView.builder(
                              itemBuilder: (context, index) => getCategory(cubit
                                  .getCategoryModel!.data!.dataList[index]),
                              itemCount:
                                  cubit.getCategoryModel!.data!.dataList.length,
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                            )
                          : Center(
                              child: LoadingBouncingGrid.square(
                                borderSize: 20,
                              ),
                            ),
                    ],
                  ),
                )
              : LoadingBouncingLine.square();
        },
      ),
    );
  }
}
