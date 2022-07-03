import 'package:fast_call_10007/models/Tel_List.dart';
import 'package:fast_call_10007/views/Detail_UI.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({Key? key}) : super(key: key);

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  List<TelList> TelListInfo = [
    TelList(
      name: 'กรมการแพทย์',
      tel: '1668',
      image: 'f1.jpg',
      detail:
          'ช่วยเหลือผู้ติดเชื้อแต่ไม่มีเตียงรักษาและรับคำแนะนนำการปฏิบัติตัว',
    ),
    TelList(
      name: 'สำนักงานประกันสุขภาพ',
      tel: '1330',
      image: 'f2.jpg',
      detail: 'ช่วยหาเตียงให้ผู้ป่วย',
    ),
    TelList(
      name: 'ศูนย์บริการสอบถามสถานการณ์โควิด-19',
      tel: '1111',
      image: 'f3.jpg',
      detail: 'ขอคำแนะนำหรือร้องเรียนในช่วงวิกฤตโควิด-19',
    ),
    TelList(
      name: 'กรมควบคุมโรค',
      tel: '1422',
      image: 'f4.jpg',
      detail: 'สอบถามสถานการณ์ของการระบาดโควิด-19',
    ),
    TelList(
      name: 'สำนักงานประกันสังคม',
      tel: '1506',
      image: 'f5.jpg',
      detail: 'ตรวจสอบสิทธิประกันสังคมและขอรับเงินชดเชยการว่างงานช่วยโควิด-19',
    ),
    TelList(
      name: 'สายด่วนสุขภาพจิต',
      tel: '1323',
      image: 'f6.jpg',
      detail: 'ขอคำแนะนำเมื่อเกิดภาวะเครียด',
    ),
    TelList(
      name: 'สำนักงานคณะกรรมการอาหารและยา (อย.)',
      tel: '1556',
      image: 'f7.jpg',
      detail:
          'แจ้งเหตุเมื่อพบผู้ประกอบการจำหน่ายสินค้าทางการแพทย์ที่ไม่ได้คุณภาพ',
    ),
    TelList(
        name: 'กรมการค้าภายใน',
        tel: '1569',
        image: 'f8.jpg',
        detail: 'เมื่อไม่ได้รับความเป็นธรรมจากการค้าและบริการในช่วงโควิด-19'),
  ];

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Center(
          child: Text(
            'สายด่วนโควิด-19',
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/ambulance.png',
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailUi(
                            name: TelListInfo[index].name!,
                            tel: TelListInfo[index].tel!,
                            image: TelListInfo[index].image!,
                            detail: TelListInfo[index].detail!,
                          ),
                        ),
                      );
                    },
                    leading: Text(
                      TelListInfo[index].tel!,
                    ),
                    title: Center(
                      child: Text(
                        TelListInfo[index].name!,
                      ),
                    ),
                    trailing: Column(
                      children: [
                        Container(
                          child: IconButton(
                            icon: Icon(FontAwesomeIcons.phone),
                            onPressed: () {
                              _makePhoneCall(
                                TelListInfo[index].tel!,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: TelListInfo.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
