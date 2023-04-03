import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lihatin/cubit/auth_cubit.dart';
import 'package:lihatin/cubit/film_cubit.dart';
import 'package:lihatin/cubit/page_cubit.dart';
import 'package:lihatin/cubit/seat_cubit.dart';
import 'package:lihatin/cubit/transaction_cubit.dart';
import 'package:lihatin/ui/pages/bonus_page.dart';
import 'package:lihatin/ui/pages/get_started_page.dart';
import 'package:lihatin/ui/pages/main_page.dart';
import 'package:lihatin/ui/pages/sign_in_page.dart';
import 'package:lihatin/ui/pages/sign_up_page.dart';
import 'package:lihatin/ui/pages/succes_chekout.dart';
import 'ui/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => FilmCubit(),
        ),
        BlocProvider(
          create: (context) => SeatCubit(),
        ),
        BlocProvider(
          create: (context) => TransactionCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/get-started-page': (context) => const GetStartedPage(),
          '/sign-up': (context) => SignUp(),
          '/sign-in': (context) => SignIn(),
          '/bonus': (context) => const BonusPage(),
          '/main': (context) => const MainPage(),
          '/success-transaction': (context) => const SuccessCheckoutPage(),
        },
      ),
    );
  }
}
