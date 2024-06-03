import 'package:flutter/material.dart';
import 'package:mvvm/res/components/round_button.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // to shift focus of cursor from one field to another when one field is done*
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override

  void dispose(){
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    _obsecurePassword.dispose();
  }

  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height*1;
    return Scaffold(
      appBar: AppBar(title: Text('Login'),centerTitle: true,),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            focusNode: emailFocusNode,
            decoration: const InputDecoration(
              hintText: 'Email',
              labelText: 'Email',
              prefixIcon: Icon(Icons.email)
            ),
            onFieldSubmitted: (valu){
              Utils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);
            },
          ),

          ValueListenableBuilder(valueListenable: _obsecurePassword,
              builder: (context, value, child){
            return TextFormField(
              controller: _passwordController,
              focusNode: passwordFocusNode,
             obscureText: _obsecurePassword.value,
              obscuringCharacter: "*",

              decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock_open_rounded),
                // suffixIcon: Icon(Icons.visibility_off),
                suffixIcon: InkWell(
                  onTap: (){
                    _obsecurePassword.value = !_obsecurePassword.value;
                  },
                  child: Icon(_obsecurePassword.value? Icons.visibility_off: Icons.visibility),
                ),
              ),
              onFieldSubmitted: (valu){
                Utils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);
              },

            );
          }
          ),
          SizedBox(height: height*0.085,),
          RoundButton(title: 'Login', onPress: (){
            if(_emailController.text.isEmpty){
              Utils.flushBarErrorMessage('email required', context);
            }
            else if(_passwordController.text.isEmpty){
              Utils.flushBarErrorMessage('pw required', context);
            }
            else if(_passwordController.text.length < 6){
              Utils.flushBarErrorMessage('pw should be of atleast 6 characters', context);
            }
            else{
              print('API hit');
            }
          })

        ],
      ),

      // body: Center(
      //   child: InkWell(
      //     child: Text('click'),
      //     onTap: (){
      //       // Navigator.pushNamed(context, RoutesName.home);
      //       // Utils.toastMessage('this is a toast!');
      //       // Utils.flushBarErrorMessage('this is flushbar', context);
      //       Utils.snackBar('snackbar message!', context);
      //     },
      //   ),
      // ),
    );
  }
}
