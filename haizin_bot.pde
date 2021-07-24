import org.atilika.kuromoji.Token;
import org.atilika.kuromoji.Tokenizer;
import java.util.*;

String tw = "";
Button button11, button21, button22, button23, button_back2, button31;//
RectText recttext11, recttext12, recttext13;
PFont font;
int scene=-1;
String bun = "逃げちゃダメだ。逃げちゃダメだ。逃げちゃダメだ。逃げちゃダメだ。逃げちゃダメだ！……やります、僕が乗ります。知らない天井だ。目標をセンターに入れてスイッチ、目標をセンターに入れてスイッチ。どいてくれる？。いいえ、あなたは死なないわ……。私が守るもの。笑えばいいと思うよ。あんた、バカぁ？。そうやって嫌なことから逃げ出して、ずっと生きていくつもり？。理由はないわ、その運命があなただったってだけ。自分の子供を信じてください。私も初号機パイロットを信じます。大人はさ、ズルイくらいがちょうどいいんだ。この世界はあなたの知らない面白いことで満ち満ちているわよ。たのしみなさい。また逃げ出すのか？自分の願望はあらゆる犠牲を払い、自分の力で実現させるものだ。他人から与えられるものではない。モード反転、裏コード……ザ・ビースト！碇君が、もう、EVAに乗らなくていいようにする！だから！。だけど、まぁ……そうやっていじけていたって、なんにも楽しいことないよ。父さん。僕は、エヴァンゲリオン初号機パイロット、碇シンジです！！。行きなさいシンジ君！誰かのためじゃない！あなた自身の願いのために！！。だからこそ現状を変えて後顧の憂いを断つ。反復練習さ。同じことをなんども繰り返す。自分がいいなって感じられるまでね。それしかない。君となら、だよ。知るか！あんたはどうしたいの！？。君のせいじゃない。時が来たね。この世界の理を越えた、新たな生命の誕生。代償として古の生命は滅びる……。さぁ約束の時だ、碇シンジ君。今度こそ君だけは、幸せにしてみせるよ。全てが太古よりプログラムされていた絶滅行動だ。NERVでは人類補完計画と呼んでいたよ。三十一手先で君の詰みだ。始まりと終わりは同じというわけか……さすがリリンの王、シンジくんの父上だ……。縁が君を導くだろう。そんな顔をしないでまた会えるよ、シンジ君。";
String text1 = "";
String text2 = "";
String text3 = "";
int count =0;
int tweetcounter;
PImage rogo, blue, zako, hasuta;

void setup() {
  rogo = loadImage( "rogo.png" );
  blue = loadImage( "blue.png" );
  zako = loadImage( "zako.png" );
  hasuta = loadImage( "hasuta.png" );
  tweetcounter = load_tweetcounter();
  size(900, 900);
  rectMode(CENTER);
  colorMode(HSB, 360, 100, 100);
  textAlign(CENTER, CENTER);
  font = createFont("", 32);
  textFont(font);
  button11=new Button(width/2, height*4/5, 200, 100, color(190, 60, 90), "錬成");
  button31=new Button(width/2, height/2, 200, 100, color(190, 60, 90), "tweet");
  button_back2=new Button(25, 25, 40, 40, color(190, 60, 90), "←");
  text1 = meigen();
  text2 = maruko(tyomo());
  text3 = maruko(bun);
  button21=new Button(width/2, height*1/6, width-100.0, 250, color(190, 60, 90), "");
  button22=new Button(width/2, height*3/6, width-100.0, 250, color(190, 60, 90), "");
  button23=new Button(width/2, height*5/6, width-100.0, 250, color(190, 60, 90), "");
}

void draw() {
  background(0, 0, 100);
  fill(0, 0, 0);
  count--;
  switch(scene) {
  case -1:
    image( blue, (width-blue.width)/2, (height-blue.height)/2 );
    image( rogo, (width-rogo.width)/2, (height-rogo.height)/2);
    if (mousePressed) {
      scene=0;
    }
    break;
  case 0:
    if (tweetcounter<=100) {
      image( zako, (width-zako.width)/2, (height-zako.height)/2 );
    } else {
      background(0, 0, 50);
      image( hasuta, (width-hasuta.width)/2, (height-hasuta.height)/2 );
    }
    text("LV." + tweetcounter, width/2, height*1/15);
    button11.run();

    if (button11.isPush()) {
      text1 = meigen();
      text2 = maruko(tyomo());
      text3 = maruko(bun);
      recttext11=new RectText(text1);
      recttext12=new RectText(text2);
      recttext13=new RectText(text3);
      recttext11.setup(200, 50, 10, 120);
      recttext12.setup(200, 50, 10, 120);
      recttext13.setup(200, 50, 10, 120);
      scene=1;
    }
    break;
  case 1:
    button21.run();

    if (button21.isPush()) {
      scene=2;
      tw = text1;
    }
    recttext11.update(width-100.0);
    recttext11.draw(width*1/2, height*1/6);

    button22.run();

    if (button22.isPush()) {
      scene=2;
      tw = text2;
    }
    recttext12.update(width-100.0);
    recttext12.draw(width/2, height*3/6);

    button23.run();

    if (button23.isPush()) {
      scene=2;
      tw = text3;
    }
    recttext13.update(width-100.0);
    recttext13.draw(width/2, height*5/6);

    button_back2.run();

    if (button_back2.isPush()) {
      scene=0;
    }

    break;
  case 2:
    button31.run();
    if (button31.isPush()) {
      String t = ("https://twitter.com/intent/tweet?text="+tw);
      link(t);
      tweetcounter++;
      store_tweetcounter(tweetcounter);
    }
    break;
  }
}

/*void mousePressed(){
 switch(scene){
 case 0:
 if (mouseX>width/2-200&&mouseX<width/2+200) {
 if (mouseY>height/2-100&&mouseY<height/2+100) {
 scene=1;
 }
 }
 break;
 
 }
 
 }*/
