import 'package:flutter/material.dart';
import 'package:flutter_survey_js/survey.dart' as s;
import 'package:flutter_survey_js/ui/reactive/reactive_nested_form.dart';
import 'package:flutter_survey_js/ui/reactive/reactive_nested_group_array.dart';
import 'package:reactive_file_picker/reactive_file_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'question_title.dart';
import 'survey_element_factory.dart';

final SurveyElementBuilder filePickerBuilder =
    (context, element, {bool hasTitle = true}) {
  return FilePickerElement(
    formControlName: element.name!,
    element: element as s.File,
  ).wrapQuestionTitle(element, hasTitle: hasTitle);
};

class FilePickerElement extends StatelessWidget {
  final String formControlName;
  final s.File element;
  const FilePickerElement({
    Key? key,
    required this.formControlName,
    required this.element,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReactiveFilePicker(
      formControlName: formControlName,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.zero,
        labelText: 'File Picker',
        filled: false,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        helperText: '',
      ),
      filePickerBuilder: (pickImage, files, onChange) {
        final List<Widget> items = [
          ...files.files
              .asMap()
              .map(
                (key, value) => MapEntry(
                  key,
                  GestureDetector(
                    onTap: () {
                      onChange(files.copyWith(
                          files: List<String>.from(files.files)
                            ..removeAt(key)) as MultiFile<Never>);
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.delete),
                        FileListItem(value as String).build(context),
                      ],
                    ),
                  ),
                ),
              )
              .values,
          ...files.platformFiles
              .asMap()
              .map(
                (key, value) => MapEntry(
                  key,
                  GestureDetector(
                    onTap: () {
                      onChange(files.copyWith(
                          platformFiles:
                              List<PlatformFile>.from(files.platformFiles)
                                ..removeAt(key)) as MultiFile<Never>);
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.delete),
                        PlatformFileListItem(value).build(context),
                      ],
                    ),
                  ),
                  // InkWell(
                  //   onTap: () => onChange(images.copyWith(
                  //       platformFiles: List<PlatformFile>.from(
                  //           images.platformFiles)
                  //         ..removeAt(key))),
                  //   child: Icon(
                  //     Icons.delete,
                  //     color: Colors.white,
                  //   ),
                  // ),
                ),
              )
              .values,
        ];

        return SizedBox(
          height: 300.0,
          child: Column(
            children: items +
                [
                  ElevatedButton(
                    onPressed: pickImage,
                    child: const Text("Pick images"),
                  ),
                ],
          ),
        );

        // GridView.count(
        //   crossAxisCount: 3,
        //   children: List.generate(items.length, (index) {
        //     return items[index];
        //   }),
        // ),
      },
    );
  }
}

abstract class ListItem {
  Widget build(BuildContext context);
}

class FileListItem extends ListItem {
  final String url;

  FileListItem(this.url);

  @override
  Widget build(context) {
    return Text(url);
  }
}

class PlatformFileListItem extends ListItem {
  final PlatformFile platformFile;

  PlatformFileListItem(this.platformFile);

  @override
  Widget build(context) {
    return Text(platformFile.path ?? '');
  }
}
