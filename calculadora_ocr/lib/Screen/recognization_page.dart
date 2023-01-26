import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class RecognizationPage extends StatefulWidget {
  final String? path;
  const RecognizationPage({Key? key, this.path}) : super(key: key);

  @override
  State<RecognizationPage> createState() => _RecognizationPageState();
}

class _RecognizationPageState extends State<RecognizationPage> {
  bool _isImage = false;

  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    //processa a imagem
    final InputImage inputImage = InputImage.fromFilePath(widget.path!);
    processImage(inputImage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Recognization Page")),
      body: _isImage == true
          ? const Center(
              child: const CircularProgressIndicator(),
            )
          : Container(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                controller: controller,
                decoration:
                    const InputDecoration(hintText: "Text goes here..."),
              ),
            ),
    );
  }

  void processImage(InputImage image) async {
    //o que vai reconhecer
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

    setState(() {
      _isImage = true;
    });
    print(image.filePath! + " aqui 2");
    final RecognizedText recognizedText =
        await textRecognizer.processImage(image);

    //termina de processar a imagem
    setState(() {
      _isImage = false;
      controller.text = recognizedText.text;
    });
  }
}
