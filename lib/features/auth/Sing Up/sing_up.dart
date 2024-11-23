import 'package:firebase_a/features/auth/Sing%20In/sing_in.dart';
import 'package:firebase_a/features/auth/Sing%20Up/cubit/up_singl_cubit.dart';
import 'package:firebase_a/features/home/notes_home.dart';
import 'package:firebase_a/theme/app_text_styles.dart';
import 'package:firebase_a/widget/custom_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingUpSreen extends StatefulWidget {
  const SingUpSreen({super.key});

  @override
  State<SingUpSreen> createState() => _SingUpSreenState();
}

class _SingUpSreenState extends State<SingUpSreen> {
  final TextEditingController controllerEmailUp = TextEditingController();
  final TextEditingController controllerPasswordUp = TextEditingController();
  String errorTextEmail = '';
  String errorTextPassword = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpSinglCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Register Account',
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
                  controller: controllerEmailUp,
                  errorText: errorTextEmail,
                ),
                const SizedBox(height: 26),
                Text(
                  'Password',
                  style: AppTextStyles.s18W500(),
                ),
                CustomTextField(
                  controller: controllerPasswordUp,
                  errorText: errorTextPassword,
                ),
                const SizedBox(height: 26),
                BlocListener<UpSinglCubit, UpSinglState>(
                  child: Center(
                    child: SizedBox(
                      width: 280,
                      height: 45,
                      child: Builder(builder: (context) {
                        return ElevatedButton(
                          onPressed: () {
                            setState(() {
                              // 1 CustomTextField
                              if (controllerEmailUp.text.isEmpty) {
                                errorTextEmail = '';
                              } else {
                                if (controllerEmailUp.text.isNotEmpty &&
                                    controllerEmailUp.text.length > 5) {
                                  if (controllerEmailUp.text
                                      .contains('@gmail.com')) {
                                    errorTextEmail = '';
                                    // 2 CustomTextField
                                    if (controllerPasswordUp.text.isEmpty) {
                                      errorTextPassword = '';
                                    } else {
                                      if (controllerPasswordUp
                                              .text.isNotEmpty &&
                                          controllerPasswordUp.text.length >
                                              5) {
                                        errorTextPassword = '';
                                        // UpSinglCubit
                                        context.read<UpSinglCubit>().singlup(
                                              controllerEmailUp.text
                                                  .toLowerCase(),
                                              controllerPasswordUp.text,
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
                            'Sing Up',
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
                          builder: (context) => const NotesHome(),
                        ),
                        (_) => false,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Успешно зарегистрирован')),
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
                      'Already have account?',
                      style: AppTextStyles.s14W400(
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SingInSreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Login In',
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
