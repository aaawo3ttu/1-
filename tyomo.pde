String tyomo() {
  JSONArray values;
  JSONObject tweet;
  JSONObject abc;
  String full_text;
  String result;
  boolean h = false;
  StringBuilder sb = new StringBuilder();
  values = loadJSONArray("tweet.json");
  for (int i = 0; i < values.size(); i++) {
    tweet = values.getJSONObject(i);
    abc = tweet.getJSONObject("tweet");
    full_text = abc.getString("full_text") + "。";
    full_text = full_text.replaceAll(" ", "");
    full_text = full_text.replaceAll(";", "");
    full_text = full_text.replaceAll("\n", "");
    for (int g = 0; g < full_text.length(); g++) {
      String substring = full_text.substring(g, g+1);
      if (substring.equals("h") ||substring.equals("@") || substring.equals("")) {
        h = true;
        break;
      }
    }
    if (h) {
      h = false;
      continue;
    }
    sb.append(full_text);
  }
  result = sb.toString();
  return result;
}
