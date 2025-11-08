# Flutter Glass App

A beautiful Flutter application featuring login and home pages with stunning glass morphism design using the `liquid_glass_renderer` package.

## Features

- 🎨 **Glass Morphism Design**: Beautiful frosted glass effect throughout the app
- 🔐 **Login Page**: Elegant login interface with glass-styled input fields
- 🏠 **Home Page**: Dashboard with statistics cards and activity feed
- 📱 **Responsive UI**: Works on various screen sizes
- 🌈 **Gradient Backgrounds**: Eye-catching color gradients

## Screenshots

### Login Page
- Glass effect text fields for email and password
- Smooth gradient background
- Modern UI with floating glass cards

### Home Page
- Dashboard with analytics cards
- Recent activity section
- Glass effect navigation bar
- User profile header

## Getting Started

### Prerequisites
- Flutter SDK (>=3.0.0)
- Dart SDK
- Android Studio / VS Code with Flutter extensions

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd flutter_glass
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Dependencies

- `liquid_glass_renderer`: ^0.3.0 - For stunning glass morphism effects
- `cupertino_icons`: ^1.0.6 - iOS style icons

## Usage

### Login
Simply enter any email and password in the login page and tap "Login" to navigate to the home page.

### Home Page
Explore the dashboard with:
- Analytics overview cards
- Recent activity feed
- Bottom navigation bar
- Logout functionality

## Important Notes

⚠️ **Impeller Required**: The `liquid_glass_renderer` package requires Impeller rendering engine (not Skia). Make sure Impeller is enabled on your target device.

## Design Pattern

The app uses:
- Gradient backgrounds for visual appeal
- LiquidGlass widgets for frosted glass effects
- LiquidRoundedSuperellipse for smooth rounded corners
- Opacity layering for depth

## License

This project is open source and available under the MIT License.
