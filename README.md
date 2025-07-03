# 👤 UserDemoApp

A modular, scalable iOS application built with Swift and UIKit. The app fetches and displays a list of users from a demo REST API. It follows **Clean Architecture**, utilizes **MVVM** for the presentation layer, and adheres to **SOLID principles** with a strong emphasis on readability, testability, and maintainability.

---

## 🚀 Features

- 🔹 Fetch user list from a remote REST API
- 🔹 Display users in a table view
- 🔹 Implements MVVM architecture
- 🔹 Clean separation of concerns across modules
- 🔹 Asynchronous data fetching with `async/await`
- 🔹 Unit test coverage above 80%
- 🔹 Built with native Swift libraries including Combine

---

## 📱 Platform & Language

- **Platform**: iOS
- **Language**: Swift
- **Minimum Deployment Target**: iOS 18.0
- **Xcode Version**: 16
- **Swift Version**: 5

---

## 📦 Modules

The app is structured into well-defined modules:

- `BaseUI` – Common UI components and styling
- `Network` – Handles API communication using `URLSession` and `async/await`
- `BusinessLogic` – Core logic and use cases
- `AppCore` – Shared models, extensions, and utilities

---

## 🧱 Architecture

- **Pattern**: MVVM
- **Principles**: SOLID, Clean Architecture
- **Frameworks**: UIKit, Combine

### MVVM Breakdown

| Layer      | Component              |
|------------|------------------------|
| Model      | `User`                 |
| View       | `UserListViewController` |
| ViewModel  | `UserListViewModel`    |

- ViewModel exposes observable state
- Handles async API fetching and error handling
- Purely testable and decoupled from UIKit

---

## 🔌 Networking

- Built with **native `URLSession`** using `async/await`
- All networking concerns encapsulated in the `Network` module
- Custom error types for robust error handling
- Fully mockable services for easy testing

---

## 🧪 Testing

- **Testing Framework**: `XCTest`
- **Test Coverage**: 80%+
- **How to Run Tests**:
  - In Xcode: Press `⌘ + U` or go to **Product > Test**
  - This runs all test cases and gathers code coverage metrics

> The architecture enables easy mocking of dependencies and promotes isolated testing of ViewModels and networking logic.

## 📸 Screenshots
<img width="1138" alt="Screenshot 2025-07-03 at 4 33 46 PM" src="https://github.com/user-attachments/assets/a6fa3814-b52e-4eaa-9a3c-961ab9e54383" />
![Simulator Screenshot - iPhone 16 - 2025-07-03 at 15 57 12](https://github.com/user-attachments/assets/888f3973-caf2-4f6d-866b-b53e0e2da9af)




