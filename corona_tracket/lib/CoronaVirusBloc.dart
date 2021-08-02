import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import './CountryModel.dart';
import './CoronaVirusRepo.dart';

class VirusEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FetchVirus extends VirusEvent {
  final _country;

  FetchVirus(this._country);

  @override
  // TODO: implement props
  List<Object> get props => [_country];
}

class ResetVirus extends VirusEvent {}

class VirusState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class VirusIsNotSearched extends VirusState {}

class VirusIsLoading extends VirusState {}

class VirusIsLoaded extends VirusState {
  final _virusDetails;

  VirusIsLoaded(this._virusDetails);

  CountryModel get getVirus => _virusDetails;

  @override
  // TODO: implement props
  List<Object> get props => [_virusDetails];
}

class VirusIsNotLoaded extends VirusState {}

class CoronaVirusBloc extends Bloc<VirusEvent, VirusState> {
  CoronaVirusRepo virusRepo;

  //WeatherBloc(this.weatherRepo);
  CoronaVirusBloc(this.virusRepo) : super(VirusIsNotSearched());
  @override
  // TODO: implement initialState
  VirusState get initialState => VirusIsNotSearched();

  @override
  Stream<VirusState> mapEventToState(VirusEvent event) async* {
    // TODO: implement mapEventToState
    if (event is FetchVirus) {
      yield VirusIsLoading();

      try {
        CountryModel virus = await virusRepo.getVirus(event._country);
        yield VirusIsLoaded(virus);
      } catch (_) {
        print(_);
        yield VirusIsNotLoaded();
      }
    } else if (event is ResetVirus) {
      yield VirusIsNotSearched();
    }
  }
}
