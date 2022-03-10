import 'package:matgar/componant/componant.dart';
import 'package:matgar/moduels/login/cubit/login_cubit.dart';
import 'package:matgar/moduels/login/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matgar/moduels/login/login.dart';

class Register extends StatelessWidget {
  static String id = 'Register';
  Register({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var nameController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is CreateUserSucsses) {
          nextPage(context: context, page: Login());
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
                      child: Column(
                        children: [
                          Image.asset('assets/images/auth.png'),
                          formField(
                            type: TextInputType.name,
                            controller: nameController,
                            hint: 'name',
                            label: 'name',
                            validate: (String val) {
                              if (val.isEmpty) {
                                return 'Name must be not empty';
                              } else {
                                return null;
                              }
                            },
                            icon: Icons.verified_user,
                          ),
                          SizedBox(
                            height: 10,
                          ),
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
                            type: TextInputType.phone,
                            controller: phoneController,
                            hint: 'phone',
                            label: 'phone',
                            validate: (String val) {
                              if (val.isEmpty) {
                                return 'Phone must be not empty';
                              } else {
                                return null;
                              }
                            },
                            icon: Icons.phone,
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
                              txt: 'Register',
                              onPressed: () {
                                LoginCubit.get(context).createNewUser(
                                  email: emailController.text,
                                  name: nameController.text,
                                  password: passwordController.text,
                                  phone: phoneController.text,
                                );
                                print('Register');
                              }),
                        ],
                      ),
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
                          txt: 'if you have an account ',
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                        InkWell(
                          onTap: () {
                            nextPage(context: context, page: Login());
                          },
                          child: customText(
                            txt: 'Login',
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
