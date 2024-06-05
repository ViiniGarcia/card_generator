class BadgeEJC{
  String name;
  String nickname;
  String squad;

  BadgeEJC({required this.name, required this.nickname, required this.squad});

  @override
  bool operator ==(Object other) {
    return other is BadgeEJC && other.hashCode == hashCode;
  }

  @override
  int get hashCode => Object.hash(name, nickname, squad);
}

enum TypeBadge {encontrista, encontreiro}