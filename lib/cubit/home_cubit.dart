import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matgar/componant/const.dart';
import 'package:matgar/componant/constant.dart';
import 'package:matgar/cubit/home_state.dart';
import 'package:matgar/model/add_cart.dart';
import 'package:matgar/model/favorites.dart';
import 'package:matgar/model/get-favorites.dart';
import 'package:matgar/model/get_carts.dart';
import 'package:matgar/model/get_category.dart';
import 'package:matgar/model/home.dart';
import 'package:matgar/model/search.dart';
import 'package:matgar/moduels/category/category.dart';
import 'package:matgar/moduels/favorite/favorites.dart';
import 'package:matgar/moduels/feeds/feeds.dart';
import 'package:matgar/moduels/settings/setting.dart';
import 'package:matgar/shared/network/dio_helper.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<Widget> screen = [
    Feeds(),
    Category(),
    Favorites(),
    Settings(),
  ];
  List<String> title = [
    'Home',
    'Category',
    'Favorites',
    'Settings',
  ];
  int currentIndex = 0;

  void changeCurrentIndex(index) {
    currentIndex = index;
    emit(ChangeCurrentIndex());
  }

  Map<int, bool> carts = {};
  Map<int, bool> favorites = {};
  HomeModel? homeModel;
  void getHome() {
    emit(GetHomeDataLoading());
    DioHelper.getData(path: kHome, token: token!).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      homeModel!.data!.products.forEach((element) {
        favorites.addAll({
          element.id: element.inFavorite ?? false,
        });
      });
      homeModel!.data!.products.forEach((element) {
        carts.addAll({element.id: element.inCart ?? false});
      });
      emit(GetHomeDatasucsses());
    }).catchError((er) {
      emit(GetHomeDataError());

      print(er.toString());
    });
  }

  GetCategoryModel? getCategoryModel;

  void getCategory() {
    emit(GetGategoriesLoading());
    DioHelper.getData(path: kGetCategory).then((value) {
      emit(GetGategoriessucsses());
      getCategoryModel = GetCategoryModel.fromJson(value.data);
    }).catchError((er) {
      emit(GetGategoriesError());

      print(er.toString());
    });
  }

  CartModel? cartModel;
  void addCart(int id) {
    carts[id] = !(carts[id] ?? false);
    emit(AddCartLoading());
    DioHelper.postData(path: kCart, token: token!, data: {
      'product_id': id,
    }).then((value) {
      cartModel = CartModel.fromJson(value.data);
      if (cartModel!.status == false) {
        carts[id] = !(carts[id] ?? false);
      } else {
        getCartItems();
      }
      emit(AddCartsucsses());
    }).catchError((er) {
      emit(AddCartError());

      print(er.toString());
    });
  }

  GetCarts? getCarts;
  void getCartItems() {
    emit(GetCartItemsLoading());
    DioHelper.getData(path: kCart, token: token!).then((value) {
      getCarts = GetCarts.formJson(value.data);
      emit(GetCartItemssucsses());
    }).catchError((er) {
      emit(GetCartItemsError());

      print(er.toString());
    });
  }

  FavoriteGetModel? favoriteGetModel;
  void changeFavorites(int id) {
    favorites[id] = !(favorites[id] ?? false);
    emit(AddFavoriteLoading());
    DioHelper.postData(path: kFavorite, token: token!, data: {
      'product_id': id,
    }).then((value) {
      favoriteGetModel = FavoriteGetModel.fromJson(value.data);
      emit(AddFavoritesucsses());
      if (favoriteGetModel!.status == false) {
        favorites[id] = !(favorites[id] ?? false);
      } else {
        getFavorites();
      }
    }).catchError((er) {
      emit(AddFavoriteError());
      favorites[id] = !(favorites[id] ?? false);

      print(er.toString());
    });
  }

  GetFavorite? getFavorite;
  void getFavorites() {
    emit(GetFavoriteLoading());
    DioHelper.getData(path: kFavorite, token: token!).then((value) {
      getFavorite = GetFavorite.fromJson(value.data);
      emit(GetFavoritesucsses());
    }).catchError((er) {
      emit(GetFavoriteError());

      print(er.toString());
    });
  }

  SearchModel? searchModel;
  void getSearch(text) {
    emit(GetSearchLoading());
    DioHelper.postData(path: kSearch, token: token!, data: {
      'text': text,
    }).then((value) {
      searchModel = SearchModel.fromJson(value.data);
      emit(GetSearchsucsses());
    }).catchError((er) {
      emit(GetSearchError());

      print(er.toString());
    });
  }
}
