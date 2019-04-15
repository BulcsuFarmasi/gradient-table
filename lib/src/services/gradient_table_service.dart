

import 'package:angular/core.dart';

import '../models/color.dart';

@Injectable()
class GradientTableService  {

    int size;

    void setSize (int _size) {
      size = _size;
    }

    List<String> getHeadLetters () {
      List<String> headLetters = []; 
      for (int i = 0; i < size; i++) {
        headLetters.add(this.getLetterFromNumber(i));
      }
      return headLetters;
    }

  String getLetterFromNumber(int number) {
    final int alphabetLength = 26; 
    double letterNumber = number / alphabetLength;

    String letter = ''; 
    
    if (letterNumber > 1) {
        letter += String.fromCharCode(letterNumber.floor() - 1 + 65);
    }

    double fraction = letterNumber - letterNumber.floor();

    int fractionLetterCode = (fraction * 26).round();

    letter += String.fromCharCode(65 + fractionLetterCode);

    return letter;
  }

  List<List<Color>> getGradientCells () {
     List<List<Color>> gradientCells = List();
     
     for (int i = 0; i < size; i++) {
       gradientCells.add(List());
       for (int j = 0; j < size; j++) {
           Color color = _getColor(j, i);        
           gradientCells[i].add(color);
       }
     }
     return gradientCells; 
  }

  Color _getColor (int x, int y) {
      Color startColor = Color(255,255,255);
      Color endColor = Color(255,0,0);
      Color color;
           if (_isFirst(x, y)) {
             color = startColor;
           } else if (_isLast(x, y))  {
             color = endColor;
           } else {
             double average = (x + y) / 2;
             double percent = average / size;
             double reversePercent = 1 - percent;
             double colorValue = reversePercent * startColor.green;
             color = Color(255, colorValue, colorValue); 
           }
      return color;          
  }

   bool _isFirst (int x, int y ) {
     return x == 0 && y == 0;
   }

   bool _isLast (int x, int y) {
     return x == size -1 && y == size -1;
   }

} 


