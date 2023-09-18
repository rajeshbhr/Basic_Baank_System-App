import 'package:basic_bank_system/modules/SplashScreen.dart';
import 'package:basic_bank_system/shared/BLoC/cubit.dart';
import 'package:basic_bank_system/shared/BLoC/states.dart';
import 'package:basic_bank_system/shared/Components/constants.dart';
import 'package:basic_bank_system/shared/network/remote/bloc_observer.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'modules/WelcomeScreen.dart';

void main() {
  BlocOverrides.runZoned(
    () {
      runApp(MultiBlocProvider(providers: [
        BlocProvider<BankCubit>(
          create: (context) => BankCubit()..CreateDataBase()                 
        ),
      ], child: MyApp()));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BankCubit()
        ..CreateDataBase() 

    )],
      child: BlocConsumer<BankCubit, BankSatates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                titleTextStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
                backgroundColor: Colors.white,
                elevation: 0,
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: secondary,
                    statusBarBrightness: Brightness.dark),
              ),
              scaffoldBackgroundColor: Colors.white,
              primarySwatch: Colors.red,
            ),
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}

