

import 'package:angular/angular.dart';

import '../size_input/size_input_component.dart';
import '../../models/color.dart';
import '../../services/gradient_table_service.dart';


@Component(
  selector: 'gradient-table',
  styleUrls: ['gradient_table_component.css'],
  templateUrl: 'gradient_table_component.html',
  directives: [
    NgFor,
    NgIf,
    SizeInputComponent
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
    size = 10;
    generateTable();   
   }

   void onSizeChanged (int _size) {
     size = _size;
     generateTable();
   }

   void generateTable () {
    headLetters = this.gradientTableService.getHeadLetters(size);
    gradientCells = this.gradientTableService.getGradientCells(size);
   }

}
