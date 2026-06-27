# Setup script — run once from project root
# Requires Flutter SDK in PATH

Write-Host "Creating Flutter platform scaffolding..."
flutter create . --project-name adstacks_dashboard --platforms=web,android,ios,windows

Write-Host "Restoring custom pubspec if needed..."
# If flutter create overwrote pubspec, restore from git:
# git checkout pubspec.yaml

Write-Host "Fetching dependencies..."
flutter pub get

Write-Host "Running analyzer..."
flutter analyze

Write-Host "Building web release..."
flutter build web --release

Write-Host "Done. Output: build/web"
