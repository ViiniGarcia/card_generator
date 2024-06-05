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

extension StringExtension on String{
  String removeSpecialCaracters() {
    var comAcento = 'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
    var semAcento = 'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz'; 
    String str = this;
    for (int i = 0; i < comAcento.length; i++) {      
      str = str.replaceAll(comAcento[i], semAcento[i]);
    }
    print(str);
    return str;
}
}