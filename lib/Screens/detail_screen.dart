import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/model/movie_model.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Future<List<Avengers>> readJsonData() async {
    final jsondata = await rootBundle.loadString('jsonfile/movie.json');
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => Avengers.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: readJsonData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var allmov = snapshot.data as List<Avengers>;
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                          ),
                        ),
                        ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                            colors: [Color(0xFF17082A), Colors.black12],
                            begin: Alignment.bottomCenter,
                            end: Alignment.center,
                          ).createShader(bounds),
                          blendMode: BlendMode.darken,
                          child: Positioned(
                            bottom: MediaQuery.of(context).size.height * .60,
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                      allmov[index].poster.toString(),
                                    ),
                                    fit: BoxFit.fill,
                                    colorFilter: const ColorFilter.mode(
                                        Colors.black12, BlendMode.darken)),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            height: MediaQuery.of(context).size.height * .40,
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                                color: Color(0xFF17082A),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                          ),
                        ),
                      ],
                    );
                  });
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
