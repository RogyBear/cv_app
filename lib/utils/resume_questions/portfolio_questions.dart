import '../constants.dart';

const Map<String, dynamic> portfolioQuestions = {
  'id': "2",
  'title': "Проекти або портфоліо",
  'key': portfolio,
  'palette': {
    'primary': redGradient,
    'secondary': redSecondary,
    'tertiary': redTertiary
  },
  'lineColor': redLines,
  'icon': "",
  'progress': 0.7,
  'questions': [
    {
      'id': "test1",
      "type": "custom",
      'title': "Розкажіть про свій проект",
      'questions': [
        {
          "type": "basic",
          "question": "Назва проекту",
          "placeholder": "Наприклад, Освітній проект «На Урок»"
        },
        {
          "type": "basic",
          "question": "Скільки часу тривав проекту?",
          "placeholder": "Наприклад, 2 місяці"
        },
        {
          "type": "basic",
          "question": "Які ваші обов’язки на проекті?",
          "placeholder": "Наприклад, Організовував/-ла щетижневий семінар для вчителів"
        }
      ]
    },
    {
      'id': "test2",
      'type': "custom",
      'title': "Залиште посилання на своє потрфоліо",
      'questions': [
        {
          "type": "basic",
          "question": "",
          "placeholder": "Наприклад, dribbble.com/marichkanasypana"
        }
      ]
    }
  ],
};
