import 'package:flutter/material.dart';
 
 void main() {
   runApp(const TrackerSheet());
 }
 
 class TrackerSheet extends StatelessWidget {
   const TrackerSheet({super.key});
 
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       home: const HomeScreen(),
     );
   }
 }
 
 class HomeScreen extends StatefulWidget {
   const HomeScreen({super.key});
 
   @override
   State<HomeScreen> createState() => _HomeScreenState();
 }
 
 class _HomeScreenState extends State<HomeScreen> {
   String displayText = 'Hello World!';
 
   void _changeText() {
     setState(() {
       displayText = 'Pressed';
     });
   }
 
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: const Color.fromARGB(255, 215, 227, 234),
       body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text(
               displayText,
               style: const TextStyle(
                 fontSize: 32,
                 fontWeight: FontWeight.bold,
                 color: Color.fromARGB(255, 11, 11, 11),
                 fontFamily: 'DMSans',
               ),
             ),
             const SizedBox(height: 20),
             ElevatedButton(
               style: ElevatedButton.styleFrom(
                 backgroundColor: const Color.fromARGB(255, 29, 147, 244),
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(60), 
                 ),
               ),
               onPressed: _changeText,
               child: const Text(
                 'Press Here',
                 style: TextStyle(
                   fontSize: 32,
                   color: Color.fromARGB(255, 240, 243, 240), 
                   fontWeight: FontWeight.bold,
                 ),
               ),
             ),
           ],
         ),
       ),
     );
   }
 }