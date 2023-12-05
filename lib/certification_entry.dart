import 'package:flutter/material.dart';
import 'package:profit_portfolio_ver2/info_service.dart';
import 'package:provider/provider.dart';

import 'info.dart';

class CertificationEntryPage extends StatelessWidget {
  final TextEditingController certificationNameController =
      TextEditingController();
  final TextEditingController acquisitionDateController =
      TextEditingController();
  final TextEditingController organizerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Certification'),
      ),
      body: Column(
        children: [
          TextField(
            controller: certificationNameController,
            decoration: InputDecoration(labelText: '자격증명'),
          ),
          TextField(
            controller: acquisitionDateController,
            decoration: InputDecoration(labelText: '취득일자'),
          ),
          TextField(
            controller: organizerController,
            decoration: InputDecoration(labelText: '취득처'),
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

              Navigator.pop(
                context,
                Certification(
                  certificationName: certificationNameController.text,
                  acquisitionDate: acquisitionDateController.text,
                  organizer: organizerController.text,
                ),
              );
            },
            child: Text('저장'),
          ),
        ],
      ),
    );
  }
}
