class Color {
  double red;
  double green;
  double blue;

  Color(this.red, this.green, this.blue);

  @override
  String toString() {
     return 'rgb(${red.round()}, ${green.round()}, ${blue.round()})'; 
  }
}