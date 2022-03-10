import 'package:matgar/componant/componant.dart';
import 'package:matgar/componant/const.dart';
import 'package:matgar/moduels/home/home.dart';
import 'package:matgar/moduels/login/cubit/login_cubit.dart';
import 'package:matgar/moduels/login/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matgar/moduels/register/register.dart';
import 'package:matgar/shared/local/cache_helper.dart';

class Login extends StatelessWidget {
  static String id = 'Login';
  Login({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginWithEmailSucsses) {
          CacheHelper.setData(key: kHelper, value: state.token).then((value) {
            nextPageUntil(context: context, page: Home());
          }).catchError((er) {
            print(er.toString());
          });
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Form(
                      key: formKey,
                      child: Column(children: [
                        Image.asset('assets/images/auth.png'),
                        formField(
                          type: TextInputType.emailAddress,
                          controller: emailController,
                          hint: 'email',
                          label: 'email',
                          validate: (String val) {
                            if (val.isEmpty) {
                              return 'Email must be not empty';
                            } else {
                              return null;
                            }
                          },
                          icon: Icons.email,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        formField(
                          type: TextInputType.visiblePassword,
                          controller: passwordController,
                          obscure: true,
                          suffixIcon: Icons.visibility,
                          suffixPress: () {},
                          hint: 'Password',
                          label: 'Password',
                          validate: (String val) {
                            if (val.isEmpty) {
                              return 'Password must be not empty';
                            } else {
                              return null;
                            }
                          },
                          icon: Icons.vpn_key,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Align(
                            alignment: AlignmentDirectional.bottomEnd,
                            child: customText(
                              txt: 'forget password ?',
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        buttonText(
                            txt: 'Login',
                            onPressed: () {
                              LoginCubit.get(context).loginUser(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                              print('login');
                            }),
                      ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        customText(
                          txt: 'if you haven\et an account ',
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                        InkWell(
                          onTap: () {
                            nextPage(context: context, page: Register());
                          },
                          child: customText(
                            txt: 'SignUp',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
