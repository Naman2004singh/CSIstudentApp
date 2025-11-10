# 🎓 CSI Student App – College Event & Student Management System

The **CSI Student App** is a full-featured **Flutter-based mobile application** built for the **Computer Society of India (CSI)** at **Ajay Kumar Garg Engineering College**.  
It simplifies **event registration, attendance tracking, communication, and payments** between students and administrators — all within one connected platform.

---

## 🚀 Features

### 👩‍🎓 For Students
- **One-click event registration** for CSI activities and workshops  
- **Real-time event notifications** and updates via Firebase Cloud Messaging  
- **Live quizzes and polls** during events  
- **Face recognition-based attendance system** for verified participation  
- **Secure payments** integrated through Razorpay SDK  
- **Offline storage** using SQLite for seamless access without internet  
- **Chat and query system** for direct communication with admins  

### 🧑‍💼 For Admins
- **Full-featured Admin Controller App** for complete management  
- **Role-based login system** for faculty and student coordinators  
- **Create, update, and manage events** with participant tracking  
- **Attendance verification** through face recognition  
- **Send push notifications** and announcements in real time  
- **Manage student queries and payment tracking** efficiently  

---

## 🧩 Tech Stack

| Category | Technologies |
|-----------|--------------|
| Framework | Flutter (Dart) |
| Backend | Firebase (Auth, Firestore, Cloud Messaging) |
| State Management | Riverpod (MVVM Architecture) |
| Authentication | Google Sign-In |
| Payments | Razorpay SDK |
| Local Storage | SQLite |
| Tools | VS Code, Git, GitHub, Postman |

---

## 🏗️ Architecture Overview

- **MVVM Architecture** ensures modular, scalable, and testable code  
- **Riverpod** provides efficient reactive state management  
- **Firebase Cloud Firestore** for real-time database operations  
- **SQLite** for offline caching and local storage  
- **Firebase Cloud Messaging (FCM)** for push notifications  

```plaintext
Flutter UI → ViewModel (Riverpod) → Repository → Firebase / SQLite / Razorpay SDK
