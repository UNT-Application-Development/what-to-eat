import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:what_to_eat/signup.dart';


import 'home.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'sign in'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _email,_password;
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

  return Scaffold(
     appBar: AppBar(
        title: Text('What to Eat'),
      ),
     
    
    body: Center(
      child:Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
            ),
        child: Container(
          width: 300,
          height: 300,
          child: Form(
             key: _formKey,
          child: Column(children: <Widget>[
            TextFormField(
              validator: (input) {
                if(input.isEmpty){
                  return 'Please type An Email';
                }
              },
              onSaved: (input)=> _email=input,
              decoration: InputDecoration(
              labelText: 'Email',
              border: new OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  const Radius.circular(10.0),
                ),

              ),
              
            ),
      
          ),
          TextFormField(
              validator: (input) {
                if(input.isEmpty){
                  return 'Please provide a password';
                }
                 else if(input.length <6){
                  return 'Your Password needs to be at least 6 characters';
                }
              },
              onSaved: (input)=> _password=input,
              decoration: InputDecoration(
              labelText: 'Password',
                   border: new OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  const Radius.circular(10.0),
                ),
                

              ),
                  filled: true,
                hintStyle: new TextStyle(color: Colors.grey[800]),
                hintText: "Password",
                fillColor: Colors.white70
            ),
            obscureText: true,
          ),
          RaisedButton(
            onPressed: signIn,
            child: Text("Sign in"),

          ),
           RaisedButton(
            onPressed:(){ Navigator.push(context,MaterialPageRoute(builder: (context)=>signup()));},
            child: Text("Sign up"),

          )
          
          ]

          )
        
        ),
      ),
 
    
   
    ),

    )

    
  );
}
  Future<void> signIn() async{
    final FormState=_formKey.currentState;
    if(FormState.validate()){
      FormState.save();
      try{
        await FirebaseAuth.instance.signInWithEmailAndPassword(email:_email,password: _password);
         Navigator.push(context,MaterialPageRoute(builder: (context)=>Home()));
      }
      catch(e){
        print(e.message);

      }
     
    }
  }
}
