# Lesson 9: Navigation With Arguments and Results

## Folder topic

This lesson builds on basic navigation by passing data into new pages and receiving data back when those pages close. The home page can open a profile page or a course page, then display the result returned from that page.

The main topic is two-way navigation communication. A parent page sends values through a constructor, and the child page returns a selected result through `Navigator.pop()`.

## Files explained

- `problem9.dart` defines `HomePage`, `ProfilePage`, and `CoursePage`. `HomePage` stores `selectedResult`, opens pages with `await Navigator.push(...)`, and updates the result when a returned value is not null. `ProfilePage` receives `name`, `age`, and `city`. `CoursePage` receives `courseName` and `lessonCount`.

## Key concepts

Constructor parameters are used to pass required data into a page. `ProfilePage` cannot be created without its name, age, and city because those fields are marked `required`.

`Navigator.push()` returns a `Future`. By using `await`, the home page pauses the function until the pushed page is popped. The child page can call `Navigator.pop(context, result)` to send a value back.

The course page demonstrates multiple possible returned results: completed or canceled. This pattern is common for picker screens, edit pages, login flows, and confirmation pages where the previous screen must know what happened.

