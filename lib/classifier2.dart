import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;

import 'helper/image_classification_helper.dart'; // Import the image class from the 'image' package

class ImageClassificationApp extends StatefulWidget {
  const ImageClassificationApp({Key? key}) : super(key: key);

  @override
  _ImageClassificationAppState createState() => _ImageClassificationAppState();
}

class _ImageClassificationAppState extends State<ImageClassificationApp> {
  final ImagePicker _picker = ImagePicker();
  File? _image;
  late List<dynamic> _output = [];
  final List<String> _labels = [
    'Aluminium',
    'Carton',
    'Glass',
    'Organic Waste',
    'Other Plastics',
    'Paper and Cardboard',
    'Plastic',
    'Textiles',
    'Wood'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Classification')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _selectImage,
              child: Text('Select Image'),
            ),
            ElevatedButton(
              onPressed: _captureImage,
              child: Text('Capture Image'),
            ),
            if (_image != null)
              Image.file(_image!), // Use the 'Image' class from the 'package:flutter' library
            ElevatedButton(
              onPressed: _classifyImage,
              child: Text('Classify Image'),
            ),
            Text('Classification Results: ${_output.isNotEmpty ? _labels[_output[0]] : ""}'),
          ],
        ),
      ),
    );
  }

  Future<void> _selectImage() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
        _output.clear();
      });
    }
  }

  Future<void> _captureImage() async {
    final image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _image = File(image.path);
        _output.clear();
      });
    }
  }


  Future<void> _classifyImage() async {
    ImageClassificationHelper();
    // if (_image == null) return;
    //
    // // Load the model
    // final interpreterOptions = InterpreterOptions();
    // final interpreter = await Interpreter.fromAsset('assets/image_recognition/Waste_Classification_TFlite_Model.tflite', options: interpreterOptions);
    // var inputTensor = interpreter.getInputTensors().first;
    // print(inputTensor);
    // var outputTensor = interpreter.getOutputTensors().first;
    // print(outputTensor);
    //
    // // Preprocess input image
    // final rawBytes = await _image!.readAsBytes();
    // final inputImage = img.decodeImage(rawBytes); // Use the 'Image' class from the 'image' package
    // final resizedImage = img.copyResize(inputImage!, width: 256, height: 256); // Resize image to match model input size
    // final input = resizedImage.getBytes(); // Convert image to bytes
    //
    // // Allocate output
    // final output = List.filled(_labels.length, 0).reshape([1, _labels.length]);
    //
    // // Run inference
    // interpreter.run(input, output);
    // setState(() {
    //   _output = output;
    // });
    //
    // // Release resources
    // interpreter.close();
  }
}