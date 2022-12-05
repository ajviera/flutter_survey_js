import 'package:flutter/material.dart';
import 'package:flutter_survey_js/survey.dart' as s;
import 'package:reactive_image_picker/reactive_image_picker.dart';

import 'question_title.dart';
import 'survey_element_factory.dart';

final SurveyElementBuilder imagePickerBuilder =
    (context, element, {bool hasTitle = true}) {
  return ImagePickerElement(
    formControlName: element.name!,
    element: element as s.ImagePicker,
  ).wrapQuestionTitle(element, hasTitle: hasTitle);
};

class ImagePickerElement extends StatelessWidget {
  final String formControlName;
  final s.ImagePicker element;
  const ImagePickerElement({
    Key? key,
    required this.formControlName,
    required this.element,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReactiveImagePicker(
      formControlName: formControlName,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.zero,
        labelText: 'Image',
        filled: false,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        helperText: '',
      ),
      inputBuilder: (onPressed) => TextButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.add),
        label: const Text('Add an image'),
      ),
    );
  }
}
