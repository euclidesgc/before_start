import 'package:flutter/foundation.dart';

import '../repositories/i_home_repository.dart';

class VerificationEmailRequestUsecase {
  final IHomeRepository repository;

  VerificationEmailRequestUsecase({required this.repository});

  Future call({required String email}) async {
    try {
      await repository.verificationEmailRequest(email: email);
    } catch (e) {
      debugPrint("🔴 $e");
      rethrow;
    }
  }
}


/*
curl -X 'POST' \
  'https://mentoriabeforestart.b4a.io/verificationEmailRequest' \
  -H 'accept: application/json' \
  -H 'X-Parse-Application-Id: 9k6Er3wTULxfBvjG12SXh4QbZ93cSMxrpXClMlpc' \
  -H 'X-Parse-REST-API-Key: lCIuL0H29AyrDCloq6XLbu9fIpYPNyQMuao9vYNO' \
  -H 'Content-Type: application/json' \
  -d '{
  "email": "euclides.catunda@gmail.com"
}'
*/