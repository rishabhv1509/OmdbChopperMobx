class ApiDataSerializer {
  String title = '';
  String year = '';
  String rated = '';
  String released = '';
  String director = '';
  String plot = '';
  String poster = '';
  String response = 'false';

  ApiDataSerializer(
      {this.title,
      this.year,
      this.rated,
      this.released,
      this.director,
      this.plot,
      this.poster,
      this.response});
  factory ApiDataSerializer.fromJson(Map<String, dynamic> jsonMap) {
    return ApiDataSerializer(
        title: jsonMap['Title'],
        year: jsonMap['Year'],
        rated: jsonMap['Rated'],
        released: jsonMap['Released'],
        director: jsonMap['Director'],
        plot: jsonMap['Plot'],
        poster: jsonMap['Poster'],
        response: jsonMap['Response']);
  }
}
