import 'dart:html' as html;
import 'package:flutter/material.dart';

class WebcamCapture extends StatefulWidget {
  @override
  _WebcamCaptureState createState() => _WebcamCaptureState();
}

class _WebcamCaptureState extends State<WebcamCapture> {
  html.VideoElement? _videoElement;

  @override
  void initState() {
    super.initState();
    _initializeWebcam();
  }

  Future<void> _initializeWebcam() async {
    final mediaStream = await html.window.navigator.mediaDevices!.getUserMedia({'video': true});
    _videoElement = html.VideoElement();
    _videoElement!.srcObject = mediaStream;
    _videoElement!.autoplay = true;

    setState(() {});
  }

  @override
  void dispose() {
    _videoElement?.pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Webcam Capture')),
      body: Center(
        child: _videoElement == null
            ? CircularProgressIndicator()
            : HtmlElementView(viewType: 'videoElement'),
      ),
    );
  }
}
