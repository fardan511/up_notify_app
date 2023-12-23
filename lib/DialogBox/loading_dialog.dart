import 'package:flutter/material.dart';
import 'package:project/widgets/loading_widget.dart';

class LoadingAlertDialog extends StatelessWidget {
  final String message;
  // ignore: use_key_in_widget_constructors
  const LoadingAlertDialog({required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          circularProgress(),
          const SizedBox(
            height: 10,
          ),
          const Text('Please wait...')
        ],
      ),
    );
  }
}
