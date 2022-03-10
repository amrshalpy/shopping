import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matgar/componant/componant.dart';
import 'package:matgar/cubit/home_cubit.dart';
import 'package:matgar/cubit/home_state.dart';
import 'package:matgar/moduels/carts/carts.dart';
import 'package:matgar/moduels/search/search.dart';
import 'package:matgar/theme/icon_broken.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit()
        ..getFavorites()
        ..getHome()
        ..getCategory()
        ..getCartItems(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Row(
                  children: [
                    Text(
                      cubit.title[cubit.currentIndex],
                      style: GoogleFonts.pacifico(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      nextPage(context: context, page: CartScreen());
                    },
                    icon: Icon(
                      IconBroken.Buy,
                      color: Colors.black,
                    )),
                IconButton(
                    onPressed: () {
                      nextPage(context: context, page: Search());
                    },
                    icon: Icon(
                      IconBroken.Search,
                      color: Colors.black,
                    )),
              ],
            ),
            body: cubit.screen[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: Icon(IconBroken.Home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(IconBroken.Category),
                  label: 'Category',
                ),
                BottomNavigationBarItem(
                  icon: Icon(IconBroken.Heart),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  icon: Icon(IconBroken.Setting),
                  label: 'Settings',
                ),
              ],
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeCurrentIndex(index);
              },
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              selectedFontSize: 16,
              selectedLabelStyle: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.blue,
            ),
          );
        },
      ),
    );
  }
}
