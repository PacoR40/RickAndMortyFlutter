import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:image_card/image_card.dart';
import 'package:rick_and_morty/models/character_model.dart';
import 'package:rick_and_morty/network/character_api.dart';
import 'package:rick_and_morty/screens/character_screen.dart';

class ListCharacters extends StatefulWidget {
  const ListCharacters({Key? key}) : super(key: key);

  @override
  State<ListCharacters> createState() => _ListCharactersState();
}

class _ListCharactersState extends State<ListCharacters> {

  CharactersApi charactersApi = CharactersApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Character List"), backgroundColor: Color.fromARGB(255, 38, 68, 52),),
      backgroundColor: Color.fromARGB(255, 158, 212, 143),
      body: FutureBuilder(
        future: charactersApi.getAllCharacter(),
        builder: (BuildContext context, AsyncSnapshot<List<Character>?> snapshot){
          if(snapshot.hasData){
            return _listViewCharacter(snapshot.data);
          }else{
            if (snapshot.hasError) {
              return Center( child: Text('Ocurrio un error en la peticion'));
            }
            else{
              return CardLoading(
                height: 100,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                margin: EdgeInsets.only(bottom: 10),
              );
            }
          }
        }
      ),
    );
  }

  Widget _listViewCharacter(List<Character>? snapshot) {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(color: Color.fromARGB(255, 158, 212, 143),),
      padding: EdgeInsets.symmetric(
        vertical: 20
      ),
      itemCount: snapshot!.length,
      itemBuilder: (context, index) {
        return Center(
          child: FillImageCard(
            width: 300,
            heightImage: 230,
            contentPadding: EdgeInsets.all(15),
            color: Colors.white,
            borderRadius: 25,
            imageProvider: NetworkImage(snapshot[index].image),
            title: Text(snapshot[index].name, style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20
            ),),
            //description: Text("Specie: " + snapshot[index].species),
            footer: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Specie: " + snapshot[index].species, style: TextStyle(
                      fontSize: 17
                    ),),
                    IconButton(
                      iconSize: 35,
                      icon: Icon(Icons.chevron_right),
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CharacterScreen(characterModel: snapshot[index] as Character))),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}