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
      "type": "select",
      "title": "Оберіть місця, де ви працювали",
      "subtitle": "Тут ви можете обрати декілька варіантів",
      'question': [
        'Робота',
        'Волонтерство',
        'Стажування'
      ],
    },
    {
      'id': "2",
      'type': 'custom',
      "title": "Вкажіть ким ви працювали",
      "questions": [
        {
          "type": "basic",
          "question": "Назва роботи, посада",
          "placeholder": "Наприклад, вчитель української мови та літератури"
        },
        {
          "type": "basic",
          "question": "Назва компанії, роботодавця",
          "placeholder": "Наприклад, Київська загальноосвітня школа №23"
        },
        {
          "type": "date",
          "question": "Коли ви почали там працювати?"
        },
        {
          "type": "date",
          "question": "Коли ви закінчили там працювати?",
          "checkbox": "Ще працюю"
        },
        {
          "type": "basic",
          "question": "Обов’язки, досягнення",
          "placeholder": "Наприклад, навчав дітей української мови та літератури"
        }
      ],
      'help': "Тут тобі потрібно ввести номер мобільного телефону, щоб роботодавець міг з тобою зв’язатися.",
    },
  ],
};
