import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:formativa_rodrigo/exibir.dart';
import 'package:http/http.dart' as http;
import 'package:formativa_rodrigo/main.dart';

class Telaprodutoscadastro extends StatefulWidget {
  const Telaprodutoscadastro({super.key});

  @override
  State<Telaprodutoscadastro> createState() => _TelaprodutoscadastroState();
}

class _TelaprodutoscadastroState extends State<Telaprodutoscadastro> {
  String url = 'http://10.109.83.9:3000/produtos';
TextEditingController nome = TextEditingController();
TextEditingController valor = TextEditingController();

  _post(){
    Map<String,dynamic>msg2 = {
      "nome": nome.text.toString(),
      "valor": valor.text.toString()
      
    };
    // Metodo http post para realizar uma requisição 
    // http post Uri parse, headers. body
    print("Produto ok");
    http.post(
      Uri.parse(url),
      headers: <String,String>{
        'Content-type':'application/json; charset=UTF-8',
      },
      //body:jsonEncode(mensagem) , // transforma a mensagem para o formato json para fazer o post
      body: jsonEncode(msg2),
    );
  }
  
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Mercado"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          
        TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(border:OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(width: 50),
              ),
              labelText: "Digite o nome do produto",),
               controller: nome,
               
            ),
         TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(border:OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(width: 50),
              ),
              labelText: "Digite o valor do produto",),
               controller: valor,
               
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(border:OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(width: 50),
              ),
              labelText: "Digite a quantidade do produto",),
               
               
            ),
            ElevatedButton(onPressed: _post, child: Text("Cadastrar")),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Exibir()));
            }, child: Text('Exibir Produtos'))
        ]
      ),
    );
  }
}

class Produtos extends StatefulWidget {
   
  final String nomeprod;
  final String img;
  final double valorprod;
  final int qtde;
  Produtos({required this.nomeprod, required this.img,required this.qtde, required this.valorprod});
  @override
  State<Produtos> createState() => _ProdutosState();
}

class _ProdutosState extends State<Produtos> {
  int cont =0;
  @override
  Widget build(BuildContext context) {
    return        
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(width: 150,height: 150,decoration:BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.grey,
              
            
              ),
              child: Image.network(widget.img,fit: BoxFit.fill,),),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${widget.nomeprod} ",style: TextStyle(fontSize: 18),),
                Text("Quantidade $cont",style: TextStyle(fontSize: 18),),
                Text("Valor R\$ ${widget.valorprod} ",style: TextStyle(fontSize: 18),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
              
                  children: [
                    Text("Qtde:",style: TextStyle(fontSize: 18),),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(onPressed: (){
                        
                        setState(() {                         
                          cont++;
                        });
                      }, child: Icon(Icons.add)), 
                    ),
                     ElevatedButton(onPressed: (){
                      
                      setState(() {
                        if(cont>0) 
                        cont--;
                      });
                    }, child: Icon(Icons.restore)), 
                  ],
                ),
                
              ],
              
            ),
            
            
          ],
        );
      
    
    
  }
}