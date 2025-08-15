# MVP Project – Profile & Networking App

A simple **Minimum Viable Product** built with **Flutter**.  
The app allows users to **log in**, **edit their profile**, and **view a list of other users**, with support for **dark/light mode**.

---

##  Features
- **User Authentication** – Login and Register using Firebase Auth (Email/Password).
- **Profile Management** – Fetch profile data from Cloud Firestore after registration and allow users to edit:
    - Name
    - Bio
    - Profile picture
    - Email
    - Phone number
    - Gender
- **Profile Picture Preview** – See the selected image before saving.
- **User List** – Display all registered users from Firestore.
- **Dark/Light Theme Toggle** – Switch between light and dark themes from settings.
- **Responsive UI** – Works on multiple screen sizes.
- **Engaging Loading Screens** – Visually appealing load animations.
- **Firebase Firestore Integration** – Store , retrieve profile pictures and any data.

---


## 🛠 Tools, Frameworks, Libraries, and Technologies Used

## 🛠 Technologies
- **Flutter (Dart)** – Cross-platform framework for building mobile applications.
- **Firebase Authentication** – Secure email/password authentication.
- **Cloud Firestore** – Real-time NoSQL cloud database.
- **Cubit / BLoC** – Predictable state management pattern.

---

## Tools
- **Android Studio / VS Code** – Development IDEs.
- **Flutter SDK** – Framework SDK for building the app.
- **Dart SDK** – Programming language runtime.
- **Git & GitHub** – Version control and code hosting.
- **Firebase Console** – Configuration and backend management.
- **Google Cloud Console** – Service management for Firebase APIs.
- **Android Emulator / Physical Device** – Testing environments.

---

### **Framework**
- **Flutter (Dart)** – Cross-platform framework for building mobile applications from a single codebase.

---

### **Backend**
- **Firebase Authentication** – Handles user login and registration using email/password.
- **Cloud Firestore** – NoSQL cloud database for storing and retrieving user profiles and other app data in real-time.

---

### **State Management**
- **flutter_bloc** – Implements BLoC/Cubit pattern for predictable and maintainable state management.


## 📦 Libraries & Packages Used

### UI & Design
- **flutter_screenutil** – Responsive UI scaling.
- **google_fonts** – Custom font integration.
- **flutter_svg** – SVG image rendering.
- **cupertino_icons** – iOS-style icon set.
- **curved_navigation_bar** – Stylish curved bottom navigation.
- **flutter_spinkit** – Loading animations.
- **animated_snack_bar** – Animated notifications.

### Media & Image Handling
- **image_picker** – Select images from the device camera/gallery.
- **flutter_image_compress** – Image compression before upload.
- **image** – Image processing utilities.

### User Input & Forms
- **intl_phone_field** – International phone number input.

### Local Data Storage
- **shared_preferences** – Store small key-value data (theme mode, settings).


---


## ⏱ Actual Time Spent on Implementation
**Total time spent:** 12 hours over 3 days.

- **Day 1:** 4 hours – UI design and implementation of core features (Login, Profile screen), additional UI enhancements, and bonus improvements.
- **Day 2:** 6 hours – Implementation of Dark/Light mode, User list functionality, further UI enhancements, and bonus features.
- **Day 3:** 2 hours – Testing, final refinements, README documentation, and APK generation.

---


## 🧩 Key Challenges & Solutions

- **Issue:** When picking a selfie image from the gallery and saving changes in the profile, the image was not saving correctly due to orientation and mirroring issues.
- **Solution:** Processed the selected image by:
    - Fixing its orientation before saving.
    - Automatically detecting selfies and flipping them horizontally when necessary.
    - Compressing the image to reduce file size while maintaining quality.
    - Encoding the processed image in Base64 for consistent storage and retrieval.

---


## 📈 Future Scalability

### How could the app be extended to include features like chat or friend requests?
- **Chat:**
    - Create a `messages` collection in Firestore with `senderId`, `receiverId`, `messageText`, `timestamp`.
    - Use Firestore’s real-time listeners for instant message delivery.
    - Add typing indicators and read receipts for better UX.

- **Friend Requests:**
    - Add a `friendRequests` subcollection under each user document.
    - Store status (`pending`, `accepted`, `declined`).
    - Implement accept/reject UI in the profile or user list screen.

---

### What is one approach to improve performance for a large number of users?
- **Pagination & Batch Loading:**
    - Use Firestore’s `.limit()` with `.startAfterDocument()` to fetch data in small chunks.
    - Implement infinite scroll to load more users as the list is scrolled.

- **Local Caching:**
    - Use Hive or SharedPreferences to cache frequently accessed data locally.
    - Reduces Firestore reads and improves loading speed.



