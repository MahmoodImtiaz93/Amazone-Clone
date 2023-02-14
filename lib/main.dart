import 'package:amazone_clone/common/bottom_bar.dart';
import 'package:amazone_clone/constants/global_variable.dart';
import 'package:amazone_clone/features/admin/screens/admin_screen.dart';
import 'package:amazone_clone/features/auth/screens/auth_screen.dart';
import 'package:amazone_clone/features/auth/services/auth_service.dart';
import 'package:amazone_clone/features/home/screens/home_screen.dart';
import 'package:amazone_clone/provider/productprovider.dart';
import 'package:amazone_clone/provider/user_provider.dart';
import 'package:amazone_clone/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
 
 
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => ProductProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   final AuthService authService = AuthService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     authService.getUserData(context);
     print("initState");
  }

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Amazon',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme:
            const ColorScheme.light(primary: GlobalVariables.secondaryColor),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.type == 'admin'
              ? BottomBar()
              : const AdminScreen()
          : const AuthScreen(),
          
    );
    
  }
}
