#!/bin/bash

echo "🚀 Jobin P Thomas - Interactive Resume App"
echo "=========================================="
echo ""
echo "This Flutter app showcases:"
echo "• Professional portfolio with 6 interactive screens"
echo "• Skills visualization and project showcase"
echo "• Work experience and achievements"
echo "• Contact information and social links"
echo ""
echo "📱 Running the app..."
echo ""

# Check if Flutter is installed
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter is not installed. Please install Flutter first."
    echo "   Visit: https://flutter.dev/docs/get-started/install"
    exit 1
fi

# Check Flutter version
echo "🔍 Flutter version:"
flutter --version | head -n 1
echo ""

# Get dependencies
echo "📦 Installing dependencies..."
flutter pub get

# Run the app
echo "🚀 Starting the app..."
echo ""
echo "💡 Tips:"
echo "• Use the bottom navigation to switch between screens"
echo "• Tap on contact items to open email/phone"
echo "• Explore the interactive skills and projects sections"
echo "• The app demonstrates Flutter development skills"
echo ""

flutter run
