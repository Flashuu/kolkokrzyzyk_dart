import 'dart:io';
import 'dart:core';

bool wygrany = false;
bool ruchX = true;
int iloscRuch = 0;
List<String> cyfry = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
List<String> mozliweWygrane = ['012', '048', '036', '147', '246', '258', '345', '678'];
void main() {
  plansza();
  nastepnyRuch();
}
//sprawdz kombinacje dla gracza
bool Kombinacja(String combination, String sprDla) {
  //dzieli cyfry w liscie
  List<int> num = combination.split('').map((item) {
    return int.parse(item);
  }).toList();
  bool match = false;
  for (final item in num) {
    if (cyfry[item] == sprDla) {
      match = true;
    } else {
      match = false;
      break;
    }
  }
  return match;
}
//sprawdza kombiinacje do wygrania
void sprWygrana(gracz) {
  for (final item in mozliweWygrane) {
    bool kombLegit = Kombinacja(item, gracz);
    if (kombLegit == true) {
      print('$gracz Wygral!');
      wygrany = true;
      break;
    }
  }
}
//ruch gracza
void nastepnyRuch() {
  //ruch gracza
  print('Wybierz liczbe dla: ${ruchX == true ? "X" : "O"}');
  int numer = int.parse(stdin.readLineSync()!);
  //Zmienia numer w planszy na X lub O
  cyfry[numer - 1] = ruchX ? 'X' : 'O';
  //zmiana gracza
  ruchX = !ruchX;
  //zwieksza liczbe ruchow dopoki nie bedzie wiecej mozliwych
  iloscRuch++;

  if (iloscRuch == 9) {
    wygrany = true;
    print('Remis');
  } else {
    //rysuje plansze z X i O
    plansza();
  }
  //sprawdza wygranego dla X i O
  sprWygrana('X');
  sprWygrana('O');

  //gra dopoki nie ma wygranego
  if (wygrany == false) nastepnyRuch();
}
//plansza 
void plansza() {
  print('   |   |   ');
  print(' ${cyfry[0]} | ${cyfry[1]} | ${cyfry[2]} ');
  print('___|___|___');
  print('   |   |   ');
  print(' ${cyfry[3]} | ${cyfry[4]} | ${cyfry[5]} ');
  print('___|___|___');
  print('   |   |   ');
  print(' ${cyfry[6]} | ${cyfry[7]} | ${cyfry[8]} ');
  print('   |   |   ');
}
