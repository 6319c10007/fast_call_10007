import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailUi extends StatefulWidget {
  String? name;
  String? tel;
  String? image;
  String? detail;

  DetailUi({
    this.name,
    this.tel,
    this.image,
    this.detail
  });

  @override
  State<DetailUi> createState() => _DetailUiState();
}

Future<void> _makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
}

class _DetailUiState extends State<DetailUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
        title: Center(
          child: Text(
            'รายละเอียด',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width-80,
                child: Card(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          widget.detail!,
                        ),
                        leading: Icon(
                          FontAwesomeIcons.starAndCrescent,
                        ),
                      ),
                      ListTile(
                        onTap: (){
                          _makePhoneCall(
                            widget.tel!,
                          );
                        },
                        title: Text(
                          widget.tel!,
                        ),
                        leading: Icon(
                          FontAwesomeIcons.phone,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    
    
  }
}