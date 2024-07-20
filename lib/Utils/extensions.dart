extension ListExtension on List {
  String nameCaptalize() {
    String str = "";
    int index = 0;
    for(String word in this){
      print(word);
      str += index > 0 ? " " : "";
      str += word.length > 4 ? "${word[0].toUpperCase()}${word.substring(1).toUpperCase()}" : word.toUpperCase();
      index++;
    }
    return str;
  }
}

extension ListAbbreviationExtension on String {
  String nameAbbreviation(){
    var str = trimRight().split(' ');
    if (str.length > 4) {
      for (var index = 2;  index < str.length; index++) {
        if (str[index].length > 2) {
          str[index] = '${str[index][0]}.';
          break;
        }
      }
    }
    var name = '';
    for(var str2 in str){
      name += '$str2 ';
    }
    return name.trimRight();
  }
}

extension StringExtension on String{
  String removeSpecialCaracters() {
    var comAcento = 'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
    var semAcento = 'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz'; 
    String str = this;
    for (int i = 0; i < comAcento.length; i++) {      
      str = str.replaceAll(comAcento[i], semAcento[i]);
    }
    return str;
  }
}