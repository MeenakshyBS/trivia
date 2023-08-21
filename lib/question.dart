//by convention classes start with caps
class Question{
  //By using the late keyword, you're telling Dart that you'll initialize these variables before they are used, effectively making them non-nullable. This should help prevent the error you're encountering.
  late String questionText;
  late bool questionAnswer;
  //the below thing with the name of the class
  //is called a constructor for obj ig
  Question({required this.questionText, required this.questionAnswer});
}
