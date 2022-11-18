import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
        margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child:  const Text("Help", style: TextStyle(fontSize: 24),),
      ),
      Container(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: const Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam turpis augue, faucibus at elit at, molestie tempus ligula. Donec nec dignissim velit. Vivamus fringilla at nisi ac tincidunt. Nulla luctus est tempor, rutrum arcu vel, porttitor lorem. Maecenas lacus lectus, vestibulum vitae eros id, pellentesque feugiat magna. Duis vel quam sit amet justo ultrices porta bibendum in libero. Aliquam mattis vulputate libero, sed molestie elit rhoncus auctor. Morbi egestas lectus id pretium varius. Quisque pulvinar maximus mi at lobortis. Duis gravida laoreet neque, et dictum leo.Nulla facilisi. Vivamus nec erat vestibulum, lobortis mi placerat, rhoncus risus. Praesent et tortor nulla. Nunc et elementum sapien. Donec ullamcorper quam nec elit pretium molestie. Quisque viverra pulvinar maximus. Aenean faucibus pharetra odio, ac aliquet ipsum sagittis nec. Ut nisi orci, gravida at dictum quis, blandit vitae turpis. Pellentesque lobortis sodales arcu, quis aliquam justo sodales a.", style: TextStyle(fontSize: 18) ),
      ),
      ]
    ));
  }
}
