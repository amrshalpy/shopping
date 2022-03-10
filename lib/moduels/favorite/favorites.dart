import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:matgar/componant/componant.dart';
import 'package:matgar/cubit/home_cubit.dart';
import 'package:matgar/cubit/home_state.dart';
import 'package:matgar/moduels/favorite/widgets/get_favorite.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit()..getFavorites(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);
          return SingleChildScrollView(
            child: cubit.getFavorite != null
                ? Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        cubit.getFavorite!.data!.data.isNotEmpty
                            ? ListView.builder(
                                itemBuilder: (context, index) => getFavorite(
                                    cubit.getFavorite!.data!.data[index]
                                        .products,
                                    context),
                                itemCount: cubit.getFavorite!.data!.data.length,
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                              )
                            : Column(
                                children: [
                                  Image.asset(
                                    'assets/images/undraw_Shopping_re_3wst.png',
                                    height: 400,
                                    width: double.infinity,
                                    fit: BoxFit.contain,
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  customText(
                                    txt: 'Favorites Empty you can fill it',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  )
                                ],
                              )
                      ],
                    ),
                  )
                : Center(child: LoadingBouncingGrid.square()),
          );
        },
      ),
    );
  }
}
