# COVID-19 Tracker

[![Flutter](https://img.shields.io/static/v1?label=Flutter&message=2.0&color=blue)](https://flutter.dev/)
[![Null Safety](https://img.shields.io/static/v1?label=Null+Safety&message=YES&color=success)](https://flutter.dev/docs/null-safety)
[![Flutter Support](https://img.shields.io/static/v1?label=Support&message=Web%20|%20Android%20|%20iOS&color=blue)]()

<img src="assets/images/repository-banner.png" align="center"/>

One screen app to track COVID-19 cases.

## Features

- Dashboard to present cases.
- Date from last update.
- Pull to refresh data.
- Offline cached data.
- Snackbar to show errors.
- Responsive design.
- Dark mode support.
- Languages: English and Spanish.

## Build

1. Register and get an Authorization Sandbox Key from [nCoV 2019 Admin Dashboard](https://ncov2019-admin.firebaseapp.com/).
2. Create an api_keys.dart file in lib/services/api/ with the following:

```
class APIKeys {
  static String covSandboxKey = "YOUR_API_KEY";
}
```

## Dependencies

- [flutter_screenutil](https://pub.dev/packages/flutter_screenutil)
- [google_fonts](https://pub.dev/packages/google_fonts)
- [http](https://pub.dev/packages/http)
- [intl](https://pub.dev/packages/intl)
- [provider](https://pub.dev/packages/provider)
- [shared_preferences](https://pub.dev/packages/shared_preferences)

### Dev Dependencies

- [change_app_package_name](https://pub.dev/packages/change_app_package_name)
- [lint](https://pub.dev/packages/lint)
- [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons)
- [flutter_native_splash](https://pub.dev/packages/flutter_native_splash)

# License

```xml
Copyright 2021 Anibal Ventura
```
