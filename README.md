# Adstacks Dashboard

Production-quality Flutter office dashboard for **Adstacks Media**, built for mobile, tablet, and web.

## Features

- Responsive layout (mobile drawer, tablet/desktop multi-column)
- Left navigation sidebar with profile and workspaces
- Top header with search, notifications, and profile
- Project banner with gradient and decorative shapes
- All Projects list with highlighted active project
- Top Creators table with rating bars
- Overall Performance dual-line analytics chart
- Right panel with calendar, birthdays, and anniversaries
- Centralized theme, constants, and dummy office data
- Firebase Hosting and Vercel deployment ready

## Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) 3.16+
- Chrome (for web development)

## Getting Started

```bash
cd adstacks-dashboard
flutter pub get
flutter run -d chrome
```

### Other platforms

```bash
flutter run -d windows
flutter run -d android
flutter run -d ios
```

## Build for Web

```bash
flutter build web --release
```

Output: `build/web/`

## Deploy to Firebase Hosting

1. Install Firebase CLI: `npm install -g firebase-tools`
2. Login: `firebase login`
3. Initialize (if needed): `firebase init hosting`
4. Build: `flutter build web --release`
5. Deploy: `firebase deploy --only hosting`

## Deploy to Vercel

1. Install Vercel CLI: `npm i -g vercel`
2. From project root: `vercel`
3. Vercel uses `vercel.json` for build settings

Or connect the GitHub repo in the Vercel dashboard with:

- **Build Command:** `flutter build web --release`
- **Output Directory:** `build/web`
- **Install Command:** `flutter pub get`

## Project Structure

```
lib/
├── core/
│   ├── constants/
│   ├── theme/
│   └── utils/
├── models/
├── widgets/
│   └── common/
├── screens/
│   └── dashboard/
│       └── components/
└── main.dart
```

## Packages

- `fl_chart` — analytics line chart
- `google_fonts` — DM Sans typography
- `intl` — calendar formatting

## License

Assignment project for Adstacks Media.
