import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';

@Component(
    selector: 'size-input',
    templateUrl: 'size_input_component.html',
    styleUrls: ['size_input_component.css'],
    directives: [
      NgIf,
      MaterialInputComponent,
      MaterialButtonComponent,
      formDirectives     
    ]
)

class SizeInputComponent {
  int size;
  bool isValid = false;
  bool isInt = true;
  bool isInRange = true;
  final sizeChangedController = new StreamController<int>();
  @Output()
  Stream<int> get sizeChanged => sizeChangedController.stream;

  void changeSize()  {
    sizeChangedController.add(size);
  }

  void validate () {
        isInt = _isInt();
        if (isInt) {
          isInRange = _isInRange(); 
        } else {
          isInRange = true;
        }
      
        isValid = isInt && isInRange;
  
  }

  bool _isInt () {
    return (size != null);
  }

  bool _isInRange() {
    final int min = 2;
    final int max = 100;

    return size >= min && size <= max;
  }

}