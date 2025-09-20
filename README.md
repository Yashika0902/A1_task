# 👥 SwiftUI User List with Pagination

[![Swift](https://img.shields.io/badge/Swift-5.9-orange.svg)](https://swift.org)  
[![iOS](https://img.shields.io/badge/iOS-16+-blue.svg)](https://developer.apple.com/ios/)

A modern **iOS SwiftUI app** that fetches and displays a list of users from a remote API with **infinite scrolling**, profile images, and a clean list-based UI.  

---

## ✨ Features

- Fetch users using **async/await**  
- Display **profile images**, name, email, and age  
- **Infinite scrolling / pagination** when reaching the bottom of the list  
- Handles **loading**, **errors**, and **empty states**  
- Gradient background with clean, readable design  
- Pure SwiftUI implementation — **no external dependencies**

---

## 📱 Screenshots

*(Add screenshots here for better visual representation)*

---

## ⚙️ Requirements

- Xcode 15+  
- iOS 16+  
- Swift 5.9+

---

## 🚀 Installation

```bash
git clone https://github.com/yourusername/SwiftUI-UserList.git
cd SwiftUI-UserList
open UserListApp.xcodeproj
```

Build and run on simulator or device.  

---

## 📝 Usage

- Users load automatically on app launch  
- Scroll to the bottom to load more users (pagination)  
- Tap **Retry** on error  

---

## 📂 Project Structure

```
UserListApp/
├── Models/         # User model and API response wrapper
├── Services/       # API service with pagination
├── ViewModels/     # Fetching and managing users
├── Views/          # SwiftUI views
├── Assets.xcassets # Colors and gradients
└── README.md       # Documentation
```

---

## 💡 Notes

- Each user has a **UUID** since API does not provide IDs  
- Profile images use **AsyncImage**  
- Background gradients are defined in **Assets.xcassets**  

---

## 📄 License

MIT License — open source
