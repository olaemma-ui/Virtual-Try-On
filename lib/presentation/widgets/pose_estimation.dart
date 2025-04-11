// import 'package:flutter/material.dart';
// import 'package:flutter_js/flutter_js.dart';

// class PoseEstimation extends StatefulWidget {
//   @override
//   _PoseEstimationState createState() => _PoseEstimationState();
// }

// class _PoseEstimationState extends State<PoseEstimation> {
//   final _jsRuntime = getJavascriptRuntime();

//   @override
//   void initState() {
//     super.initState();
//     _initializePoseEstimation();
//   }

//   Future<void> _initializePoseEstimation() async {
//     String script = """
//       // JavaScript code to run PoseNet or BlazePose model here
//       const poseNet = require('@tensorflow-models/posenet');
//       const image = document.getElementById('image');
//       const pose = await poseNet.estimateSinglePose(image);
//       return pose;
//     """;
    
//     var result = await _jsRuntime.evaluate(script);  
//     print(result.stringResult);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Pose Estimation')),
//       body: Center(
//         child: Column(
//           children: [
//             ElevatedButton(
//               onPressed: _initializePoseEstimation,
//               child: Text('Start Pose Estimation'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
