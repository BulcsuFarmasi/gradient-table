

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
class GradientTableComponent {
  
  final GradientTableService gradientTableService;
  List<String> headLetters;
  List<List<Color>> gradientCells;
  int size = 0;
 

  GradientTableComponent(this.gradientTableService);

   void onSizeChanged (int _size) {
     size =_size;
     generateTable();
   }

   void generateTable () {
    this.gradientTableService.setSize(size); 
    headLetters = this.gradientTableService.getHeadLetters();
    gradientCells = this.gradientTableService.getGradientCells();
   }

}
