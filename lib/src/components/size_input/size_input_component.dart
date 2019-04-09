import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

@Component(
    selector: 'size-input',
    templateUrl: 'size_input_component.html',
    styleUrls: ['size_input_component.css'],
    directives: [
      MaterialInputComponent,
      MaterialButtonComponent,
    ]
)

class SizeInputComponent {
  int newTodo = 2;
  final sizeChangedController = new StreamController<int>();
  @Output()
  Stream<int> get sizeChanged => sizeChangedController.stream;

  void changeSize()  {
    sizeChangedController.add(newTodo);
  }

}