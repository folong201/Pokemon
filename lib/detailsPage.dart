import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailsPages extends StatefulWidget {
  DetailsPages({super.key, required this.pokemon, this.color});
  var pokemon;
  var color;
  @override
  State<DetailsPages> createState() => _DetailsPagesState();
}

class _DetailsPagesState extends State<DetailsPages> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var heigth = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: widget.color,
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(
              top: 40,
              left: 3,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.white,
                  ))),
          Positioned(
            child: Text(
              widget.pokemon['name'],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white),
            ),
            top: 80,
            left: 20,
          ),
          Positioned(
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0), color: Colors.red),
              child: Text(
                widget.pokemon['type'].join(','),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
              ),
            ),
            top: 120,
            left: 20,
          ),
          Positioned(
              bottom: 0,
              child: Container(
                width: width,
                height: heigth * 0.6,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(28),
                        topRight: Radius.circular(28))),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Container(
                              width: width * 0.3,
                              child: Text("Name",style: TextStyle(fontWeight: FontWeight.bold),),
                            ),
                            Container(
                              width: width * 0.3,
                              child: Text(widget.pokemon['name']),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Container(
                              width: width * 0.3,
                              child: Text(
                                "Heigth",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              width: width * 0.3,
                              child: Text(widget.pokemon['height']),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Container(
                              width: width * 0.3,
                              child: Text(
                                "weight",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              width: width * 0.3,
                              child: Text(widget.pokemon['weight']),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Container(
                              width: width * 0.3,
                              child: Text(
                                "spawn_time",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              width: width * 0.3,
                              child: Text(widget.pokemon['spawn_time']),
                            ),
                          ],
                        ),
                                                SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Container(
                              width: width * 0.3,
                              child: Text(
                                "spawn_chance",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              width: width * 0.3,
                              child: Text(widget.pokemon['spawn_time'].toString()),
                            ),
                          ],
                        ),
                                              SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Container(
                              width: width * 0.3,
                              child: Text(
                                "egg",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              width: width * 0.3,
                              child: Text(widget.pokemon['egg']),
                            ),
                          ],
                        ),
                                                                    SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Container(
                              width: width * 0.3,
                              child: Text(
                                "multipliers",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              width: width * 0.3,
                              child: Text(widget.pokemon['multipliers'][0].toString()),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Container(
                              width: width * 0.3,
                              child: Text(
                                "prev_evolution",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              width: width * 0.3,
                              child: Text(widget.pokemon['prev_evolution']!=null?widget.pokemon['prev_evolution'][0]['name'].toString():"unknow"),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Container(
                              width: width * 0.3,
                              child: Text(
                                "next_evolution",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              width: width * 0.3,
                              child: Text(widget.pokemon['next_evolution'][0]
                                      ['name']
                                  .toString()),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )),
          Positioned(
              top: 167,
              left: 120,
              child: Hero(
                tag: widget.pokemon,
                child: CachedNetworkImage(
                  fadeInCurve: Curves.easeOut,
                  imageUrl: widget.pokemon['img'],
                ),
              ))
        ],
      ),
    );
  }
}
