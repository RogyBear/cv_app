import '../constants.dart';

const Map<String, dynamic> contentsQuestions = {
  'id': "2",
  'title': "Основна частина",
  'key': contents,
  'palette': {
    'primary': yellowGradient,
    'secondary': yellowSecondary,
    'tertiary': yellowTertiary
  },
  'lineColor': yellowLines,
  'icon': "",
  'progress': 0.7,
  'questions': [
    {
      'id': "1",
      "type": "basic",
      'question': "Привітання",
    },
    {
      'id': "2",
      "type": "basic",
      'question': "Вступ",
      'help':
          "Тут тобі потрібно ввести номер мобільного телефону, щоб роботодавець міг з тобою зв’язатися.",
    },
    {
      'id': "3",
      "type": "basic",
      'question': "Основна частина",
    },
    {
      'id': "4",
      "type": "basic",
      'question': "Заключна частина",
    },
  ],
};
