import 'package:flutter/material.dart';
import 'package:profit_portfolio_ver2/info_service.dart';
import 'package:provider/provider.dart';

import 'info.dart';

class CertificationEntryPage extends StatefulWidget {
  @override
  State<CertificationEntryPage> createState() => _CertificationEntryPageState();
}

class _CertificationEntryPageState extends State<CertificationEntryPage> {
  final TextEditingController certificationNameController =
      TextEditingController();

  final TextEditingController acquisitionDateController =
      TextEditingController();

  final TextEditingController organizerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<InfoService>(builder: (context, infoservice, child) {
      List<Certification> certifications = infoservice.certifications;

      return Scaffold(
        appBar: AppBar(
          title: Text('Add Certification'),
        ),
        body: certifications.isEmpty
            ? Row(
                children: [
                  Flexible(
                    child: TextField(
                      controller: certificationNameController,
                      decoration: InputDecoration(
                        labelText: '자격증명',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: TextField(
                      controller: acquisitionDateController,
                      decoration: InputDecoration(
                        labelText: '취득일자',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: TextField(
                      controller: organizerController,
                      decoration: InputDecoration(
                        labelText: '취득처',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Certification certification = Certification(
                        certificationName: certificationNameController.text,
                        acquisitionDate: acquisitionDateController.text,
                        organizer: organizerController.text,
                      );
                      Provider.of<InfoService>(context, listen: false)
                          .addCertification(certification);

                      certificationNameController.clear();
                      acquisitionDateController.clear();
                      organizerController.clear();
                    },
                    child: Text('추가'),
                  ),
                ],
              )
            : Column(
                children: [
                  Container(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: certifications.length,
                      itemBuilder: (context, index) {
                        Certification cert = certifications[index];

                        return Container(
                          width: double.infinity,
                          child: Row(
                            children: [
                              Text(
                                cert.certificationName,
                              ),
                              Spacer(),
                              Text(cert.acquisitionDate),
                              Spacer(),
                              Text(cert.organizer),
                              Spacer(),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text('삭제'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: TextField(
                          controller: certificationNameController,
                          decoration: InputDecoration(
                            labelText: '자격증명',
                            labelStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: TextField(
                          controller: acquisitionDateController,
                          decoration: InputDecoration(
                            labelText: '취득일자',
                            labelStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: TextField(
                          controller: organizerController,
                          decoration: InputDecoration(
                            labelText: '취득처',
                            labelStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Certification certification = Certification(
                            certificationName: certificationNameController.text,
                            acquisitionDate: acquisitionDateController.text,
                            organizer: organizerController.text,
                          );
                          Provider.of<InfoService>(context, listen: false)
                              .addCertification(certification);

                          certificationNameController.clear();
                          acquisitionDateController.clear();
                          organizerController.clear();
                        },
                        child: Text('추가'),
                      ),
                    ],
                  ),
                  TextButton(onPressed: () {}, child: Text("저장"))
                ],
              ),
      );
    });
  }
}
