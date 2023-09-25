import 'dart:ffi';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class SiganturePage extends StatefulWidget {
  const SiganturePage({super.key});

  @override
  State<SiganturePage> createState() => _SiganturePageState();
}

class _SiganturePageState extends State<SiganturePage> {
  Uint8List? exportedImage;
  SignatureController controller = SignatureController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Signature"),
        ),
        body: Column(
          children: [
            Signature(
              controller: controller,
              height: 250,
              width: MediaQuery.of(context).size.width / 1.05,
              backgroundColor: Colors.lightBlue[100]!,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () async {
                        controller.clear();
                      },
                      child: Text("Clear")),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () async {
                        exportedImage = await controller.toPngBytes();
                        print(exportedImage); 
                        setState(() {});
                      },
                      child: Text("Save Signature")),
                )
              ],
            )
          ],
        ));
  }
}
