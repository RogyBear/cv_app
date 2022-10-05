import '../constants.dart';

const Map<String, dynamic> educationQuestions = {
  'id': "2",
  'title': "Освіта",
  'key': education,
  'palette': {
    'primary': yellowGradient,
    'secondary': yellowSecondary,
    'tertiary': yellowTertiary
  },
  'lineColor': yellowLines,
  'icon': "",
  'questions': [
    {
      'id': "test1",
      "type": "select",
      'question': [
        'Університет',
        'Коледж',
        'Училище',
        'Школа',
        'Курси',
        'Інше'
      ],
    },
    {
      'id': "test2",
      "type": "basic",
      'question': "Вкажіть ваш номер телефону",
      'help':
          "Тут тобі потрібно ввести номер мобільного телефону, щоб роботодавець міг з тобою зв’язатися.",
    },
    {
      'id': "test3",
      "type": "basic",
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
