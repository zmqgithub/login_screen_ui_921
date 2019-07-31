import 'package:flutter/material.dart';
import 'background.dart';
import 'custom_textfield.dart';
import 'values.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  SHTextField _textFieldEmail = SHTextField(icon: Icons.security, hintText: 'Email', inputtype: TextInputType.emailAddress,);
  SHTextField _textFieldPassword = SHTextField(icon: Icons.security, hintText: 'Password', inputtype: TextInputType.text, obscure: true,);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomPaint(
            painter: Background(),
            size: Size(size.width, size.height),
          ),
          Align(alignment: Alignment.center,
          child: Column(children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 60.0),
            child: Container(
            child: Image.asset('assets/ic_launcher.png', width: 80, height: 80,),),),
            Text('Sport Icon', style: TextStyle(fontSize: 30.0, color: Colors.black87),),

          ],),),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            _textFieldEmail,
            SizedBox(height: size.height/60,),
            _textFieldPassword,
            Padding(padding: EdgeInsets.only(),
            child: InkWell(onTap: (){

              bool isValid = true;
              String resp;
              if ((resp = validateEmail(_textFieldEmail.text)) != null) {
                _textFieldEmail.sHTextFieldState.showErrorMessage(resp);
                isValid = false;
              }

              if ((resp = validatePassword(_textFieldPassword.text)) !=
                  null) {
                _textFieldPassword.sHTextFieldState.showErrorMessage(resp);
                isValid = false;
              }

              if (isValid) {
                var emailId = _textFieldEmail.text;
                var password = _textFieldPassword.text;

                print('email: $emailId, pass: $password');
              }
            }, child: Container(
              width: double.infinity,
              height: 50.0,
              margin: EdgeInsets.only(right: size.width/20, left: size.width/20, top: size.height/40),
              child: Center(child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 20.0),),),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                gradient: LinearGradient(colors: [Colors.pink, Colors.deepOrange],
                    begin: Alignment.bottomCenter, end: Alignment.bottomLeft,
                    tileMode: TileMode.clamp)
              ),
            )),),
              FlatButton(onPressed: (){

              }, child: Text('FORGOT PASSWORD?', style: TextStyle(color: Colors.pink),)),
              Stack(children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: size.width/20, right: size.width/20, top: size.height/80, bottom: size.height/100),
                  height: 0.8, color: Colors.black38,),
                Center(child: Text(' Or login with ', style: TextStyle(backgroundColor: Colors.white),),)
              ],),
              
              Padding(padding: EdgeInsets.only(top: size.height/40, left: size.width/20, right: size.width/20),
              child: Row(children: <Widget>[
                  socialButtons(facebook),
                  socialButtons(googlePlus),
                  socialButtons(twitter),
              ],),)
              
          ],),

          Align(alignment: Alignment.bottomCenter,
          child: Padding(padding: EdgeInsets.only(bottom: size.height/20,),
          child: InkWell(child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
            Text('Don\'t have an account?'),
            Text('Sign Up', style: TextStyle(color: Colors.pink, fontSize: 18.0),),
          ],),),),)
        ],
      ),
    );
  }

  Widget socialButtons(image) => Expanded(child: GestureDetector(
    child: Container(
      child: Image.asset('assets/$image.png'),
      width: 50.0,
      height: 50.0,
    ),
    onTap: () {
      switch (image) {
        case facebook:
          {
            print('facebook selected');
          }
          break;

        case googlePlus:
          {
            print('google-plus selected');
          }
          break;

        case twitter:
          {
            print('twitter selected');
          }
          break;

        default: {

        }
      }
    },
  ));
}


//SHTextField(icon: Icons.email, hintText: 'Username', inputtype: TextInputType.emailAddress,)