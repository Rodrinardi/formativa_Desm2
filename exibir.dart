import 'package:flutter/material.dart';
import 'package:formativa_rodrigo/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class Exibir extends StatefulWidget {
  const Exibir({super.key});

  @override
  State<Exibir> createState() => _ExibirState();
}

class _ExibirState extends State<Exibir> {
  String url = "http://10.109.83.9:3000/produtos";
  
   List dado =[];
   var produtos = <Produto>[]; 
  _getdado()async{
  
    http.Response resposta = await http.get(Uri.parse(url)); 
    dado =json.decode(resposta.body)  ; 
   // dado = json.decode(resposta.body);

   
    for(int i =0; i<dado.length; i++)
    {
      print(dado[i]);
    }
    setState(() {
      
      produtos = dado.map((json) => Produto.fromJson(json)).toList();
    });
   
  }
  _deletar(){
    http.delete(Uri.parse('http://10.109.83.9:3000/produtos/14b4'));

  }
  _put(){
    http.put(Uri.parse('http://10.109.83.10:3000/produtos/736a'),
    headers: <String, String>{
      'Content-type': 'application/json; charset=UTF-8', 
    },
    body: jsonEncode({"id":"7", "nome":"Xbox Series X","valor":"2500"}),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Produtos'),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: _getdado, child: Text("Exibir")),
          ElevatedButton(onPressed: _deletar, child: Text("Deletar")),
          Column(
              // exibe os dados no text
              // map faz o mapeamento dos dados na lista
              children:produtos.map((produto)=>Text("${produto.nome} - R\$ ${produto.valor}",
              style: TextStyle(fontSize: 18),)).toList(),
            
            ),
            
          
        ],
       
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