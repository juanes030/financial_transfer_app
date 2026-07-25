# Financial Transfer App

Technical assessment developed in Flutter for a financial cooperative.

## Overview

This project implements a mobile application that simulates a financial transfer system. The application follows Clean Architecture principles and demonstrates best practices for Flutter development.

## Features

- Authentication
- User Management (CRUD)
- Financial Transfers
- Transaction Receipt
- Local Persistence

## Tech Stack

- Flutter
- Flutter Bloc
- Clean Architecture
- GetIt
- Injectable
- GoRouter
- SharedPreferences
- JSON Serializable

## Project Structure

```text
lib/
│
├── app/
├── core/
├── features/
│   ├── auth/
│   ├── users/
│   └── transfers/
├── injection/
└── main.dart
```

## Architecture

The project follows a Feature First + Clean Architecture approach.

Each feature is divided into:

- Data
- Domain
- Presentation

## Current Status

- [x] Project setup
- [x] Dependencies configured
- [x] Folder structure created
- [ ] Dependency Injection
- [ ] Authentication
- [ ] User Management
- [ ] Transfers
- [ ] Unit Testing
- [ ] Continuous Integration

## Author

Juan Esteban Alvarez Ruiz