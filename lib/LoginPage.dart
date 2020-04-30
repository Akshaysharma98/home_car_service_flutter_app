import 'package:flutter/material.dart';
import 'SignUp.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  //yha hum apni key bana rhe ha apne form ke liye 
  final _formkey = GlobalKey<FormState>();
  String _email , _password;
  bool _isObsucured = true;
  Color _eyeButtonColor = Colors.grey;


  CircleAvatar buildLogo() {
    return CircleAvatar(
            backgroundImage: AssetImage('Images/white_trans_small.png'),
            backgroundColor: Colors.transparent,
            radius: 60,
            );
  }

  Padding buildTitle() {
    return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Login',style: TextStyle(fontSize: 42.0,color: Colors.white)),
        );
  }

    Padding buildTitleLine() {
    return Padding(
          padding: EdgeInsets.only(top:4.0,left:12.0),
                    child: Align(
            alignment: Alignment.centerLeft,
                      child: Container(
                        width: 38.0,
                        height: 1.5,
                        color: Colors.white,
                      ),
          ),
        );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
                //onsaved tabhi chalega jab validator pass ho jayega
                onSaved: (emailInput) => _email = emailInput,
                validator: (emailInput) {
                  //ispa jo input karoonga use validate karna ha string ka sath ki shi ha ki ni
                  if(emailInput.isEmpty)
                    {

                      return 'Please enter email address';
                    }
                },
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurpleAccent[100]),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurpleAccent),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  
                  // border: InputBorder.none, //yeh niche ki line udane ka lia ha 
                ),

              );
  }

  TextFormField buildPasswordFormField(BuildContext context) {
    return TextFormField(
                onSaved: (passwordInput) => _password = passwordInput,
                validator: (passwordInput){
                  if(passwordInput.isEmpty)
                    {
                      return 'Please enter password';
                    }
                },
                decoration: InputDecoration(
                  labelText: 'Password',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurpleAccent[100]),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurpleAccent),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  //yeh button pe click kar ke password visible hoye 
                  suffix: IconButton(
                      onPressed: () {
                        if(_isObsucured)
                          {
                            setState(() {
                              _isObsucured = false;
                              _eyeButtonColor = Theme.of(context).primaryColor;
                            });
                          }
                        else
                          {
                            setState(() {
                              _isObsucured = true;
                              _eyeButtonColor = Colors.grey;
                            });
                          }
                      },
                      icon: Icon(Icons.remove_red_eye,color: _eyeButtonColor),
                      
                    ),
                ),
                obscureText: _isObsucured,
              );
  }

  Padding buildPasswordText() {
    return Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Align(
                      alignment: Alignment.centerRight,
                      child: Text('Forget Password ?',style: TextStyle(fontSize: 12,color: Colors.black),),
                    ),
              );
  }

  Align buildLoginButton(BuildContext context) {
    return Align(
                child: SizedBox(
                  height: 50,
                  width: 250,
                  child: FlatButton(
                    onPressed: ()
                    {
                      if(_formkey.currentState.validate())
                      {
                        //yeh tabhi chalega jab field empty na ho
                        _formkey.currentState.save();
                        //TODO yaha peh next page jane ka code likhna ha 
                      }
                    },
                    //bina onpressed ka button ni dhikhayega yeh
                    color: Colors.deepPurpleAccent[100],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                    child: Text('Login',style: Theme.of(context).primaryTextTheme.button,),
                  )
                ),
              );
  }

  Align buildOrText() {
    return Align(
                alignment: Alignment.center,
                child: Text('OR',style: TextStyle(fontSize: 12.0,color: Colors.grey[900]),),
              );
  }

  Align buildSignUpButton(BuildContext context) {
    return Align(
              child: SizedBox(
                height: 50,
                width: 250,
                child: FlatButton(
                  onPressed: ()
                  {
                    //yeh tabhi chalega jab field empty na ho
                    //TODO yaha peh signup page jane ka code likhna ha 
                     Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUp()),
            );

                  },
                  //bina onpressed ka button ni dhikhayega yeh
                  color: Colors.deepPurpleAccent[100],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                  child: Text('Sign Up',style: Theme.of(context).primaryTextTheme.button,),
                )
              ),
            );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        // padding: EdgeInsets.fromLTRB(22.0, 0, 22.0, 22.0),
        children: <Widget>[
          // // SizedBox(height: kToolbarHeight,),
          // // buildLoginBg(),
          // Image.asset('Images/login_background.png'),
          // buildLogo(),
          // buildTitle(),//idhar hamra title ayega 
          // buildTitleLine(),
          Image.asset('Images/login_background.jpg',fit: BoxFit.fill,),

          Center(
            child: Form(
              key: _formkey,
              child: ListView(
                children:<Widget>[
                  SizedBox(height: 40.0,),
                  buildLogo(),
                  SizedBox(height: 20.0,),
                  buildTitle(),//idhar hamra title ayega 
                  buildTitleLine(),
                  SizedBox(height: 70.0,),
                  buildEmailFormField(),
                  SizedBox(height: 5.0,),
                  buildPasswordFormField(context),
                  buildPasswordText(),
                  SizedBox(height: 10.0,),
                  //login button
                  buildLoginButton(context),
                  SizedBox(height: 5.0,),
                  buildOrText(),
                  SizedBox(height: 5.0,),
                  buildSignUpButton(context)
                  
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  
}