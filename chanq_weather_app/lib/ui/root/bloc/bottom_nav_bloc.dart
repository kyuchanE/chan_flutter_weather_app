import 'package:bloc/bloc.dart';

enum BottomNavItems {
  tab1,
  tab2,
  tab3,
}

class BottomNavBloc extends Bloc<BottomNavItems, BottomNavItems> {
  BottomNavBloc() : super(BottomNavItems.tab1) {
    on<BottomNavItems>((event, emit) {
      emit(event);
    });
  }
}
