class Game {
  int id;
  String name;
  List<String> genre;
  List<String> gameMode;
  String description;
  String webpage;
  double ranking;
  String icon;

  Game(this.id, this.name, this.genre, this.gameMode, this.description,
      this.webpage, this.ranking, this.icon);

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
        json['id'],
        json['name'],
        List<String>.from(json['genre']),
        List<String>.from(json['game mode']),
        json['description'],
        json['webpage'],
        json['ranking'].toDouble(),
        json['icon']);
  }
}
