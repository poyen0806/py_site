# Py_Site

## Description

[Py_Site](https://poyen0806.github.io/py_site/) is a personal resume and portfolio website built with **Flutter**, following the **Clean Architecture** principles. It is designed to showcase my personal information, education,  work experience, projects, and other professional details in an interactive and visually appealing manner. The project includes comprehensive features and is deployed using **GitHub CI/CD**.

### Frameworks & Tools
- **Framework**: Flutter (Web)
- **Architecture**: Clean Architecture
- **State Management**: Bloc
- **Deployment**: GitHub CI/CD
- **Testing**: Flutter Test

### CICD & Testing
The project uses **GitHub Actions** for continuous integration and deployment (CI/CD), ensuring automated builds and deployments.

## Features

### Completed
- **Resume Page**: Displays self-introduction, education, work experience, and some projects.
- **Theme Toggle**: Allows users to switch between light and dark modes using Bloc.

### In Progress
- **Unit Test**: Currently working on completing the necessary unit tests for each file.

### Planned
- **Blog Integration**: Integrating a blog page generated by **Hexo**.
- **Project Buttons**: Directing project buttons to corresponding **GitHub** repositories.

## Structure

Here’s the tree structure of the project:

```
lib/
│
├── core/
│   │
│   ├── router/
│   │   ├── app_router.dart
│   │   └── routes.dart
│   │
│   ├── theme/
│   │   │
│   │   └── presentation/
│   │       │
│   │       ├── bloc/
│   │       │   ├── theme_bloc.dart
│   │       │   ├── theme_event.dart
│   │       │   └── theme_state.dart
│   │       │
│   │       └── widgets/
│   │           ├── app_theme.dart
│   │           └── theme_toggle_button.dart
│   │
│   │
│   │
│   ├── utils/
│   │   └── responsive.dart
│   │
│   └── widgets/
│       ├── base_app_bar.dart
│       ├── base_scaffold.dart
│       └── navigation_button.dart
│
│
├── feature/
│   │
│   └── resume/
│       │
│       ├── data/
│       │   │
│       │   └── repositories/
│       │       ├── project_repository_impl.dart
│       │       └── timeline_repository_impl.dart
│       │
│       │
│       ├── domain/
│       │   │
│       │   ├── entities/
│       │   │   ├── project_entity.dart
│       │   │   └── timeline_item_entity.dart
│       │   │
│       │   └── repositories/
│       │       ├── project_repository.dart
│       │       └── timeline_repository.dart
│       │
│       │
│       └── presentation/
│           │
│           ├── sections/
│           │   ├── education_section.dart
│           │   ├── experience_section.dart
│           │   ├── hashtag_section.dart
│           │   ├── intro_section.dart
│           │   ├── project_section.dart
│           │   └── self_promotion_section.dart
│           │
│           └── widgets/
│               ├── section_title.dart
│               ├── timeline.dart
│               └── timeline_section.dart
│
│
│
│
├── presentation/
│   └── resume_page.dart
│
└── main.dart
```

## How to Run

To run this project locally, make sure you have **Flutter** installed on your machine. Then, follow these steps:

1. Clone the repository:
    ```bash
    git clone https://github.com/poyen0806/py_site.git
    ```

2. Navigate to the project directory:
    ```bash
    cd py_site
    ```

3. Install the dependencies:
    ```bash
    flutter pub get
    ```

4. Run the app:
    ```bash
    flutter run
    ```
