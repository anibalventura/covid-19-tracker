# COVID-19 Tracker

[![Flutter](https://img.shields.io/static/v1?label=Flutter&message=2.0&color=blue)](https://flutter.dev/)
[![Null Safety](https://img.shields.io/static/v1?label=Null+Safety&message=YES&color=success)](https://flutter.dev/docs/null-safety)
[![Flutter Support](https://img.shields.io/static/v1?label=Support&message=%20Android%20|%20iOS&color=blue)]()
[![License](https://img.shields.io/static/v1?label=License&message=MIT&color=blue)](LICENCE.md)

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

- [lint](https://pub.dev/packages/lint)
- [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons)
- [flutter_native_splash](https://pub.dev/packages/flutter_native_splash)

# License

```xml
MIT License

Copyright (c) 2021 Anibal Ventura

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
