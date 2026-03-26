# Multi-Mode Pomodoro Timer

 **Student:** Layan Samhan
 
 **Student Number:** 240417271
 
 **Course:** COM206

### Research Question / Problem Statement
Time management during complex tasks requires a reliable way to switch between work and rest periods. How can we implement a precise, multistate countdown system in a mobile environment that remains accurate while the user toggles between different durations?

### Objective of the Project
The project aims to build a Flutter application that utilizes a centralized state to manage three distinct time intervals. It focuses on the technical implementation of an asynchronous countdown and the logic required to reset or switch modes without software conflicts.

### Expected Outcome
A working mobile application that demonstrates clean state management and reliable timer execution. The project will prove that a single code logic can handle multiple time-based requirements through efficient variable mapping.

---

### Approach to Problem Solving

The control flow of the solution is structured as follows:

1. START the Application
2. SET timer to 25 minutes (1500 seconds) by default
3. WAIT for user input
4. IF the user presses PLAY:
   - START a loop that repeats every 1 second
   - SUBTRACT 1 from the time
   - REFRESH the numbers on the screen
   - IF the time hits 0: STOP the loop
5. IF the user presses PAUSE:
   - STOP the 1-second loop
6. IF the user presses RESET:
   - STOP the loop
   - SET the time back to the original starting number
   - REFRESH the screen
7. IF the user picks a NEW TIME (like 5 minutes):
   - STOP the current countdown
   - CHANGE the time to 300 seconds
   - REFRESH the numbers on the screen
8. KEEP GOING until the app is closed

### Main Components

Input: User interactions (Play, Pause, Reset, Mode Selection)
Processing: Timer logic, countdown management, state updates
Output: Real-time timer display on screen

---

### Programming Language
Flutter (Dart)

---

## Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Android Studio / VS Code with Flutter extensions
- iOS or Android device/emulator

### Installation

```
git clone https://github.com/yourusername/pomodoro-timer.git
cd pomodoro-timer
flutter pub get
flutter run
```

---

## Features

- Pomodoro Timer: 25-minute focus sessions
- Short Break: 5-minute rest periods
- Long Break: 15-minute extended breaks
- Play: Start the countdown timer
- Pause: Pause the current session
- Reset: Reset timer to current mode default
- Mode Switching: Switch between Pomodoro and break modes
---

## License

This project is submitted as part of academic coursework and is intended for educational purposes only.
