# Lesson 6: Text Input and Controllers

## Folder topic

This lesson teaches how to read user input with `TextField` and `TextEditingController`. The app has two input fields for name and age, a button to show the entered data, and a button to clear the form.

The main topic is controlled input. In Flutter, a text field can be connected to a controller so the code can read, change, or clear the text value.

## Files explained

- `problem6.dart` defines `InputPage` as a `StatefulWidget`. The state owns `nameController` and `ageController`, stores a `result` string, and provides `showData()` and `clearData()` methods. It also disposes both controllers in `dispose()`.

## Key concepts

`TextEditingController` gives direct access to the current text inside a `TextField`. The app reads `nameController.text` and `ageController.text` to build the result message.

`clear()` removes text from a controller. This is useful for reset buttons, successful form submission, or clearing invalid input. The UI updates the result message with `setState()`, so the screen immediately shows what happened.

`dispose()` is important because controllers use resources while the widget exists. When the page is removed, `dispose()` releases those resources. This lesson also uses `InputDecoration` with labels, hints, borders, and prefix icons to make form fields clearer for the user.

