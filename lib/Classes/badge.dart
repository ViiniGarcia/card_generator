class BadgeEJC{
  String name;
  String nickname;
  String squad;

  BadgeEJC({required this.name, required this.nickname, required this.squad});
}

enum TypeBadge {encontrista, encontreiro}

extension ListExtension on List {
  String nameCaptalize() {
    String str = "";
    int index = 0;
    for(String word in this){
      str += index > 0 ? " " : "";
      str += word.length > 2 ? "${word[0].toUpperCase()}${word.substring(1).toLowerCase()}" : word.toLowerCase();
      index++;
    }
    return str;
  }
}