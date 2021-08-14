import 'package:flutter/material.dart';
import 'package:test/http/http.dart';

import '../../injection.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: getIt<HttpAgent>().fetchFromApi(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(),
            ),
          );
        }
        final Text child;
        if (snapshot.hasData) {
          child = Text(snapshot.data ?? 'null');
        } else if (snapshot.hasError) {
          child = Text('${snapshot.error}');
        } else {
          child = const Text('Не изветсная ошибка!');
        }
        return SafeArea(child: child);
      },
    );
  }
}
