# flutter_survey_js

Flutter package for parsing and display [surveyjs](https://surveyjs.io/) widgets

All these widgets and highly depend on [reactive_forms](https://pub.dev/packages/reactive_forms)

Live preview [https://goxiaoy.github.io/flutter_survey_js/](https://goxiaoy.github.io/flutter_survey_js/)

# IMPORTANT_NOTE
# This package has not fully tested, use at your own risk


Supported widgets:
- [x] matrixdropdown
- [x] matrixdynamic
- [x] matrix
- [ ] expression
- [x] checkbox
- [x] ranking
- [x] radiogroup
- [x] imagepicker
- [x] dropdown
- [x] text
- [x] multipletext
- [x] html
- [x] image
- [x] comment
- [x] file
- [x] rating
- [x] boolean
- [x] signaturepad
- [x] paneldynamic
- [x] panel

Supported validator:
- [x] numericvalidator
- [x] textvalidator
- [ ] answercountvalidator
- [x] regexvalidator
- [x] emailvalidator
- [ ] expressionvalidator

## Getting Started

```dart
import 'package:flutter_survey_js/survey.dart' as s;
...
const survey = {
  "questions": [
    {
      "type": "rating",
      "name": "satisfaction",
      "title": "How satisfied are you with the Product?",
      "mininumRateDescription": "Not Satisfied",
      "maximumRateDescription": "Completely satisfied"
    }
  ]
};
...
s.SurveyWidget(
  survey: s.Survey.fromJson(survey),
  onChange: (v) {
    print(v);
  },
  onSubmit: (v) {
    print(v);
  },
)


```

