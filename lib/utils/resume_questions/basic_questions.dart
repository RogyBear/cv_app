import '../constants.dart';

const Map<String, dynamic> basicQuestions = {
  "id": "1",
  "key": basicInfo,
  "title": "Базова інформація",
  "palette": {
    "primary": blueGradient,
    "secondary": blueSecondary,
    "tertiary": blueTertiary,
    "quarternary": yellowGradient
  },
  'lineColor': blueLines,
  "icon": "",
  "questions": [
    {
      "id": 0,
      "type": "basic",
      "question": "Вкажіть ваше ім'я та прізвище",
      "placeholder": "Наприклад, Тарас Шевченко"
    },
    {
      'id': 1,
      'type': "basic",
      'question': "Вкажіть ваш номер телефону",
      "placeholder": "Наприклад, +38 (098) 987 76 65",
      'help':
          "Тут тобі потрібно ввести номер мобільного телефону, щоб роботодавець міг з тобою зв’язатися.",
    },
    {
      'id': 2,
      'type': "basic",
      'question': "Вкажіть ваш e-mail",
      "placeholder": "Наприклад, example@gmail.com"
    },
    {
      'id': 3,
      'type': "dropdown",
      "items": ["test1", "test2", "test3"],
      'question': "Оберіть мови, якими ви володієте",
    },
    {
      'id': 4,
      'type': "photo",
      'question': "Додайте своє фото",
    },
    {
      'id': 5,
      'type': "basic",
      'question': "Вкажіть посаду, на яку ви претендуєте",
      'placeholder': "Наприклад, вчитель української мови та літератури..."
    },
    {
      'id': 6,
      'type': "basic",
      'question': "Давайте перевіримо ваші відповіді",
      'confirmation': true,
    },
  ],
};
