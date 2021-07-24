
String meigen() {
  String baseURL;
  String number;
  String meigen;
  baseURL = "https://meigen.doodlenote.net/api/json.php?c="; 
  number = "1";

  JSONArray m = loadJSONArray(baseURL+number); //JSON形式のデータを取得
  meigen = m.getJSONObject(0).getString("meigen");
  return meigen;
}
