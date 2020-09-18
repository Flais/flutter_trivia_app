import 'package:trivia_app_flutter/app/modules/home/domain/repositories_interfaces/number_trivia_repository_interface.dart';
import 'package:trivia_app_flutter/app/modules/home/domain/repositories_interfaces/random_number_trivia_repository_interface.dart';
import 'package:trivia_app_flutter/app/modules/home/domain/use_cases/get_number_trivia.dart';
import 'package:trivia_app_flutter/app/modules/home/domain/use_cases/get_random_number_trivia.dart';
import 'package:trivia_app_flutter/app/modules/home/external/data_sources/numbersapi_get_number_trivia_data_source.dart';
import 'package:trivia_app_flutter/app/modules/home/external/data_sources/numbersapi_get_random_number_trivia_data_source.dart';
import 'package:trivia_app_flutter/app/modules/home/external/drivers/dio_http_client.dart';
import 'package:trivia_app_flutter/app/modules/home/infra/external_interfaces/data_souces_interfaces/number_trivia_data_source_interface.dart';
import 'package:trivia_app_flutter/app/modules/home/infra/external_interfaces/data_souces_interfaces/random_number_trivia_data_source_interface.dart';
import 'package:trivia_app_flutter/app/modules/home/infra/external_interfaces/drivers_interfaces/http_client.dart';
import 'package:trivia_app_flutter/app/modules/home/infra/repositories/number_trivia_repository.dart';
import 'package:trivia_app_flutter/app/modules/home/infra/repositories/random_number_trivia_repository.dart';

import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $HomeController,
        //HttpClient
        Bind((i) => DioHttpClient()),

        //DataSources
        Bind((i) => NumbersAPIGetNumberTriviaDataSource(i.get<IHttpClient>())),
        Bind((i) => NumbersAPIGetRandomNumberTriviaDataSource(i.get<IHttpClient>())),

        //Repositories
        Bind((i) => NumberTriviaRepository(i.get<INumberTriviaDataSource>())),
        Bind((i) => RandomNumberTriviaRepository(i.get<IRandomNumberTriviaDataSource>())),

        //UseCases
        Bind((i) => GetNumberTrivia(i.get<INumberTriviaRepository>())),
        Bind((i) => GetRandomNumberTrivia(i.get<IRandomNumberTriviaRepository>())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
