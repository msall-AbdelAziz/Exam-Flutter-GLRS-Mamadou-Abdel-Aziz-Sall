import 'package:flutter/material.dart';
import 'file:///C:/Users/msall/OneDrive/Bureau/flutter_app_shop/lib/views/first_view.dart';
import 'package:flutter_app_shop/pages/home.dart';
import 'file:///C:/Users/msall/OneDrive/Bureau/flutter_app_shop/lib/views/sign_up_view.dart';
import 'file:///C:/Users/msall/OneDrive/Bureau/flutter_app_shop/lib/widgets/provider_widget.dart';
import 'package:flutter_app_shop/services/auth_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Provider(
      auth: AuthService(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Travel Budget App",
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: HomeController(),
        routes: <String, WidgetBuilder>{
          '/signUp': (BuildContext context) => SignUpView(authFormType: AuthFormType.signUp),
          '/signIn': (BuildContext context) => SignUpView(authFormType: AuthFormType.signIn),
          '/home': (BuildContext context) => HomeController(),
        },
      ),
    );
  }
}

class HomeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of(context).auth;
    return StreamBuilder<String>(
      stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool signedIn = snapshot.hasData;
          return signedIn ? HomePage() : FirstView();
        }
        return CircularProgressIndicator();
      },
    );
  }
}
