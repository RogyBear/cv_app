import 'package:flutter/material.dart';

import '../constants.dart';

const Map<String, dynamic> basicQuestions = {
  "id": "1",
  "key": basicInfo,
  "title": "Базова інформація",
  "palette": {
    "primary": [Color(0xFF65ADEE), Color(0xFF3599F3)],
    "secondary": Color(0xFFEBF5FF),
    "tertiary": Color(0xFFDBECFE)
  },
  "icon": "",
  "questions": [
    {
      "id": 0,
      "type": "basic",
      "section": "",
      "question": "This is question one",
    },
    {
      'id': 1,
      'type': "basic",
      'question': "Question 2",
      'help':
          "Тут тобі потрібно ввести номер мобільного телефону, щоб роботодавець міг з тобою зв’язатися.",
    },
    {
      'id': 2,
      'type': "basic",
      'question': "Вкажіть ваш e-mail",
    },
    {
      'id': 3,
      'type': "basic",
      'question': "Оберіть мови, якими ви володієте",
    },
    {
      'id': 4,
      'type': "basic",
      'question': "Додайте своє фото",
    },
    {
      'id': 5,
      'type': "basic",
      'question': "Вкажіть посаду, на яку ви претендуєте",
    },
    {
      'id': 6,
      'type': "basic",
      'question': "Давайте перевіримо ваші відповіді",
      'confirmation': true,
    },
  ],
};
