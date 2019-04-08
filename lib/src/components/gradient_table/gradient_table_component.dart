

import 'package:angular/angular.dart';

import '../../models/color.dart';
import '../../services/gradient_table_service.dart';


@Component(
  selector: 'gradient-table',
  styleUrls: ['gradient_table_component.css'],
  templateUrl: 'gradient_table_component.html',
  directives: [
    NgFor
  ],
  providers: [
    ClassProvider(GradientTableService)
  ],
)
class GradientTableComponent implements OnInit {
  
  final GradientTableService gradientTableService;
  List<String> headLetters;
  List<List<Color>> gradientCells;
  int size;
 

  GradientTableComponent(this.gradientTableService);

  
  
  @override
  void ngOnInit()  {
    this.size = 100;
    this.headLetters = this.gradientTableService.getHeadLetters(this.size);
    this.gradientCells = this.gradientTableService.getGradientCells(this.size);
   }

  // void add() {
  //   items.add(newTodo);
  //   newTodo = '';
  // }

  // String remove(int index) => items.removeAt(index);
}
