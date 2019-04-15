

import 'package:angular/core.dart';

import '../models/color.dart';

@Injectable()
class GradientTableService  {

    List<String> getHeadLetters (int size) {
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

  List<List<Color>> getGradientCells (int size) {
     List<List<Color>> gradientCells = List();
     Color startColor = Color(255,255,255);
     Color endColor = Color(255,0,0);
     for (int i = 0; i < size; i++) {
       gradientCells.add(List());
       for (int j = 0; j < size; j++) {
           Color cellColor;
           if (i == 0 && j == 0) {
             cellColor = startColor;
           } else if (i == size -1 && j == size - 1)  {
             cellColor = endColor;
           } else {
             double cellColorValue = (1 - (((i + j) / 2) / size)) * startColor.green;
             cellColor = Color(255, cellColorValue, cellColorValue); 
           }     
           gradientCells[i].add(cellColor);
       }
     }
     return gradientCells; 
  }
} 


