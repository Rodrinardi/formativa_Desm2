import 'package:formativa_rodrigo/cadastro_produtos.dart';

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  int selectop = 0;
  TextEditingController user = TextEditingController(); 
  TextEditingController senha = TextEditingController(); 
 
  
   _verificarlogin(){
    if(user.text == "rodrigo" && senha.text =="1234" ){
      print("Login administrador");
      Navigator.push(context, MaterialPageRoute(builder:(context)=> Telaprodutoscadastro()));
     // Navigator.pushNamed(context, "/telaproduto");
    }
    
    
    else{
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content:Text("Usuario ou senha inválido"),duration: Duration(seconds: 2) ),
        

      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Mercado"),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200, // largura
              height: 200, // altura do size box
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0), // padding para ajustar o espaço entre os elementos
                    child: TextField(
                      keyboardType: TextInputType.name, // text field para o login
                      decoration: InputDecoration(border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(30) // borda do TextField
                      ),labelStyle: TextStyle(backgroundColor:Colors.white ),
                      hintText: "Insira seu login"),
                      controller: user ,
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.number, // text field para a senha
                    decoration: InputDecoration(border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(30) // borda do TextField
                    ),labelStyle: TextStyle(backgroundColor:Colors.white ),
                    hintText: "Insira sua senha"),
                    controller: senha ,
                    obscureText: true, 
                    obscuringCharacter: "*", 
                    ),
      
                ],
              ),
      
            ),
            
            ElevatedButton(onPressed: _verificarlogin, child: Text("Entrar")),
          ],
      
        ),
      ),
    );
  }
}