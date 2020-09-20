import 'package:flutter/widgets.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:trivia_app_flutter/app/core/exceptions/exceptions.dart';
import 'package:trivia_app_flutter/app/modules/home/domain/use_cases/get_number_trivia.dart';
import 'package:trivia_app_flutter/app/modules/home/domain/use_cases/get_random_number_trivia.dart';
import 'package:trivia_app_flutter/app/modules/home/infra/models/trivia_model.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  //Dependence Injection Stuff
  final GetNumberTrivia getNumberTriviaUseCase = Modular.get<GetNumberTrivia>();
  final GetRandomNumberTrivia getRandomNumberTriviaUseCase =
      Modular.get<GetRandomNumberTrivia>();

  //Widgets Stuff
  final numberTriviaTextController =
      MaskedTextController(mask: '00000000000000000000000');

  // State Management Stuff
  @observable
  String _displayText = '';

  @computed
  String get displayText => _displayText;

  @action
  setDisplayText(String value) {
    _displayText = value;
  }

  //Methods
  Future<void> getNumberTrivia({@required double numberTrivia}) async {
    _executeUseCase(getNumberTriviaUseCase.execute(numberTrivia: numberTrivia));
  }

  Future<void> getRandomNumberTrivia() async {
    _executeUseCase(getRandomNumberTriviaUseCase.execute());
  }

  _executeUseCase(Future<TriviaModel> function) async {
    try {
      final _trivia = await function;


      setDisplayText(_trivia.text);

      _clearNumberTriviaTextFieldValue();
    } on NetWorkFailureException {
      setDisplayText(
          'Oops, something went wrong. Please, check your Internet connection.');
    } on UnexpectedException {
      setDisplayText('Oops, something unexpected went wrong.');
    }
  }

  void _clearNumberTriviaTextFieldValue() {
    numberTriviaTextController.text = '';
  }
}

