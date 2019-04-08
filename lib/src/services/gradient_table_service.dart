

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
     List<List<Color>> gradientCells = new List();
     for (int i = 0; i < size; i++) {
       gradientCells.add(new List());
       for (int j = 0; j < size; j++) {
         gradientCells[i].add(new Color(255,0,0));
       }
     }
     return gradientCells; 
  }
} 


