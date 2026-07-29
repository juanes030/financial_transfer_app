# Financial Transfer App

A Flutter application developed as a technical assessment for a financial cooperative. The app simulates a basic financial transfer system with local persistence, user management, and role-based access.

## Features

### Authentication

- Login with email and password.
- Automatic creation of a default administrator on the first application launch.
- Session management using Flutter Bloc.

### User Management

Administrator capabilities:

- Create users.
- View all registered users.
- Delete users.
- Initial balance assignment.
- Role assignment (Administrator or Customer).

### Financial Transfers

Customer capabilities:

- Transfer money to other customers.
- Source account is automatically the authenticated user.
- Destination list excludes:
  - The authenticated user.
  - Administrator accounts.
- Transfer validation:
  - Source and destination must be different.
  - Amount must be greater than zero.
  - Sufficient balance verification.

### Transaction Receipt

Each successful transfer generates a receipt with:

- Unique transaction identifier.
- Source account.
- Destination account.
- Amount transferred.
- Transaction date and time.

### Local Persistence

Application data is stored locally using SharedPreferences.

The following information is persisted:

- Users
- Account balances
- Transfers
- Authentication data

---

## Default Administrator

The application automatically creates a default administrator the first time it runs.

| Email | Password |
|--------|----------|
| **admin@cotrafa.com** | **Admin123*** |

---

## Roles

### Administrator

- Manage users.
- Create new users.
- Delete users.

The administrator cannot perform financial transfers.

### Customer

- Perform financial transfers.
- View only transfer-related functionality.

Customers cannot access user management.

---

## Tech Stack

- Flutter 3.44.8
- Dart
- Flutter Bloc
- Clean Architecture
- Feature First
- GetIt
- Injectable
- GoRouter
- SharedPreferences
- JSON Serializable
- Intl

---

## Architecture

The project follows a **Feature First + Clean Architecture** approach.

Each feature is divided into:

- Data
- Domain
- Presentation

### Project Structure

```text
lib/
│
├── app/
├── core/
│
├── features/
│   ├── auth/
│   ├── users/
│   ├── transfers/
│   └── home/
│
├── injection/
└── main.dart
```

---

## Business Rules

### User Management

- The administrator is created automatically.
- Email addresses must be unique.
- Only administrators can manage users.

### Transfers

- Customers can only transfer from their own account.
- Transfers to yourself are not allowed.
- Transfers to administrator accounts are not allowed.
- The amount must be greater than zero.
- The sender must have sufficient balance.
- Balances are updated automatically after each successful transfer.

---

## Getting Started

### Prerequisites

- Flutter SDK **3.44.8**
- Dart SDK (included with Flutter)
- Android Studio or Visual Studio Code

### Clone the repository

```bash
git clone <repository-url>
cd financial_transfer_app
```

### Install dependencies

```bash
flutter pub get
```

### Generate dependency injection files

```bash
dart run build_runner build --delete-conflicting-outputs
```

### Run the application

```bash
flutter run
```

---

## Packages Used

| Package | Purpose |
|----------|---------|
| flutter_bloc | State management |
| get_it | Service locator |
| injectable | Dependency injection |
| go_router | Navigation |
| shared_preferences | Local persistence |
| json_serializable | JSON serialization |
| intl | Currency and date formatting |

---

## Current Status

- ✅ Project setup
- ✅ Clean Architecture
- ✅ Dependency Injection
- ✅ Authentication
- ✅ User Management
- ✅ Financial Transfers
- ✅ Transaction Receipt
- ✅ Local Persistence
- ⏳ Transfer History
- ⏳ Route Authorization
- ⏳ Unit Testing
- ⏳ Continuous Integration

---

## Author

**Juan Esteban Alvarez Ruiz**