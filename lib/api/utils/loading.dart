import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
            // padding: const EdgeInsets.all(10),
            // decoration: BoxDecoration(
            //   color: Colors.transparent,
            //   borderRadius: BorderRadius.circular(10),
            // ),
            // child: const LoadingDialog(),
            ),
      ),
    );
  }
}
