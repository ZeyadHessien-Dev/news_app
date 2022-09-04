// Basics
abstract class NewsLayoutStates {}
class InitialNewsLayoutState extends NewsLayoutStates {}
class ChangeBottomNavigatorState extends NewsLayoutStates {}


// APIS

// 1. Business
class LoadingBusinessNewsLayoutState extends NewsLayoutStates {}
class SuccessBusinessNewsLayoutState extends NewsLayoutStates {}
class ErrorBusinessNewsLayoutState extends NewsLayoutStates {
  final String error;
  ErrorBusinessNewsLayoutState(this.error);
}

// 2. Sport
class LoadingSportNewsLayoutState extends NewsLayoutStates {}
class SuccessSportNewsLayoutState extends NewsLayoutStates {}
class ErrorSportNewsLayoutState extends NewsLayoutStates {
  final String error;
  ErrorSportNewsLayoutState(this.error);
}

// 3. Science
class LoadingScienceNewsLayoutState extends NewsLayoutStates {}
class SuccessScienceNewsLayoutState extends NewsLayoutStates {}
class ErrorScienceNewsLayoutState extends NewsLayoutStates {
  final String error;
  ErrorScienceNewsLayoutState(this.error);
}

// 4. Search
class LoadingSearchNewsLayoutState extends NewsLayoutStates {}
class SuccessSearchNewsLayoutState extends NewsLayoutStates {}
class ErrorSearchNewsLayoutState extends NewsLayoutStates {
  final String error;
  ErrorSearchNewsLayoutState(this.error);
}