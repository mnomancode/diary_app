import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: height * 0.4,
                decoration: const BoxDecoration(
                  // color: Colors.amber,
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment(.7, 2.9),
                    colors: <Color>[
                      Color.fromRGBO(214, 105, 28, 1),
                      Color.fromRGBO(214, 149, 28, 1),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(70),
                  ),
                ),
                child: const Center(
                  child: Icon(
                    Icons.book,
                    size: 90,
                    color: Colors.white,
                  ),
                ),
              ),
              const Positioned(
                bottom: 40,
                right: 30,
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
          Container(
            height: height * 0.5,
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: height * 0.065,
                  child: const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Icon(Icons.email, size: 20),
                      ),
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Color.fromRGBO(214, 149, 28, .5),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: height * 0.065,
                  child: const TextField(
                    obscureText: true,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Icon(Icons.vpn_key, size: 20),
                      ),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Color.fromRGBO(214, 149, 28, .5),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  height: 40,
                  child: const TextButton(
                    onPressed: null,
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Color.fromRGBO(214, 149, 28, 1),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),

                SizedBox(
                  width: double.infinity,
                  height: height * 0.065,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      primary: const Color.fromRGBO(214, 129, 28, 1),
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 10),
                      textStyle: const TextStyle(
                          fontSize: 20, fontFamily: 'CormorantGaramond'),
                    ),
                    child: const FittedBox(
                      child: Text(
                        'Sign In With Google',
                      ),
                    ),
                    // ignore: avoid_print
                    onPressed: () => print('op'),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text('Don\'t have an account ? '),
              const TextButton(
                onPressed: null,
                child: Text(
                  'Register',
                  style: TextStyle(color: Color.fromRGBO(250, 150, 0, 1)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
