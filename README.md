# Rock'and'Roll Weather

## Installation

### Linux
Follow Flutter official guide to installation in Linux:
[Start building Flutter Android apps on Linux](https://docs.flutter.dev/get-started/install/linux/android)

### Linux with ASDF

It's possible to install flutter using asdf. This is useful if you have multiple flutter versions installed in you computer.

1. Install asdf through the official documentation: [asdf getting started](https://asdf-vm.com/guide/getting-started.html) 
2. Add flutter plugin

```rb
asdf plugin add flutter
```
3.  Update asdf plugins

```rb
asdf plugin update --all
```
4. Check the right version of flutter in .tool-versions file
5. Install passing the right version

```rb
asdf install flutter 3.27.0-stable
```

## Run through terminal

1. Clean and update the packages:
```sh
flutter clean
flutter pub get
```
2. Run in android emulator
```rb
flutter run -d  <android emulator id>
```
To discover the `android emulator id` you can run:
```rb
flutter devices
```

