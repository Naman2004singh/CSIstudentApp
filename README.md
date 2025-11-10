
---

## 🎓 **CSI Student App**
Save as: `README.md` in your **CSI Student App** repository.

```markdown
# 🎓 CSI Student App – College Event & Student Management System

The **CSI Student App** is a full-featured mobile application developed using **Flutter, Firebase, and Riverpod**, built for the **Computer Society of India (CSI)** at **Ajay Kumar Garg Engineering College**.  
It simplifies **event registration, attendance tracking, communication, and payments** between students and administrators through a single, connected platform.

---

## 🚀 Features

### 👩‍🎓 For Students
- **One-click event registration** for CSI activities  
- **Real-time event notifications** and updates  
- **Live quizzes and polls** during events  
- **Face recognition attendance system**  
- **Razorpay payment gateway** for event fees  
- **Offline data access** using SQLite  
- **Query & chat system** for student-admin interaction  

### 🧑‍💼 For Admins
- **Full-featured Admin Controller App**
- Role-based login for event organizers and committee members  
- **Event creation, updates, and participant management**
- **Attendance verification** using face recognition data  
- **Automated push notifications** and announcements  
- Real-time **query management** and **payment tracking**

---

## 🧩 Tech Stack

| Category | Technology |
|-----------|-------------|
| Framework | Flutter (Dart) |
| Backend | Firebase (Auth, Firestore, FCM) |
| State Management | Riverpod (MVVM Architecture) |
| Payments | Razorpay SDK |
| Authentication | Google Sign-In |
| Local Storage | SQLite |
| Tools | VS Code, GitHub, Postman |

---

## 🏗️ Architecture Overview

- **MVVM architecture** for scalability  
- **Riverpod** for efficient state handling  
- **Firebase Cloud Firestore** for real-time sync  
- **SQLite** for local caching and offline support  
- **Push Notifications** via Firebase Cloud Messaging (FCM)  

```plaintext
Flutter UI → ViewModel (Riverpod) → Repository → Firebase / SQLite / Razorpay SDK
