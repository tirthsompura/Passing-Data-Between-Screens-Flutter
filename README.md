# passing_data_between_screens_with_validation

## Getting Error with solve this.

1. FOR IOS // GO To ios folder / Runner / info.plist /
OPEN info.plist file / <dict> Section add there below lines

  <key>NSPhotoLibraryUsageDescription</key>
  <string>To take user profile picture</string>
  <key>NSCameraUsageDescription</key>
  <string>To choose user profile picture</string>
  <key>NSMicrophoneUsageDescription</key>
  <string>Used to capture audio for image picker</string>

2. Solve Image.network problem  android/app/src/main/AndroidManifest.xml

<uses-permission android:name="android.permission.INTERNET" />
