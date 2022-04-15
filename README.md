Debounce builder, debounce timer

## Features

* debounce builder - Widget provides debounce function from DebounceTimer instance
* debounce timer - Provide call callback after delay duration

## Getting started

Add package to your project ```bash flutter pub add debounce_builder```

Wrap your widget

```dart
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DebounceBuilder(
        delay: const Duration(milliseconds: 250),
        builder: (context, debounce) {
          return TextField(
            onChanged: (value) => debounce(() => print(value)),
          );
        },
    );
  }
}
```
