import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'Business_Logic/cubit/my_cubit.dart';
import 'Data/Network/web_services.dart';
import 'Data/Repository/my_repo.dart';

final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerLazySingleton(() => WebServices(createAndSetupDio()));
  getIt.registerLazySingleton(() => MyRepo(getIt()));
  getIt.registerLazySingleton<MyCubit>(() => MyCubit(getIt()));
}

Dio createAndSetupDio() {
  Dio dio = Dio();
  dio.options.connectTimeout = const Duration(seconds: 10);
  dio.options.receiveTimeout = const Duration(seconds: 10);
  dio.interceptors.add(LogInterceptor(
    request: true,
    error: true,
    responseBody: true,
    requestBody: true,
    requestHeader: false,
    responseHeader: false,
  ));

  return dio;
}
