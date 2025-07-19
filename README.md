Random Quote Generator App

A beautifully designed Random Quote Generator Flutter app that shows inspirational quotes, allows users to share them, and supports both light and dark themes. Built with modern UI practices and reusable widgets.
Features
•	Get random motivational quotes at the tap of a button
•	Share quotes via device-native share options
•	Light & Dark theme support
•	Reusable buttons with consistent design
•	Clean and elegant UI/UX
Project Structure
lib/
├── main.dart # App entry point with theme & home screen
├── models/
│ └── quote.dart # Quote model class
├── screens/
│ └── home_screen.dart # Main UI screen showing quotes & buttons
│ └── quotes_data.dart # Hardcoded list of quotes
├── widgets/
│ └── primary_button.dart # Reusable button widget

Tech Stack
Flutter (latest stable)
Dart
-share_plus package
dependencies: share_plus: ^7.2.1  
