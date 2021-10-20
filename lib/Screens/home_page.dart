import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/model/movie_model.dart';

import 'detail_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Avengers>> readJsonData() async {
    final jsondata = await rootBundle.loadString('jsonfile/movie.json');
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => Avengers.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF17082A),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg_cloud.png'),
            ),
          ),
          child: Column(
            children: [
              Container(
                height: 95,
                padding: const EdgeInsets.only(
                    left: 40, right: 40, top: 30, bottom: 12),
                child: TextField(
                  style: const TextStyle(color: Colors.white70, fontSize: 20),
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      borderSide: BorderSide(
                        style: BorderStyle.none,
                        width: 0,
                      ),
                    ),
                    filled: true,
                    fillColor: const Color(0xFF453955),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Image.asset(
                        'assets/search.png',
                        height: 25,
                        width: 25,
                      ),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Image.asset(
                        'assets/cross.png',
                        height: 1,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder(
                future: readJsonData(),
                builder: (context, data) {
                  if (data.hasData) {
                    var allmovie = data.data as List<Avengers>;
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: data == null ? 0 : data.data.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Card(
                                  clipBehavior: Clip.antiAlias,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  elevation: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 10),
                                          child: Container(
                                            height: 25,
                                            width: 80,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF1a072d)
                                                  .withOpacity(0.8),
                                              borderRadius:
                                                  BorderRadius.circular(24),
                                            ),
                                            child: Row(
                                              children: [
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                const Image(
                                                  image: AssetImage(
                                                      "assets/Star.png"),
                                                  height: 15,
                                                  width: 15,
                                                  color: Colors.white,
                                                ),
                                                const SizedBox(width: 5),
                                                Text(
                                                  allmovie[index]
                                                      .value1
                                                      .toString(),
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Ink.image(
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const DetailScreen()));
                                            },
                                          ),
                                          image: NetworkImage(allmovie[index]
                                              .poster
                                              .toString()),
                                          fit: BoxFit.fill,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 220,
                                        ),
                                      ]),
                                    ],
                                  ),
                                ),
                              ),
                              TextButton(
                                child: Text(
                                  allmovie[index].title.toString(),
                                ),
                                style: TextButton.styleFrom(
                                    padding: const EdgeInsets.only(
                                        left: 45, right: 220),
                                    primary: Colors.white,
                                    textStyle: const TextStyle(
                                      fontSize: 25,
                                    )),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const DetailScreen()));
                                },
                              ),
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 45),
                                    child: Image(
                                        height: 18,
                                        width: 18,
                                        image: AssetImage('assets/clock.png')),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    allmovie[index].runtime.toString(),
                                    style: const TextStyle(
                                        color: Color(0xFFF79E44),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          );
                        });
                  } else if (data.hasError) {
                    return Text('${data.error}');
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
