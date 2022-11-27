import 'package:quizzler_app/question.dart';

class QuizBrain {

  int _numberOfQuestion = 0;

  List<Question> _questions = [
    Question(
        questionText: 'Вы можете вести корову вниз по лестнице, но не вверх по лестнице',
        questionAnswer: false),
    Question(
        questionText: 'Приблизительно четверть человеческих костей находится в ногах',
        questionAnswer: true),
    Question(
        questionText: 'Кровь слизней зеленая',
        questionAnswer: true),
    Question(
        questionText: 'У некоторых кошек на самом деле алергия на людей',
        questionAnswer: true),
    Question(
        questionText: 'Девичья фамилия Базза Олдрина была "Луна"',
        questionAnswer: true),
    Question(
        questionText: 'В Португалии запрещено мочиться в океан',
        questionAnswer: true),
    Question(
        questionText: 'Ни один квадратный лист сухой бумаги нельзя сложить пополам более 7 раз.',
        questionAnswer: false),
    Question(
        questionText: 'В Лондоне, Великобритания, если вам случится умереть в здании парламента, вы технически имеете право на государственные похороны, потому что здание считается слишком священным.',
        questionAnswer: true),
    Question(
        questionText: 'Самый громкий звук, издаваемый любым животным, составляет 188 децибел. Это животное — африканский слон',
        questionAnswer: false),
    Question(
        questionText: 'Общая площадь поверхности двух легких человека составляет примерно 70 квадратных метров',
        questionAnswer: true),
    Question(
        questionText: 'Первоначально Google назывался Backrub',
        questionAnswer: true),
    Question(
        questionText: 'Шоколад влияет на сердце и нервную систему собаки; нескольких унций достаточно, чтобы убить маленькую собаку.',
        questionAnswer: true),
    Question(
        questionText: 'В Западной Вирджинии, США, если вы случайно сбили своей машиной животное, вы можете взять его домой и съесть.',
        questionAnswer: true),
  ];

  String getQuestion() => _questions[_numberOfQuestion].questionText;
  bool getAnswer() => _questions[_numberOfQuestion].questionAnswer;

  void nextQuestionNumber() {
    if (_numberOfQuestion < _questions.length - 1) {
      _numberOfQuestion++;
    }
  }

  bool isFinished() => _numberOfQuestion >= _questions.length - 1;
  void reset() => _numberOfQuestion = 0;
}