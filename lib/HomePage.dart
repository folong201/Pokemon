import 'package:flutter/material.dart';
import 'package:pokemon/pokeCard.dart';
import 'package:pokemon/service.dart';
// import 'package:pokemon/service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _pokemonlist = [];

  @override
  void initState() {
    super.initState();
    _getPokemonList();
  }

  void _getPokemonList() async {
    var result = await Service().getPokemonList();
    setState(() {
      _pokemonlist = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var heigth = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
      children: [
        Positioned(top: 100, left: 20, child: Text("Pokemons",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800),)),
        Positioned(
            top: 150,
            bottom: 0,
            width: width,
            child: _pokemonlist.length != null
                ? GridView.builder(
                    itemCount: _pokemonlist.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.0,
                    ),
                    itemBuilder: (context, index) {
                      // print(_pokemonlist[index]['url']);
                      return pokeCard(pokemon: _pokemonlist[index]);
                    })
                : CircularProgressIndicator(
                    color: Colors.yellowAccent,
                  )),
      ],
    ));
  }
}
