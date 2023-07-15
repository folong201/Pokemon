import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/detailsPage.dart';

class pokeCard extends StatefulWidget {
  pokeCard({super.key, required this.pokemon});
  var pokemon;
  @override
  State<pokeCard> createState() => _pokeCardState();
}

class _pokeCardState extends State<pokeCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        color: getColor(),
        child: Stack(
          children: [
            Positioned(
              top: 5,left: 5,child: Container(
              padding: EdgeInsets.symmetric(vertical: 8,horizontal: 7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12)
              ),
              child: Text(widget.pokemon['name'],style: TextStyle(color: Colors.white,fontWeight:FontWeight.w600,fontSize: 20),),
            )),
            Positioned(
                top: 35,
                left: 15,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(12)),
                  child: Text(
                    widget.pokemon['type'][0].toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                )),
            Positioned(
              top: 50,
              left: 50,
              child:
                  Hero(tag: widget.pokemon,child: CachedNetworkImage(imageUrl: widget.pokemon['img'].toString())),
            ),
          ],
        ),
      ),
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return  DetailsPages(pokemon: widget.pokemon,color: getColor(),);
      }));
    },
    );
  }

  MaterialAccentColor getColor() {
    if (widget.pokemon['type'][0] == "Grass") {
      return Colors.greenAccent;
    } else if (widget.pokemon['type'][0] == "Fire") {
      return Colors.purpleAccent;
    } else if (widget.pokemon['type'][0] == "Water") {
      return Colors.blueAccent;
    } else if (widget.pokemon['type'][0] == "Rock") {
      return Colors.lightGreenAccent;
    } else {
      return Colors.redAccent;
    }
  }
}
