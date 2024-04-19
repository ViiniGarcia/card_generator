# card_generator

## Getting Started

This project is a method to generate in seconds cards of all people who work in EJC.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



remote add origin https://github.com/ViiniGarcia/badge-gen-website.git
git branch -M main
git push -u origin main

/badge-gen-website/

@echo "Clean existing repository..."
	flutter clean

	@echo "Getting packages..."
	flutter pub get

	@echo "Building for web..."
	flutter build web --base-href $(BASE_HREF) --release