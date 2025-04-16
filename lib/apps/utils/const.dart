const linkAssets = 'assets/images/weathers/';

class MyKey {
  static const String apiKey = 'd744f7c2cf612456d2b411ac79db31e4';
}

class AssesCustom {
  static String getLinkImage(String name) =>
      '$linkAssets${name.replaceAll(' ', '').toLowerCase()}.png';
}
