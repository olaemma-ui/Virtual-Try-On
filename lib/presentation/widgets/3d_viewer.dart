// import 'package:flutter/material.dart';
// import 'package:flutter_js/flutter_js.dart';

// class ThreeJSExample extends StatefulWidget {
//   @override
//   _ThreeJSExampleState createState() => _ThreeJSExampleState();
// }

// class _ThreeJSExampleState extends State<ThreeJSExample> {
//   late JavascriptRuntime _jsRuntime;

//   @override
//   void initState() {
//     super.initState();
//     _jsRuntime = getJavascriptRuntime();
//   }

//   Future<void> _initializeThreeJS() async {
//     // JavaScript code to control Three.js can be placed here.
//     String script = """
//       // Example Three.js code
//       var scene = new THREE.Scene();
//       var camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);
//       var renderer = new THREE.WebGLRenderer();
//       renderer.setSize(window.innerWidth, window.innerHeight);
//       document.body.appendChild(renderer.domElement);

//       var geometry = new THREE.BoxGeometry();
//       var material = new THREE.MeshBasicMaterial({ color: 0x00ff00 });
//       var cube = new THREE.Mesh(geometry, material);
//       scene.add(cube);

//       camera.position.z = 5;

//       var animate = function () {
//         requestAnimationFrame(animate);
//         cube.rotation.x += 0.01;
//         cube.rotation.y += 0.01;
//         renderer.render(scene, camera);
//       };
//       animate();
//     """;

//     // Execute the script
//     await _jsRuntime.evaluate(script);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Flutter Web with Three.js')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: _initializeThreeJS,
//           child: Text('Initialize 3D Scene'),
//         ),
//       ),
//     );
//   }
// }
