Grow Daily: Personal Growth and Habit Tracking App
Introduction
Grow Daily is a mobile application designed to help individuals foster personal growth and maintain healthy habits. It provides users with the tools to track their daily habits, set reminders, and monitor their progress over time. The app is built using Flutter, allowing for a cross-platform experience that runs smoothly on both Android and iOS devices.

Features
Habit Tracking: Log and monitor daily habits. Set goals and track your consistency and progress.
Reminders: Never miss a habit with customizable reminders. Each habit can have multiple reminders, ensuring you stay on track.
Progress Visualization: Visual insights into your habits over time, helping you understand patterns and make necessary adjustments.
User-Friendly Interface: A simple and intuitive interface that makes tracking your personal growth effortless and motivating.

Technology Stack
Flutter: Used for the frontend to create a seamless cross-platform experience.
Firebase: Integrates Firebase for backend services including authentication, database, and analytics.
Bloc: Utilizes the Bloc pattern for state management, ensuring a clean, predictable, and manageable state flow throughout the app.
Clean Architecture: Adheres to the principles of Clean Architecture to promote separation of concerns, scalability, and maintainability.

Architecture
Grow Daily is structured around Clean Architecture principles, divided into three main layers:

Presentation Layer: Manages UI and user interactions, using Bloc for state management to react to user inputs and system events.
Domain Layer: Contains business logic and use cases, which dictate how the app responds to various actions and inputs.
Data Layer: Interfaces with Firebase to handle data persistence, retrieval, and real-time updates.
