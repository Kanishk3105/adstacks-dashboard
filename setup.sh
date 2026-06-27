#!/usr/bin/env bash
set -e
flutter create . --project-name adstacks_dashboard --platforms=web,android,ios,windows
flutter pub get
flutter analyze
flutter build web --release
echo "Build complete: build/web"
