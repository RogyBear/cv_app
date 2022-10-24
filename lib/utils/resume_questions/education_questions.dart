import '../constants.dart';

const Map<String, dynamic> educationQuestions = {
  'id': "2",
  'title': "Освіта",
  'key': education,
  'palette': {
    'primary': yellowGradient,
    'secondary': yellowSecondary,
    'tertiary': yellowTertiary,
    "quarternary": greenGradient
  },
  'lineColor': yellowLines,
  'icon': "",
  'questions': [
    {
      'id': "test1",
      "type": "select",
      "title": "Оберіть освіту, про яку б ви хотіли написати",
      "subtitle": "Тут ви можете обрати декілька варіантів",
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
      "type": "custom",
      "title": "Вкажіть університет, в якому ви навчались",
      "questions": [
        {
          "type": "basic",
          "question": "Назва університету",
          "placeholder": "Наприклад, Національний університет ім. Т. Г. Шевченка"
        },
        {
          "type": "date",
          "question": "Коли ви почали навчання?"
        },
        {
          "type": "date",
          "question": "Коли ви почали навчання?",
          "checkbox": "Ще навчаюсь"
        },
        {
          "type": "checkbox",
          "question": "Науковий ступінь",
          "options": [
            "Магістр",
            "Бакалавр"
          ]
        },
        {
          "type": "basic",
          "question": "Спеціальність",
          "placeholder": "Наприклад, вчитель української мови та літератури"
        }
      ],
      'help': "Тут тобі потрібно ввести номер мобільного телефону, щоб роботодавець міг з тобою зв’язатися.",
    },
    {
      'id': "test3",
      "type": "custom",
      "title": "Вкажіть університет, в якому ви навчались",
      "questions": [
        {
          "type": "basic",
          "question": "Назва курсу",
          "placeholder": "Наприклад, Освітні інструменти критичного мислення"
        },
        {
          "type": "date",
          "question": "Коли ви закінчили навчання?",
          "checkbox": "ЩЩе навчаюсь"
        },
        {
          "type": "basic",
          "question": "Що ви вивчали на курсі?",
          "placeholder": "Наприклад, Мотивація учнів до навчання та задоволення їхніх освітніх потреб."
        }
      ],
      'help': "Тут тобі потрібно ввести номер мобільного телефону, щоб роботодавець міг з тобою зв’язатися.",
    }
  ],
};
