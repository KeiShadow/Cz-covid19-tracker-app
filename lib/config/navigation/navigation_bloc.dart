import 'package:bloc/bloc.dart';
import '../../views/protection_view/protection_view.dart';
import '../../views/symptoms_view/symptoms_view.dart';
import '../../views/overview_view/overview_view.dart';

enum NavigationEvents {
  OverviewViewClickEvent,
  SymptomsViewClickEvent,
  ProtectionViewClickEvent
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  NavigationBloc(NavigationStates initialState) : super(initialState);

  @override
  NavigationStates get initialState => OverviewView();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.OverviewViewClickEvent:
        yield OverviewView();
        break;
      case NavigationEvents.SymptomsViewClickEvent:
        yield SymptomsView();
        break;
      case NavigationEvents.ProtectionViewClickEvent:
        yield ProtectionView();
        break;
    }
  }
}
