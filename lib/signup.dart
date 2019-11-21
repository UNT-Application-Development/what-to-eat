import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home.dart';
class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
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
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email:_email,password: _password);
        //FirebaseAuth.instance.signInWithEmailAndPassword(email:_email,password: _password);
         //Navigator.push(context,MaterialPageRoute(builder: (context)=>Home()));
         Navigator.of(context).pop();
      }
      catch(e){
        print(e.message);

      }
     
    }
  }

}