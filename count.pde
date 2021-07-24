void store_tweetcounter(int tweetcounter) {
  String lines [] = new String[1];
  // str(整数) は整数を表す文字列を返す
  lines[0] = str(tweetcounter);
  saveStrings("log.txt", lines);
}

int load_tweetcounter() {
  String lines[];
  lines = loadStrings("log.txt");
  if (lines == null) { // data.txt というファイルが読めなかった時
    return 0;
  } else {
    return int(lines[0]);
  }
}
