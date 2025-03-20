# Py_Site

## Description

This project is a personal resume and portfolio website built with Flutter, following the Clean Architecture principles. It is designed to showcase personal information, work experience, education, projects, and other professional details in an interactive and visually appealing manner.

## Features

- **Theme Toggle**: A feature that allows switching between light and dark themes.
- **Resume Page**: A page that showcases the user's professional resume.

## Architecture

This project follows the **Clean Architecture** approach. Clean Architecture promotes the separation of concerns and organizes code in layers that are independent of each other. This ensures that the application is modular, easier to test, and more maintainable.

The main layers in the architecture include:

- **Presentation Layer**: Contains the UI components that interact with the user. This layer is responsible for displaying information and capturing user interactions.
- **Domain Layer**: Contains the business logic, such as entities, use cases, and repositories. This layer is independent of the UI and handles data manipulation.
- **Data Layer**: Contains the implementation of data sources, such as API calls, database interactions, and other data-related services. This layer communicates with the Domain Layer through repositories.
  
By separating concerns across layers, the application remains modular, scalable, and testable.

## Structure

Here’s the tree structure of the project:

```
lib/
│
├── core/
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
├── router/
│   ├── app_router.dart
│   └── routes.dart
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

## Future Plans

- **Blog Page**: A page to share blog posts and articles.
- **Projects Page**: A page to showcase personal and team projects.