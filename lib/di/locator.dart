import 'package:get_it/get_it.dart';
import 'package:notapp/infrastructure/datasources/isar_datasource.dart';
import 'package:notapp/infrastructure/repositories/local_storage_repository_impl.dart';
import 'package:notapp/presentation/blocs/bloc/note/note_bloc.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<LocalStorageRepositoryImpl>(
      () => LocalStorageRepositoryImpl(IsarDatasource()));

  getIt.registerFactory(
      () => NoteBloc(addNoteRepository: getIt<LocalStorageRepositoryImpl>()));
}
