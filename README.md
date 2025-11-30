# CircInfo App

Hey there! This is a cool Flutter project that fetches live cricket match details using two demo APIs. We built this app with the BLoC pattern to keep things neat and dynamic.

## What It Does

- **Live Match Info:** Pulls data from two demo APIs so you can see real-time match details.
- **Dynamic UI:** Displays match cards with team scores, match status, and a "More about this game" section.
- **Clean Code:** Uses the BLoC pattern for state management so that everything stays organized.
- **Splash Screen:** Kicks off with a splash screen (customizable as static or animated).


## Screenshots
| | |
|:-------------------------:|:-------------------------:|
|![Screenshot 1.](https://github.com/Ranj1/sportz_interactive_test/blob/Main/screenshots/image3.png?raw=true)|![Screenshot 2.](https://github.com/Ranj1/sportz_interactive_test/blob/Main/screenshots/image2.png?raw=true)|
|![Screenshot 3.](https://github.com/Ranj1/sportz_interactive_test/blob/Main/screenshots/image1.png?raw=true)|![Screenshot 4.](https://github.com/Ranj1/sportz_interactive_test/blob/Main/screenshots/image0.png?raw=true)|
|![Screenshot 3.](https://github.com/Ranj1/sportz_interactive_test/blob/Main/screenshots/image5.jpeg?raw=true)||

## How It Works

1. **Fetching Data:**  
   The app calls two APIs:  
   - `https://demo.sportz.io/sapk01222019186652.json`  
   - `https://demo.sportz.io/nzin01312019187360.json`  
   Data is parsed into models and fed into the BLoC.

2. **State Management:**  
   We use **flutter_bloc** to handle fetching data and updating the UI based on the state (loading, loaded, error).

3. **UI Components:**  
   You’ll see match cards with team details, scores, and a button for more details, all built with Flutter widgets.

## Getting Started

### Prerequisites

- Flutter installed on your machine
- A working internet connection (to fetch the API data)

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/Ranj1/circInfo
   cd sportz_interactive
   ```

2. **Install dependencies:**

   ```bash
   flutter pub get
   ```

3. **Run the app:**

   ```bash
   flutter run
   ```

4. **Build the APK (if needed):**

   ```bash
   flutter build apk --release
   ```


## Dependencies

- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [http](https://pub.dev/packages/http)
- [flutter_native_splash](https://pub.dev/packages/flutter_native_splash)
- [google_fonts](https://pub.dev/packages/google_fonts)

