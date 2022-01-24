import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading=false;
  LoginResult? userData;
  @override
  Widget build(BuildContext context) {
     return MaterialApp(home: Scaffold(
       appBar: AppBar(
          title:const Text('demo'),
        ),
        body: isLoading
            ? Column(
                children: [
                  // Image.network(userData.toString()),
                  Text(userData!.message.toString()),
                  // Text(userData['email']),
                  ElevatedButton(
                    child:const Text('LogOut'),
                    onPressed: () {
                      {
                        setState(() {
                          userData=null;
                          isLoading=false;
                        });
                      }
                    },
                  ),
                ],
              )
            : Center(
                child: ElevatedButton(
                    onPressed: ()async {
                      final facebookSignIn = FacebookLogin(); 
                      FacebookAuth.instance.login(
                        permissions: const ['email', 'public_profile']
                      ).then((data){
                        setState(() {
                          isLoading=true;
                          userData=data ;
                          print(data.message.toString());
                        });
                      });

                       
                  
                    },
                    child:const Text('signIn')),
              ),
      
        ),); 
  }
}
