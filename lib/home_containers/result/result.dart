import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class resultview extends StatefulWidget {
  const resultview({Key? key}) : super(key: key);
  static String routeName = 'resultview';

  @override
  State<resultview> createState() => _resultviewState();
}

class _resultviewState extends State<resultview> {
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Text(
              'Click here 👇',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: InkWell(
                  onTap: () => _launchURL("http://coe1.annauniv.edu/home/"),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 247, 0, 255),
                          Color.fromARGB(255, 4, 0, 255),
                        ]),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.blue,
                              blurRadius: 2,
                              offset: Offset(8.0, 8.0))
                        ],
                        border: Border.all(
                            color: Color.fromARGB(255, 248, 248, 248),
                            width: 3)),
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text(
                        'Anna university Website',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
