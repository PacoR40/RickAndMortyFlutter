import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/character_model.dart';

class CharacterScreen extends StatefulWidget {
  final Character? characterModel;
  const CharacterScreen({Key? key, required this.characterModel}) : super(key: key);

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.characterModel!.name),
        backgroundColor: Color.fromARGB(255, 38, 68, 52)
      ),
      backgroundColor: Color.fromARGB(255, 158, 212, 143),
      body: ListView(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
        children: <Widget>[
          CircleAvatar(
            radius: 110,
            backgroundImage: NetworkImage(widget.characterModel!.image),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(50.0),
                topRight: const Radius.circular(50.0),
              )
            ),
            height: 440,
            //width: 500,
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 20),
                    Text(
                        widget.characterModel!.name,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        (widget.characterModel!.status == "Alive") ? Icon(Icons.circle, color: Colors.green,) : Icon(Icons.circle, color: Colors.grey,),
                        Text(
                          widget.characterModel!.status,
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          " - ",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          widget.characterModel!.species,
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    Text(
                            widget.characterModel!.gender,
                            style: TextStyle(
                                fontSize: 17),
                        ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                            'Last known location:',
                            style: TextStyle(
                                fontSize: 17),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), color: Color.fromARGB(255, 86, 144, 82),
                      ),
                      width: 300,
                      padding: EdgeInsets.all(20), //Del contenedor para adentro
                      margin: EdgeInsets.all(10), 
                      child: Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.white,),
                          Text(
                            widget.characterModel!.location.name,
                            style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                            'Origin:',
                            style: TextStyle(
                                fontSize: 17),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), color: Color.fromARGB(255, 86, 144, 82),
                      ),
                      width: 300,
                      padding: EdgeInsets.all(20), //Del contenedor para adentro
                      margin: EdgeInsets.all(10), 
                      child: Row(
                        children: [
                          Icon(Icons.public, color: Colors.white,),
                          Text(
                            widget.characterModel!.origin.name,
                            style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}