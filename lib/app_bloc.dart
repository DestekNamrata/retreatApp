import 'package:flutter_app/Bloc/agenda/agenda_bloc.dart';
import 'package:flutter_app/Bloc/attendanceHistory/attendanceHistory_bloc.dart';
import 'package:flutter_app/Bloc/authentication/authentication_bloc.dart';
import 'package:flutter_app/Bloc/login/login_bloc.dart';
import 'package:flutter_app/Bloc/scanAndGetData/bloc.dart';
import 'package:flutter_app/Bloc/theme/theme_bloc.dart';
import 'package:flutter_app/Repository/UserRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AppBloc {
  static final userRepository = UserRepository();
  static final themeBloc = ThemeBloc();

  static final authBloc = AuthBloc(userRepository: userRepository);
  static final loginBloc = LoginBloc(userRepository: userRepository);
  static final scanAndGetDataBloc = ScanAndGetDataBloc(userRepository: userRepository);
  static final attendenceHistoryBloc = AttendenceHistoryBloc(attendenceHistoryRepo: userRepository);
  static final agendaDataBloc = AgendaBloc(agendaRepo: userRepository);
  // //customer
  // static final userRegBloc = UserRegBloc(userRepository: userRepository);
  // static final homeBloc = HomeBloc(homeRepository: userRepository);
  // static final cartBloc = CartBloc(cartRepository: userRepository);
  // static final addressBloc=AddressBloc(addressRepo:userRepository);
  // static final myOrdersBloc=MyOrdersBloc(ordersRepo:userRepository);
  // static final custOrdersDetBloc=CustOrderDetBloc(custOrdersDetRepo:userRepository);
  //
  // //fleet manager
  // static final fleetOrdersBloc=FleetOrdersBloc(fleetOrdersRepo:userRepository);
  // static final fleetInventBloc=InventoryBloc(inventoryRepo:userRepository);
  // static final claimBloc=ClaimOrdersBloc(claimRepo:userRepository);
  // static final producerProdBloc=ProducerProdBloc(producerProdRepo:userRepository);
  //
  // static final profileBloc=ProfileBloc(profileRepo:userRepository);
  //
  //
  static final List<BlocProvider> providers = [
    BlocProvider<ThemeBloc>(
      create: (context) => themeBloc,
    ),
    BlocProvider<AuthBloc>(
      create: (context) => authBloc,
    ),
    BlocProvider<LoginBloc>(
      create: (context) => loginBloc,
    ),
    BlocProvider<AttendenceHistoryBloc>(
      create: (context) => attendenceHistoryBloc,
    ),

    BlocProvider<ScanAndGetDataBloc>(
      create: (context) => scanAndGetDataBloc,
    ),
    BlocProvider<AgendaBloc>(
      create: (context) => agendaDataBloc,
    ),

  ];
  //
  static void dispose() {
    // applicationBloc.close();
    // languageBloc.close();
    themeBloc.close();
    authBloc.close();
    loginBloc.close();
    scanAndGetDataBloc.close();
    attendenceHistoryBloc.close();
    agendaDataBloc.close();
    // userRegBloc.close();
    // homeBloc.close();
    // cartBloc.close();
    // addressBloc.close();
    // myOrdersBloc.close();
    // fleetOrdersBloc.close();
    // claimBloc.close();
    // custOrdersDetBloc.close();
    // fleetInventBloc.close();
    // profileBloc.close();
    // producerProdBloc.close();
  }

  ///Singleton factory
  static final AppBloc _instance = AppBloc._internal();

  factory AppBloc() {
    return _instance;
  }

  AppBloc._internal();
}
