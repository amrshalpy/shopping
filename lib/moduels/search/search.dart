import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:matgar/componant/componant.dart';
import 'package:matgar/cubit/home_cubit.dart';
import 'package:matgar/cubit/home_state.dart';
import 'package:matgar/moduels/search/widgets/get_search.dart';

class Search extends StatelessWidget {
  Search({Key? key}) : super(key: key);
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Container(
                height: 40,
                width: double.infinity,
                child: TextField(
                  onChanged: (text) {
                    cubit.getSearch(text);
                  },
                  controller: searchController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'search',
                    label: Text('search'),
                  ),
                ),
              ),
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  pop(context);
                },
              ),
            ),
            body: cubit.searchModel != null
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        cubit.searchModel!.data!.data.isNotEmpty
                            ? ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) => getSearch(
                                    cubit.searchModel!.data!.data[index],
                                    context),
                                separatorBuilder: (context, index) => SizedBox(
                                      height: 10,
                                    ),
                                itemCount: cubit.searchModel!.data!.data.length)
                            : Center(child: LoadingBouncingGrid.square()),
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
