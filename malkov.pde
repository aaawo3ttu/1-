
String maruko(String str) {
  int a = 0;
  int b = 0;
  String [] text = {"", "", "", ""};
  HashMap<String, ArrayList<String>> bowMap = new HashMap<String, ArrayList<String>>(); // Bag of words分析用のマップ
  ArrayList<String> noun2 = new ArrayList<String>();
  String subtext = "";
  String [] noun = {"", "", ""};
  StringBuilder sb = new StringBuilder();
  Tokenizer tokenizer = Tokenizer.builder().build();
  List<Token> tokens = tokenizer.tokenize(str);
  for (Token token : tokens) {

    text[3] = text[2];
    text[2] = text[1];
    text[1] = text[0];
    text[0] = token.getSurfaceForm();
    String pos = token.getAllFeaturesArray()[0];
    if (pos.equals("名詞") || b >= 1) {
      noun[2] = noun[1];
      noun[1] = noun[0];
      noun[0] = token.getSurfaceForm();
      b++;
      if (b==3) {
        noun2.add(noun[2] + " " + noun[1] + " " + noun[0] + " ");  
        b=0;
      }
    }

    subtext = text[3] + " " + text[2] + " " + text[1] + " "; 
    if (bowMap.containsKey(subtext)) {
      bowMap.get(subtext).add(text[0]+" ");
    } else {
      ArrayList<String> maintext = new ArrayList<String>();

      maintext.add(text[0]+ " ");
      bowMap.put(subtext, maintext);
    }
  }

  ArrayList<String> result = new ArrayList<String>();
  String maruko_key = noun2.get(floor(random(noun2.size())));
  String maruko_value = bowMap.get(maruko_key).get(floor(random(bowMap.get(maruko_key).size())));
  result.add(maruko_key);
  for (int i = 0; i < 300; i++) {
    result.add(maruko_value);
    for (int j = 0; j < 300; j++) {
      String substring = maruko_key.substring(j, j+1);
      if (substring.equals(" ")) {
        a  = j;
        break;
      }
    }
    maruko_key = maruko_key.substring(a+1) + maruko_value;
    if (bowMap.get(maruko_key).get(floor(random(bowMap.get(maruko_key).size())))==null) {
      sb.setLength(0);
    } else {
      maruko_value = bowMap.get(maruko_key).get(floor(random(bowMap.get(maruko_key).size())));
    }
    if (maruko_value.equals("。 ")) {
      break;
    }
  }
  for (String strnn : result) {
    sb.append(strnn);
  }
  String re = sb.toString();
  re = re.replaceAll(" ", "");
  return re;
}
