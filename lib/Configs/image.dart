class Images {
  static const String splash="assets/images/splash.png";
  static const String logo = "assets/images/retreat_logo.png";
  static const String retreatImage="assets/images/retreat_image.png";
  static const String infoceptText="assets/images/infocept_text.png";
  static const String home="assets/images/home.png";
  static const String home1="assets/images/home1.png";
  static const String agenda="assets/images/agenda.png";
  static const String agenda1="assets/images/agenda1.png";
  static const String unconference="assets/images/unconference.png";
  static const String unconference1="assets/images/unconference1.png";
  static const String breather="assets/images/breather.png";
  static const String breather1="assets/images/breather1.png";
  static const String inforte1="assets/images/inforte1.png";
  static const String notifi="assets/images/notify.png";
  static const String notifiHome="assets/images/notify_home.png";
  static const String account="assets/images/account.png";
  static const String agendaImage="assets/images/agenda_image.png";
  static const String unconfImage="assets/images/unconf_image.png";
  static const String inforteImage="assets/images/inforte_image.png";
  static const String breatherImage="assets/images/breather_image.png";
  static const String travelImage="assets/images/travel_image.png";
  static const String homeTop="assets/images/home_top.png";
  static const String day1="assets/images/23Sept.png";
  static const String day2="assets/images/24Sept.png";
  static const String day3="assets/images/25Sept.png";


  ///Singleton factory
  static final Images _instance = Images._internal();

  factory Images() {
    return _instance;
  }

  Images._internal();
}
