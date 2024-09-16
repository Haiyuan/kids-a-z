# Kids A-Z

A desktop application developed using Rust and the Wry library to load the [Kids A-Z](https://www.kidsa-z.com/main/Login) website in a standalone window. This application is optimized for macOS, providing a custom application icon and a native user experience.

## Features

- **Standalone Browser Window**: Access the Kids A-Z website in a desktop application without needing a web browser.
- **Custom Application Icon**: Uses a custom Dock icon on macOS for an enhanced user experience.
- **Cross-Platform Support**: While optimized for macOS, it can be compiled and run on other platforms (custom icon functionality is macOS-specific).

## Screenshots

*Add screenshots of the application here.*

## Installation

### Prerequisites

- **Rust**: Ensure that the Rust toolchain is installed. You can install it using:

  ```bash
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  ```

- **Wry Library Dependencies**: Wry may require certain platform-specific libraries.

  - **macOS**: Usually includes all necessary libraries.

### Building from Source

1. **Clone the Repository**

   ```bash
   git clone https://github.com/Haiyuan/kids-a-z.git
   cd kids-a-z
   ```

2. **Prepare the Icon File**

   Make sure you have an `icon.icns` file in the root directory of the project for the custom application icon.

3. **Build the Project**

   ```bash
   cargo build --release
   ```

4. **Create the macOS Application Bundle**

   To display the custom Dock icon correctly on macOS, you need to package the application as a `.app` bundle. You can manually create it using the following steps:

   #### Manually Creating the `.app` Bundle

   ```bash
   # In the project root directory, create the necessary directory structure
   mkdir -p "Kids A-Z.app/Contents/MacOS"
   mkdir -p "Kids A-Z.app/Contents/Resources"

   # Copy the executable and resource files
   cp target/release/kids-a-z "Kids A-Z.app/Contents/MacOS/Kids A-Z"
   cp icon.icns "Kids A-Z.app/Contents/Resources/icon.icns"

   # Create the Info.plist file
   cat > "Kids A-Z.app/Contents/Info.plist" <<EOL
   <?xml version="1.0" encoding="UTF-8"?>
   <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "https://www.apple.com/DTDs/PropertyList-1.0.dtd">
   <plist version="1.0">
   <dict>
       <key>CFBundleDisplayName</key>
       <string>Kids A-Z</string>
       <key>CFBundleExecutable</key>
       <string>Kids A-Z</string>
       <key>CFBundleIdentifier</key>
       <string>com.yourcompany.kidsaz</string>
       <key>CFBundleName</key>
       <string>Kids A-Z</string>
       <key>CFBundleIconFile</key>
       <string>icon</string>
       <key>CFBundlePackageType</key>
       <string>APPL</string>
       <key>CFBundleVersion</key>
       <string>1.0</string>
       <key>CFBundleShortVersionString</key>
       <string>1.0</string>
       <key>NSHighResolutionCapable</key>
       <true/>
   </dict>
   </plist>
   EOL

   # Ensure the executable has the proper permissions
   chmod +x "Kids A-Z.app/Contents/MacOS/Kids A-Z"
   ```

   #### Using a Script to Automate the `.app` Bundle Creation

   You can also use the provided `bundle.sh` script to automate the steps above:

   ```bash
   ./bundle.sh
   ```

   The content of `bundle.sh` is as follows:

   ```bash
   #!/bin/bash

   APP_NAME="Kids A-Z"
   BINARY_NAME="kids-a-z"
   IDENTIFIER="com.yourcompany.kidsaz"
   VERSION="1.0"

   # Create application bundle directory structure
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

   # Set executable permissions
   chmod +x "$APP_NAME.app/Contents/MacOS/$APP_NAME"

   echo "Application bundle created: $APP_NAME.app"
   ```

   **Note**: Make sure to modify `BINARY_NAME` to match the name of your executable file.

5. **Run the Application**

   You can now run the application using:

   ```bash
   open "Kids A-Z.app"
   ```

## Usage

- After launching the application, it will load the Kids A-Z login page in a standalone window.
- You can use the website as you would in a browser but with the experience of a desktop application.

## Development

### Dependencies

- **Rust and Cargo**: For building and managing the Rust project.
- **Wry Library**: For creating cross-platform WebView applications.
- **macOS Specific Dependencies**: Uses Cocoa framework for application bundling on macOS.

### Building and Running

```bash
cargo run
```

### Directory Structure

```
.
├── Cargo.toml
├── src
│   └── main.rs
├── icon.icns
├── bundle.sh
└── README.md
```

- `Cargo.toml`: Configuration file for the Rust project.
- `src/main.rs`: Main program source code.
- `icon.icns`: Application icon file.
- `bundle.sh`: Script to create the macOS application bundle.
- `README.md`: Project documentation.

## FAQ

### Icon Not Displaying

- Ensure that the `icon.icns` file exists in the `Kids A-Z.app/Contents/Resources/` directory.
- Check that `CFBundleIconFile` in `Info.plist` is correctly set to `icon`.
- Make sure the `icon.icns` file is properly formatted. You can generate it using macOS's `iconutil` tool.

### Application Won't Run

- Ensure the executable has the proper permissions: `chmod +x "Kids A-Z.app/Contents/MacOS/Kids A-Z"`
- Verify that `CFBundleExecutable` in `Info.plist` matches the name of the executable file.

## Contributing

Issues and pull requests are welcome. Before submitting, please ensure your code adheres to the project's coding standards and that you've performed necessary testing.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Thanks to the developers of [Wry](https://github.com/tauri-apps/wry) for providing robust cross-platform WebView support.
- Appreciation to all contributors who have helped improve this project.

---

*Note: This project is intended for educational and research purposes only and is not affiliated with the official Kids A-Z. Please comply with the relevant user agreements and laws.*