import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matgar/componant/const.dart';
import 'package:matgar/componant/constant.dart';
import 'package:matgar/cubit/home_cubit.dart';
import 'package:matgar/moduels/home/home.dart';
import 'package:matgar/moduels/login/cubit/login_cubit.dart';
import 'package:matgar/moduels/login/login.dart';
import 'package:matgar/moduels/splash_screen/splash_screen.dart';
import 'package:matgar/shared/local/cache_helper.dart';
import 'package:matgar/shared/network/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await DioHelper.init();
  token = CacheHelper.getData(key: kHelper);
  print('token is $token');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(),
        ),
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit()
            ..getFavorites()
            ..getHome()
            ..getCategory()
            ..getCartItems(),
        ),
      ],
      child: MaterialApp(
        title: 'matgar',
        home: SplashScreen(
          route: token != null ? Home() : Login(),
        ),
      ),
    );
  }
}
