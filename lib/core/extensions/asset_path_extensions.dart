extension AssetPathExtension on String {
  String get toPNG => 'assets/images/$this.png';
  String get toIcon => 'assets/icons/$this.png';
  String get toJpg => 'assets/images/$this.jpg';
}
