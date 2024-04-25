import 'package:flutter/material.dart';
import 'package:formativa_rodrigo/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; 

void main() {
  
  runApp(MaterialApp(
    home: Login(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String url = "http://10.109.83.9:3000/produtos";
  
   List dado =[];
   var produtos = <Produto>[]; 
  _getdado()async{
  
    http.Response resposta = await http.get(Uri.parse(url)); 
   var dado =json.decode(resposta.body); 
   dado = json.decode(resposta.body);

   
    for(int i =0; i<dado.length; i++)
    {
      print(dado[i]);
    }
    setState(() {
      
      produtos = dado.map((json) => Produto.fromJson(json)).toList();
    });
   
  }
 
  _deletepost(){
    // http delete é o metodo utilizado para deletar um produto da api
    http.delete(Uri.parse('http://10.109.83.9:3000/produtos/14b4'));
  }
  // put 
  // Url, header, body
  // Json Encode formata a mensagem
  _put(){
    http.put(Uri.parse('http://10.109.83.10:3000/produtos/736a'),
    headers: <String, String>{
      'Content-type': 'application/json; charset=UTF-8', 
    },
    body: jsonEncode({"id":"8", "nome":"Xbox Series X","valor":"2500"}),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("App Mercado"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Get, Post, Put, delete http", style: TextStyle(fontSize: 18),),
            ElevatedButton(onPressed: _getdado, child: Text("Ler")), 
            
            ElevatedButton(onPressed: _deletepost, child: Text("Deletar")),
            ElevatedButton(onPressed: _put, child: Text("Alterar")),
            
            Column(
              // exibe os dados no text
              // map faz o mapeamento dos dados na lista
              children:produtos.map((produto)=>Text("${produto.nome} - R\$ ${produto.valor}",
              style: TextStyle(fontSize: 18),)).toList(),
            
            ),
          ],
        ),
      ),
    );
  }
}

class Produto{
  String id;
  String nome;
  String valor;
  Produto(this.id, this.nome, this.valor);
  // Função factory é a função responsável por decodificar o dado json consumido através da api
  factory Produto.fromJson(Map<String,dynamic>json){
    return Produto(json["id"],json["nome"],json["valor"]);

  }  
}
// Classe produto_n para armazenar a lista total de produtos
class Produto_n{
  List prod =[];
  Produto_n(this.prod);
}