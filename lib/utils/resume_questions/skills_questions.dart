import '../constants.dart';

const Map<String, dynamic> skillsQuestions = {
  'id': "2",
  'title': "Навички",
  'key': skills,
  'palette': {
    'primary': blueGradient,
    'secondary': blueSecondary,
    'tertiary': blueTertiary,
    'quarternary': yellowGradient
  },
  'lineColor': blueLines,
  'icon': "",
  'progress': 0.7,
  'questions': [
    {
      'id': "test1",
      "type": "multipleInputs",
      'question': "Опишіть 5-7 своїх соціальних навичок",
      'placeholder': "Наприклад, Здобув І місце у конкурсі  власної поезії",
      'addText': "Добавити досягнення"
    },
    {
      'id': "test2",
      'question': "Вкажіть ваш номер телефону",
      'help':
          "Тут тобі потрібно ввести номер мобільного телефону, щоб роботодавець міг з тобою зв’язатися.",
    },
    {
      'id': "test3",
      'question': "Вкажіть ваш e-mail",
    },
    {
      'id': "test4",
      'question': "Оберіть мови, якими ви володієте",
    },
    {
      'id': "test5",
      'question': "Додайте своє фото",
    },
    {
      'id': "test6",
      'question': "Вкажіть посаду, на яку ви претендуєте",
    },
    {
      'id': "test7",
      'question': "Давайте перевіримо ваші відповіді",
      'confirmation': true,
    },
  ],
};
