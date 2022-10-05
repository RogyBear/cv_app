import '../constants.dart';

const Map<String, dynamic> workQuestions = {
  'id': "3",
  'title': "Досвід роботи",
  'key': work,
  'palette': {
    'primary': greenGradient,
    'secondary': greenSecondary,
    'tertiary': greenTertiary
  },
  'lineColor': greenLines,
  'icon': "",
  'questions': [
    {
      'id': "1",
      'type': 'basic',
      'question': "Вкажіть посаду, на якій ви працювали",
    },
    {
      'id': "2",
      'type': 'basic',
      'question': "Вкажіть назву компанії або роботодавця",
      'help':
          "Тут тобі потрібно ввести номер мобільного телефону, щоб роботодавець міг з тобою зв’язатися.",
    },
    {
      'id': "test3",
      'type': 'dropdown',
      'question': "Коли ви почали там працювати?",
    },
    {
      'id': "test4",
      'type': 'dropdown',
      'question': "Коли ви закінчили там працювати?",
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
