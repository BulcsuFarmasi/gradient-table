class Color {
  int red;
  int green;
  int blue;

  Color(this.red, this.green, this.blue);

  @override
  String toString() {
     return 'rgb(${red}, ${green}, ${blue})'; 
  }
}