class Avengers {
  String title;
  String year;
  String rated;
  String released;
  String runtime;
  String genre;
  String director;
  String writer;
  String actors;
  String plot;
  String language;
  String country;
  String awards;
  String poster;
  String source1;
  String value1;
  String source2;
  String value2;
  String source3;
  String value3;
  String metascore;
  String imdbRating;
  String imdbVotes;
  String imdbID;
  String type;
  String dVD;
  String boxOffice;
  String production;
  String website;
  String response;

  Avengers(
      {this.title,
      this.year,
      this.rated,
      this.released,
      this.runtime,
      this.genre,
      this.director,
      this.writer,
      this.actors,
      this.plot,
      this.language,
      this.country,
      this.awards,
      this.poster,
      this.source1,
      this.value1,
      this.source2,
      this.value2,
      this.source3,
      this.value3,
      this.metascore,
      this.imdbRating,
      this.imdbVotes,
      this.imdbID,
      this.type,
      this.dVD,
      this.boxOffice,
      this.production,
      this.website,
      this.response});

  Avengers.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    year = json['Year'];
    rated = json['Rated'];
    released = json['Released'];
    runtime = json['Runtime'];
    genre = json['Genre'];
    director = json['Director'];
    writer = json['Writer'];
    actors = json['Actors'];
    plot = json['Plot'];
    language = json['Language'];
    country = json['Country'];
    awards = json['Awards'];
    poster = json['Poster'];
    source1 = json['Source1'];
    value1 = json['Value1'];
    source2 = json['Source2'];
    value2 = json['Value2'];
    source3 = json['Source3'];
    value3 = json['Value3'];
    metascore = json['Metascore'];
    imdbRating = json['imdbRating'];
    imdbVotes = json['imdbVotes'];
    imdbID = json['imdbID'];
    type = json['Type'];
    dVD = json['DVD'];
    boxOffice = json['BoxOffice'];
    production = json['Production'];
    website = json['Website'];
    response = json['Response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Title'] = title;
    data['Year'] = year;
    data['Rated'] = rated;
    data['Released'] = released;
    data['Runtime'] = runtime;
    data['Genre'] = genre;
    data['Director'] = director;
    data['Writer'] = writer;
    data['Actors'] = actors;
    data['Plot'] = plot;
    data['Language'] = language;
    data['Country'] = country;
    data['Awards'] = awards;
    data['Poster'] = poster;
    data['Source1'] = source1;
    data['Value1'] = value1;
    data['Source2'] = source2;
    data['Value2'] = value2;
    data['Source3'] = source3;
    data['Value3'] = value3;
    data['Metascore'] = metascore;
    data['imdbRating'] = imdbRating;
    data['imdbVotes'] = imdbVotes;
    data['imdbID'] = imdbID;
    data['Type'] = type;
    data['DVD'] = dVD;
    data['BoxOffice'] = boxOffice;
    data['Production'] = production;
    data['Website'] = website;
    data['Response'] = response;
    return data;
  }
}
