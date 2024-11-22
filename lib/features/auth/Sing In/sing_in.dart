import 'package:firebase_a/features/auth/Sing%20In/cubit/in_singl_cubit.dart';
import 'package:firebase_a/features/home/home.dart';
import 'package:firebase_a/theme/app_text_styles.dart';
import 'package:firebase_a/widget/custom_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingInSreen extends StatefulWidget {
  const SingInSreen({super.key});

  @override
  State<SingInSreen> createState() => _SingInSreenState();
}

class _SingInSreenState extends State<SingInSreen> {
  final TextEditingController controllerEmailIn = TextEditingController();
  final TextEditingController controllerPasswordIn = TextEditingController();
  String errorTextEmail = '';
  String errorTextPassword = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InSinglCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Hello Again',
            style: AppTextStyles.s24W400(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 26),
                Text(
                  'Email Address',
                  style: AppTextStyles.s18W500(),
                ),
                CustomTextField(
                  controller: controllerEmailIn,
                  errorText: errorTextEmail,
                ),
                const SizedBox(height: 26),
                Text(
                  'Password',
                  style: AppTextStyles.s18W500(),
                ),
                CustomTextField(
                  controller: controllerPasswordIn,
                  errorText: errorTextPassword,
                ),
                const SizedBox(height: 26),
                BlocListener<InSinglCubit, InSinglState>(
                  child: Center(
                    child: SizedBox(
                      width: 280,
                      height: 45,
                      child: Builder(builder: (context) {
                        return ElevatedButton(
                          onPressed: () {
                            setState(() {
                              // 1 CustomTextField
                              if (controllerEmailIn.text.isEmpty) {
                                errorTextEmail = '';
                              } else {
                                if (controllerEmailIn.text.isNotEmpty &&
                                    controllerEmailIn.text.length > 5) {
                                  if (controllerEmailIn.text
                                      .contains('@gmail.com')) {
                                    errorTextEmail = '';
                                    // 2 CustomTextField
                                    if (controllerPasswordIn.text.isEmpty) {
                                      errorTextPassword = '';
                                    } else {
                                      if (controllerPasswordIn
                                              .text.isNotEmpty &&
                                          controllerPasswordIn.text.length >
                                              5) {
                                        errorTextPassword = '';
                                        // InSinglCubit
                                        context.read<InSinglCubit>().singlin(
                                              controllerEmailIn.text,
                                              controllerPasswordIn.text,
                                            );
                                      } else {
                                        errorTextPassword =
                                            'Не должно быть меньше 5';
                                      }
                                    }
                                    //
                                  } else {
                                    errorTextEmail = 'Bведите @gmail.com';
                                  }
                                } else {
                                  errorTextEmail = 'Не должно быть меньше 5';
                                }
                              }
                              //
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue),
                          child: Text(
                            'Sing In',
                            style: AppTextStyles.s14W400(),
                          ),
                        );
                      }),
                    ),
                  ),
                  listener: (context, state) => state.whenOrNull(
                    success: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Home(),
                        ),
                        (_) => false,
                      );
                      return null;
                    },
                    error: (error) {
                      return ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(error)),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 390),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'New User?',
                      style: AppTextStyles.s14W400(
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Create Account',
                        style: AppTextStyles.s14W400(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
