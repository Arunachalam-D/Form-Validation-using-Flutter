import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget{
  const FormScreen({super.key});
  @override
  State <FormScreen> createState() => _FormScreenState();
}
class _FormScreenState extends State<FormScreen>{

  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool passToggle = true;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Form"),
        backgroundColor: Colors.deepOrange,
      ),

      body: SingleChildScrollView(

        child: Padding(

          padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 90) ,
            child:Form(
                key: _formfield,
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                         Image.asset("images/Authenticate1.png", height: 150,width:150,),
                         const SizedBox(height: 45,),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: const InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email)
                        ),
                        validator: (value){
                          bool emailValid =  RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value!);

                          if(value!.isEmpty){
                            return "Enter Email";
                          }

                          else if(!emailValid){
                            return "Enter Valid Email";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20,),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: passController,
                        obscureText: passToggle,
                         decoration: InputDecoration(
                            labelText: "Password",
                            border: const OutlineInputBorder(),
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: InkWell(
                              onTap: (){
                                setState(() {
                                  passToggle = !passToggle;
                                });
                              },
                              child: Icon(passToggle ? Icons.visibility : Icons.visibility_off),
                          )
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return "Enter Password";
                          }
                          else if(passController.text.length < 8){
                            return "Password must be atleast 8 characters long";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 40,),
                      InkWell(
                        onTap: (){
                          if(_formfield.currentState!.validate()){
                            print("Login successful");
                            emailController.clear();
                            passController.clear();

                          }
                          else{
                            print("Login failed");
                          }
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular( 5)
                          ),
                          child:const Center(
                            child: Text("Login",style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.normal,

                            ),),
                          ),
                        ),
                      )
                    ],
                ))
        ),

      ),
    );
  }
}