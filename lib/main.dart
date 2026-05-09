import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_fltr_lnt_a/app_theme.dart';
import 'package:main_fltr_lnt_a/blocs/auth_bloc.dart';
import 'package:main_fltr_lnt_a/blocs/transaction_bloc.dart';
import 'package:main_fltr_lnt_a/firebase_options.dart';
import 'package:main_fltr_lnt_a/screens/home_page.dart';
import 'package:main_fltr_lnt_a/screens/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthBloc()..add(CheckAuthEvent()),),
        BlocProvider(create: (_) => TransactionBloc(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          if(state is Authenticated) {
            return HomePage();
          } else {
            return LoginPage();
          }
        },)
      ),
    );
  }
}
