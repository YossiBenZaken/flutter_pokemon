import 'package:flutter/material.dart';
import 'package:flutter_pokemon/pokemon.dart';

class PokemonDetail extends StatelessWidget {
  final Pokemon pokemon;
  PokemonDetail({required this.pokemon});

  bodyWidget(BuildContext context) => Stack(
        children: [
          Positioned(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width - 20,
            left: 10,
            top: MediaQuery.of(context).size.height * 0.1,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 65,
                  ),
                  Text(
                    pokemon.name,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text("Height: ${pokemon.height}"),
                  Text("Weight: ${pokemon.weight}"),
                  Text(
                    "Types:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.type
                        .map((t) => FilterChip(
                              label: Text(t),
                              onSelected: (b) {},
                              backgroundColor: Colors.amber,
                            ))
                        .toList(),
                  ),
                  Text(
                    "Weakness:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.weaknesses
                        .map((w) => FilterChip(
                              label: Text(
                                w,
                                style: TextStyle(color: Colors.white),
                              ),
                              onSelected: (b) {},
                              backgroundColor: Colors.red,
                            ))
                        .toList(),
                  ),
                  Text(
                    "Next Evolution:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.nextEvolution == null
                        ? [Text("This is the final form")]
                        : pokemon.nextEvolution
                            .map((n) => FilterChip(
                                  label: Text(
                                    n.name,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onSelected: (b) {},
                                  backgroundColor: Colors.green,
                                ))
                            .toList(),
                  ),
                  Text(
                    "Previous Evolution:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.prevEvolution == null
                        ? [Text("This is the first form")]
                        : pokemon.prevEvolution
                            .map((n) => FilterChip(
                                label: Text(
                                  n.name,
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.green,
                                onSelected: (b) {}))
                            .toList(),
                  ),
                ],
              ),
            ),
          ),
          Align(
              alignment: Alignment.topCenter,
              child: Hero(
                tag: pokemon.id,
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(pokemon.img), fit: BoxFit.cover)),
                ),
              ))
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        elevation: 0,
        title: Text(pokemon.name),
        backgroundColor: Colors.cyan,
      ),
      body: bodyWidget(context),
    );
  }
}
