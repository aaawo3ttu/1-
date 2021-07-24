class RectText {
  String t;
  String textModified;
  StringList sl;
  float xPos, yPos;

  float paddingLeft, paddingRight, paddingButtom, paddingTop;

  float th; //text height
  float le; //leading

  int numLines;
  float maxWidth; //max width of text

  RectText(String _t) {
    t = _t;
  }

  void setup(float pT, float pR, float pB, float pL) {
    th = textAscent() + textDescent();
    le = 2.0;
    textLeading(th+le);
    noStroke();

    paddingTop = pT; 
    paddingRight = pR; 
    paddingButtom = pB; 
    paddingLeft = pL;
  }

  void update(float w) {
    maxWidth = calcMaxW(t, w);
    sl = wordWrap(t, maxWidth);
    numLines = sl.size();
    textModified = "";
    for (int i = 0; i < numLines; i++) {
      textModified += (sl.get(i) + "\n");
    }
  }
  float draw(float x, float y) { /*xとyを開始点として文字を書く*/
    xPos = x; 
    yPos = y;
    noFill();
    rect(xPos - paddingRight, yPos - paddingTop, maxWidth + paddingRight + paddingLeft, (th+le)*(numLines+0) + paddingTop + paddingButtom);
    fill(255, 0, 0);
    text(textModified, xPos, yPos);

    return (th+le)*(numLines+0) + paddingButtom + yPos; //Buttom
  }


  StringList wordWrap(String s, float mW) {
    StringList a = new StringList();
    float w = 0;
    int i = 0;
    while (i < s.length()) {
      char c = s.charAt(i);
      String cc = "" + c;
      w += textWidth(cc);
      if (c == '\n') {
        String sub = s.substring(0, i);
        a.append(sub);
        s = s.substring(i + 1, s.length());
        i = 1;
        w = 0;
      } else {
        if (w > mW) {
          String sub = s.substring(0, i);
          a.append(sub);
          s = s.substring(i, s.length());
          i = 0;
          w = 0;
        } else {
          i++;
        }
      }
    }
    a.append(s);
    return a;
  }

  float calcMaxW(String _t, float mW) {
    float f = 0;
    if (textWidth(_t) > mW) f = mW;
    else f = textWidth(_t);
    return f;
  }
}
