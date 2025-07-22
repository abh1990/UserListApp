# 👤 UserDemoApp

A modular, scalable iOS application built with Swift and UIKit. The app fetches and displays a list of users from a demo REST API. Tapping on a user navigates to a detail screen showing their **profile image**, **full name**, and **email**. It follows **Clean Architecture**, utilizes **MVVM** for the presentation layer, and adheres to **SOLID principles** with a strong emphasis on readability, testability, and maintainability.

---

## 🚀 Features

- 🔹 Fetch user list from a remote REST API
- 🔹 Display users in a table view
- 🔹 Tapping on a user navigates to a detail screen showing:
       - Async-load profile image from URL
       - Full name
       - Email address
- 🔹 Internet connectivity check
- 🔹 Jailbreak detection for basic security enforcement
- 🔹 Implements MVVM architecture
- 🔹 Clean separation of concerns across modules
- 🔹 Asynchronous data fetching with `async/await`
- 🔹 Unit test coverage 80%
- 🔹 Built with native Swift libraries including Combine

---

## 📱 Platform & Language

- **Platform**: iOS
- **Language**: Swift
- **Minimum Deployment Target**: iOS 18.0
- **Xcode Version**: 16
- **Swift Version**: 5

---

## 📦 Project Structure

UserListApp/
│
├── Presentation/
│ ├── UserList/
│ ├── UserDetail/
│
├── Domain/
│ ├── Entities/
│ └── UseCases/
│
├── Network/
│
├── Utilities/
│ ├── Reachability/
│ ├── JailbreakDetection/
│ └── NetworkMonitor/
│ └── Extension/
│ └── ErrorHandler/
│ └── AlertManager/
│
└── Resources/
└── Assets, Info.plist


---


## 🧱 Architecture

The app is organized into three core layers:
- **Presentation Layer** – UI logic using MVVM
- **Domain Layer** – Business rules (Use Cases, Entities)
- **Network Layer** – Repositories and API communication
- **Utils** – Contains helper classes that can be reused (Alert Manager, Network Monitor etc.) 
- **App** – Handles and manages app lifecycle events or each scene (AppDelegate, SceneDelegate)
- **Resources** – Contains assets and configuration files app needs to run UI (Assets.xcassets, Launch. storyboard)
 
This separation ensures:
- Independent unit testing
- Feature scalability
- Platform independence
 
### 🔄 MVVM Pattern- **Model** – User data structures
- **ViewModel** – Presentation logic, data-binding
- **View (Controller)** – UIKit views, data display, and user interaction
- **Pattern**: MVVM
- **Principles**: SOLID, Clean Architecture
- **Frameworks**: UIKit, Combine

### MVVM Breakdown

| Layer      | Component              |
|------------|------------------------|
| Model      | `User`                 |
| View       | `UserListViewController` |
| ViewModel  | `UserListViewModel`    |
| View       | `UserDetailViewController`    |
| ViewModel  | `UserDetailViewModel`    |
| Cell       | `UserTableViewCell`    |


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

<img width="1179" height="2556" alt="Simulator Screenshot - iPhone 16 - 2025-07-22 at 17 09 24" src="https://github.com/user-attachments/assets/28ee46e5-e38e-4d4f-80d5-8dd8acc42264" />
<img width="1179" height="2556" alt="Simulator Screenshot - iPhone 16 - 2025-07-22 at 17 09 29" src="https://github.com/user-attachments/assets/9058a432-ef57-4323-ad1a-ed6d9ed2694b" />
<img width="1132" height="837" alt="Screenshot 2025-07-22 at 5 07 30 PM" src="https://github.com/user-attachments/assets/1cbb80a4-6607-4c3a-9bc4-d9f1c4f4a569" />




