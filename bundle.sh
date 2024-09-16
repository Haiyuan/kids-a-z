#!/bin/bash

APP_NAME="Kids A-Z"
BINARY_NAME="kidsa_z_app"
IDENTIFIER="com.yourcompany.kidsaz"
VERSION="1.0"

# Create bundle directories
mkdir -p "$APP_NAME.app/Contents/MacOS"
mkdir -p "$APP_NAME.app/Contents/Resources"

# Copy executable and resources
cp "target/release/$BINARY_NAME" "$APP_NAME.app/Contents/MacOS/$APP_NAME"
cp "icon.icns" "$APP_NAME.app/Contents/Resources/icon.icns"

# Create Info.plist
cat > "$APP_NAME.app/Contents/Info.plist" <<EOL
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "https://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>CFBundleDisplayName</key>
    <string>$APP_NAME</string>
    <key>CFBundleExecutable</key>
    <string>$APP_NAME</string>
    <key>CFBundleIdentifier</key>
    <string>$IDENTIFIER</string>
    <key>CFBundleName</key>
    <string>$APP_NAME</string>
    <key>CFBundleIconFile</key>
    <string>icon</string>
    <key>CFBundlePackageType</key>
    <string>APPL</string>
    <key>CFBundleVersion</key>
    <string>$VERSION</string>
    <key>CFBundleShortVersionString</key>
    <string>$VERSION</string>
    <key>NSHighResolutionCapable</key>
    <true/>
</dict>
</plist>
EOL

# Make executable
chmod +x "$APP_NAME.app/Contents/MacOS/$APP_NAME"

echo "App bundle created: $APP_NAME.app"