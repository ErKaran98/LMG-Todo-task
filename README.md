# Todo App (Flutter)

A clean and minimal Todo application built with Flutter as part of an interview practical task.  
The app focuses on **clean architecture, state management, and user experience**.

---

## Features

### Core Features
- Add new todo with title, description, and time
- Edit existing todo
- Delete todo with confirmation dialog
- View todo list
- View todo details screen
- Persistent local storage using Hive

### Bonus Features
- 🔍 Search todos by title or description
- Reactive UI updates using GetX
- Clean and consistent UI design

---

## 🧠 Architecture & State Management

- **State Management:** GetX
- **Local Database:** Hive
- **Architecture Pattern:** Feature-based modular structure

Single source of truth is maintained using GetX controllers, and UI updates reactively when data changes.

---

## 📂 Project Structure

lib/
│
├── core/
│   ├── constants/
│   ├── utils/
│
├── data/
│   ├── local/
│   ├── models/
│
├── modules/
│   └── todo/
│       ├── controllers/
│       ├── views/
│       ├── widgets/
│
├── routes/
│
└── main.dart

---

## 💾 Local Storage

- Hive is used for offline persistence
- Custom `TodoModel` adapter is registered
- Data remains available after app restart

---

## 🔍 Search Implementation (Bonus)

Search is implemented using:
- A reactive search query
- A computed filtered list
- No mutation of original todo list

This ensures clean logic and better performance.

---

## 🎨 UI & UX Considerations

- Bottom sheet used for add/edit todo
- Details screen designed with clear visual hierarchy
- Confirmation dialog before delete
- Snackbar feedback for success and error states
- Responsive spacing for small and large screens

---

## ⚠️ Known Limitations

- Timer start/pause/stop functionality is not implemented
- Todos have a fixed maximum duration (5 minutes)

---

## 🔮 Future Improvements

- Add timer start / pause / stop functionality
- Add status update (TODO → IN-PROGRESS → DONE)
- Add dark mode support
- Add unit & widget tests

---

## 🛠 Tech Stack

- Flutter
- Dart
- GetX
- Hive

---

## 👤 Author

**Karan Rana**  
Flutter Developer (2.6 years experience)

---

## 📌 Note

This project was built with focus on **code quality, clean structure, and interview best practices** rather than adding excessive features.