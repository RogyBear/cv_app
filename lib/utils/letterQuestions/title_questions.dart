import '../constants.dart';

const Map<String, dynamic> titleQuestions = {
  'id': "2",
  'title': "Заголовок",
  'key': title,
  'palette': {
    'primary': blueGradient,
    'secondary': blueSecondary,
    'tertiary': blueTertiary
  },
  'lineColor': blueLines,
  'icon': "",
  'questions': [
    {
      'id': "1",
      "type": "basic",
      'question': "Вкажіть ваше ім'я та прізвище",
    },
    {
      'id': "2",
      "type": "basic",
      'question': "Вкажіть ваш номер телефону",
      'help':
          "Тут тобі потрібно ввести номер мобільного телефону, щоб роботодавець міг з тобою зв’язатися.",
    },
    {
      'id': "3",
      "type": "basic",
      'question': "Вкажіть ваш e-mail",
    },
    {
      'id': "4",
      "type": "basic",
      'question': "Вкажіть посаду, на яку ви претендуєте",
    },
  ],
};
