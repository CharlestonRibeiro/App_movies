import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock/mock_classes.dart';

void main() {
  late MockDioClient mockDioClient;

  setUp(() {
    mockDioClient = MockDioClient();
  });

  group('test getData', () {
    String urlTest = 'https://teste.com/';

    test('expect test getData success', () async {
      final response = Response(requestOptions: RequestOptions());

      when(() => mockDioClient.getData(url: urlTest)).thenAnswer((_) async {
        return response;
      });

      final result = await mockDioClient.getData(url: urlTest);

      expect(result, response);
    });

    test('expect test getData error', () async {
      when(() => mockDioClient.getData(url: urlTest))
          .thenThrow(DioError(requestOptions: RequestOptions()));

      expect(() async {
        await mockDioClient.getData(url: urlTest);
      }, throwsA(isA<DioError>()));
    });
  });
}
