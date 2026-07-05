# Lesson 7: Form Validation

## Folder topic

This lesson upgrades basic text input into a real login form with validation. The page asks for email and password, checks the input, shows validation errors, and only accepts the form when the values are valid.

The main topic is `Form`, `GlobalKey<FormState>`, and `TextFormField`. These tools are used when input needs rules before the app continues.

## Files explained

- `problem7.dart` creates a `LoginPage` with two `TextFormField` widgets. It uses `formKey.currentState!.validate()` inside `login()` to run all validators. It also has controllers for email and password, a `result` message, and a `clearForm()` method.

## Key concepts

`Form` groups fields together. `GlobalKey<FormState>` gives the code access to the form state, especially the `validate()` method. When `validate()` runs, each `TextFormField.validator` function checks its field and returns an error string or `null`.

The email validator checks for empty input and requires the `@` symbol. The password validator checks for empty input and requires at least six characters. These are simple examples, but the pattern is the same for stronger validation rules.

The login button updates the screen only when validation passes. The clear button clears both controllers and resets the message. This lesson is important because real apps need to protect actions from incomplete or incorrect input.

