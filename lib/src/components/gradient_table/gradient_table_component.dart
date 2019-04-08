import 'dart:async';

import 'package:angular/angular.dart';

import '../../services/gradient_table_service.dart';


@Component(
  selector: 'gradient-table',
  styleUrls: ['gradient-table.css'],
  templateUrl: 'gradient-table.html',
  directives: [
   
  ],
  providers: [],
)
class TodoListComponent implements OnInit {
  
  final GradientTableService gradientTableService;
  List<String> headLetters;
 

  TodoListComponent(this.gradientTableService);

  
  
  @override
  void ngOnInit()  {
    this.headLetters = this.gradientTableService.getHeadLetters(100);
    print(this.headLetters); 
  }

  // void add() {
  //   items.add(newTodo);
  //   newTodo = '';
  // }

  // String remove(int index) => items.removeAt(index);
}
