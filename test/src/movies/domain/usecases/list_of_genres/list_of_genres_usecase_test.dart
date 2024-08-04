import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:cinehanzo/src/movies/domain/domain.dart';

class MockListOfGenresRepository extends Mock implements ListOfGenresRepository {}

class MockResultGenresEntity extends Mock implements ResultGenresEntity {}

void main() {
  late MockListOfGenresRepository mockListOfGenresRepository;
  late ListOfGenresUseCaseImpl listOfGenresUseCaseImpl;
  late MockResultGenresEntity mockResultGenresEntity;

  setUp(() {
    mockListOfGenresRepository = MockListOfGenresRepository();
    listOfGenresUseCaseImpl = ListOfGenresUseCaseImpl(
      listOfGenresRepository: mockListOfGenresRepository,
    );
    mockResultGenresEntity = MockResultGenresEntity();
  });

  test('Should return an object of type ResultGenresEntity.', () async {
    when(() => mockListOfGenresRepository.getGenres())
        .thenAnswer((_) async => mockResultGenresEntity);

    final result = await listOfGenresUseCaseImpl.getGenres();

    expect(result, mockResultGenresEntity);
    verify(() => mockListOfGenresRepository.getGenres());
  });
}
