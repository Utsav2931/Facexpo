import 'package:flutter/material.dart';
import 'package:flutter_gif_trail/main.dart';
import 'package:flutter_gif_trail/services/auth.dart';
import 'package:flutter_gif_trail/sidebar/home.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:liquid_swipe/Helpers/Helpers.dart';

//import 'Setup/SignIn.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => new _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    //Image.asset('assets/logo_transparent.png'),
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(top: 200),
        child: SplashScreen(
          seconds: 8,
          navigateAfterSeconds: MyApp(),
          image: new Image.asset('assets/logo_transparent.png',
              alignment: Alignment.center),
          backgroundColor: Colors.white,
          styleTextUnderTheLoader: new TextStyle(),
          photoSize: 150.0,
          onClick: () => print("Flutter Egypt"),
          loaderColor: Colors.white,
        ),
      ),
    );
    // SplashScreen(
    //   seconds: 8,
    //   navigateAfterSeconds: AfterSplash(),
    //   image: new Image.asset('assets/logo_transparent.png', alignment: Alignment.center),
    //   backgroundColor: Colors.black,
    //   styleTextUnderTheLoader: new TextStyle(),
    //   photoSize: 150.0,
    //   onClick: () => print("Flutter Egypt"),
    //   loaderColor: Colors.black,
    // );
  }
}

class AfterSplash extends StatefulWidget {
  // class _LoginScreenState extends State<LoginScreen>{

  static const TextStyle facexpogreystyle = TextStyle(
    color: Colors.grey,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle searchstyle = TextStyle(
    fontSize: 40.0,
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontFamily: "Gotu-Regular",
  );

  static TextStyle kLabelStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontFamily: 'OpenSans',
  );
  static TextStyle kHintTextStyle = TextStyle(
    color: Colors.white54,
    fontFamily: 'OpenSans',
  );
  static BoxDecoration kBoxDecorationStyle = BoxDecoration(
    color: Color(0xFF6CA8F1),
    borderRadius: BorderRadius.circular(10.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 6.0,
        offset: Offset(0, 2),
      ),
    ],
  );

  @override
  _AfterSplashState createState() => _AfterSplashState();
}

class _AfterSplashState extends State<AfterSplash> {
  
 // final formKey =new GlobalKey<FormState>();
  String email = '';
  String password = '';
  
  // Auth object
  final Authservice _auth = Authservice();
  @override
  Widget build(BuildContext context) {
    final pages = [
      Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              //child: Row(
              //children: <Widget>[
              //Text("Fac expo",
              //style : facexpogreystyle,

              //),
              //],
              //),
            ),
            Image.asset("assets/images/image.jpg"),
            Column(
              children: <Widget>[
                Center(
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeSearch()));
                    },
                    child: Text(
                      "Get Started",
                      style: AfterSplash.searchstyle,
                    ),
                    color: Colors.black,
                  ),
                )
              ],
            )
          ],
        ),
      ),
      Container(
        color: Colors.lightBlue,
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: 40.0,
            vertical: 120.0,
          ),
         // child :Form(
           // key:formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Sign in",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "OpenSans",
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30.0),
              
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Email",
                    style: AfterSplash.kLabelStyle,
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: AfterSplash.kBoxDecorationStyle,
                    height: 60.0,
                    child: TextField(
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                       
                      },
                      // validator: (value) =>value.isEmpty ?'Email can\'t be empty' : null,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                          color: Colors.white, fontFamily: "OpenSans"),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14.0),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        hintText: "Enter your email",
                        hintStyle: AfterSplash.kHintTextStyle,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 30.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Password",
                    style: AfterSplash.kLabelStyle,
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: AfterSplash.kBoxDecorationStyle,
                    height: 60.0,
                    child: TextField(
                      //keyboardType: TextInputType.emailAddress,
                      onChanged: (val) {
                        setState(() {
                          password = val;
                        });
                      },
                      obscureText: true,
                      style: TextStyle(
                          color: Colors.white, fontFamily: "OpenSans"),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14.0),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        hintText: "Enter your Password",
                        hintStyle: AfterSplash.kHintTextStyle,
                      ),
                    ),
                  )
                ],
              ),
              Container(
                alignment: Alignment.centerRight,
                child: FlatButton(
                  onPressed: () => print("Forgot Password button pressed"),
                  padding: EdgeInsets.only(right: 0.0),
                  child: Text(
                    "Forgot Password?",
                    style: AfterSplash.kLabelStyle,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 25.0),
                width: double.infinity,
                child: RaisedButton(
                  elevation: 5.0,
                  onPressed: () async {
                    print(email);
                    print(password);
                    dynamic result =
                        await _auth.signInWithEmailAndPassword(email, password);
                    if (result == null) {
                      print('Error');
                    } else {
                      print('Sucess');
                      //Navigator.pushNamed(context, '/temp');
                    }
                  },
                  padding: EdgeInsets.all(15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: Colors.white,
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 1.5,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "OpenSans",
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print("pressed");
                  Navigator.pushNamed(context, '/signup');
                },
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: 'Don\'t have an Account? ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                      //onPressed: () => print("Login button pressed"),
                      text: 'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ))
                ])),
                // onTap: (){
                //   MyApp2();
                // },
              ),
            ],
          ),
        ),
      ),
     // ),
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LiquidSwipe(
          pages: pages,
          enableLoop: true,
          fullTransitionValue: 300,
          enableSlideIcon: true,
          waveType: WaveType.liquidReveal,
          positionSlideIcon: 0.8,
        ),
      ),
    );
  }
}
