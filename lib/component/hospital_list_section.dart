import 'package:flutter/material.dart';
import 'package:shared/ui/components/card_product.dart';
import 'package:shared/ui/components/card_hospital.dart';

class HospitalListSection extends StatelessWidget {
  const HospitalListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: [
        CardHospital(),
        CardHospital(),
        CardHospital(),
      ],
    );
  }
}
