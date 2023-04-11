codegen:
  flutter pub run build_runner build

codegen-force:
  flutter pub run build_runner build --delete-conflicting-outputs

codegen-watch:
  flutter pub run build_runner watch --delete-conflicting-outputs
