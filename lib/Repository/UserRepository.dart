import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Api/api.dart';
import 'package:flutter_app/Models/model_login.dart';
import 'package:flutter_app/Utils/application.dart';
import 'package:flutter_app/Utils/preferences.dart';
import 'package:flutter_app/Utils/util_preferences.dart';


class UserRepository {

  ///Fetch api login
  Future<dynamic> login({String? mobile,String? password,}) async {
    final params = {"mobile":mobile,"password":password};
    return await Api.login(params);
  }

  //
  // ///Save Storage
  Future<dynamic> saveUser(User user) async {
    return await UtilPreferences.setString(
      Preferences.user,
      jsonEncode(user.toJson()),
    );
  }

  //Payment History
  Future<dynamic> fetchAttendanceHistory({String? userId}) async {
    final params = {"user_id":userId};
    return await Api.getAttendanceHistory(params);
  }

  Future<dynamic> fetchAgendaList({String? agendaDay}) async {
    final params = {"agenda_day":agendaDay};
    return await Api.getAgenta(params);
  }

  Future<dynamic> fetchBoothDetails({String? userId}) async {
    final params = {"user_id":userId};
    return await Api.getBoothDetails(params);
  }

  Future<dynamic> fetchVotingQue() async {
    return await Api.getVotingQue();
  }

  //
  // //save image
  // Future<dynamic> saveImage(String image) async {
  //   return await UtilPreferences.setString(
  //     Preferences.profilePic,image);
  // }
  //
  // //save cart
  // Future<dynamic> saveCart(CartModel cartModel) async {
  //   return await UtilPreferences.setString(
  //     Preferences.cart,
  //     jsonEncode(cartModel.cart.map((i) => Cart.toJson(i)).toList()).toString(),);
  // }
  //
  //
  // //category producer
  // Future<dynamic> fetchProducerCat({String lat,String long}) async {
  //   final params={"cust_lat":lat,"cust_long":long};
  //   return await Api.getProducerList(params);
  // }
  //
  // //api for product list as per producer
  // Future<dynamic> fetchProduct({String producerId,String type, String offset}) async {
  //   final params = {"producer_id":producerId,"type":type,"offset":offset};
  //
  //   return await Api.getProdList(params);
  // }
  //
  // //get cartList
  // //api for product list as per producer
  // Future<dynamic> fetchCartList({String fbId}) async {
  //   final params = {"user_id":fbId};
  //
  //   return await Api.getCartList(params);
  // }
  //
  // Future<dynamic> fetchAddressList({String fbId}) async {
  //   final params = {"userid":fbId};
  //   return await Api.getAddress(params);
  // }
  //
  // //fetch myOrders
  // Future<dynamic> fetchMyOrdersList({String fbId}) async
  // {
  //   final params = {"userid":fbId};
  //   return await Api.getOrdersList(params);
  // }
  //
  // //track order
  // Future<dynamic> fetchTrackOrdersList({String orderId}) async
  // {
  //   final params = {"order_details_id":orderId};
  //   return await Api.getTrackOrderList(params);
  // }
  //
  // Future<dynamic> fetchFleetOrdersList({String producerId,String status}) async
  // {
  //   final params = {"producerid":producerId,"status":status};
  //   return await Api.getFleetOrdersList(params);
  // }
  //
  // Future<dynamic> fetchFleetOrdersDet({String orderId,String status,String producerId}) async
  // {
  //   final params = {"orderid":orderId,"status":status,"producerid":producerId};
  //   return await Api.getFleetOrdersDet(params);
  // }
  //
  // //for temp and latLng
  // Future<dynamic> fetchFleetOrdersDetTemp({String orderId,String status}) async
  // {
  //   final params = {"order_details_id":orderId,"order_status":status};
  //   return await Api.getFleetOrdersDetTemp(params);
  // }
  //
  // //fleet return Replace
  // Future<dynamic> fetchFleetReturnReplace({String producerId}) async
  // {
  //   final params = {"producerid":producerId};
  //   return await Api.getFleetReturnReplace(params);
  // }
  //
  // Future<dynamic> fetchFleetInventory({String producerId}) async
  // {
  //   final params = {"producer_id":producerId};
  //   return await Api.viewInventoryList(params);
  // }
  //
  // Future<dynamic> fetchClaimOrdersList({String producerId,String claimType}) async
  // {
  //   final params = {"producer_id":producerId,"claim_type":claimType};
  //   return await Api.getClaimOrdersList(params);
  // }
  //
  // //faq List
  // Future<dynamic> getFAQList() async {
  //   return await Api.getFAQLIst();
  // }
  //
  // ///Get from Storage
  Future<dynamic> fetchUnconfAgendaList({String? eventType,String? userId,String? roomNo}) async {
    final params = {"event_type":eventType,"user_id":userId,"room_no":roomNo};
    return await Api.getAgendaUnconf(params);
  }

  Future<dynamic> fetchLivePollList({String? eventType,String? userId,String? roomNo}) async {
    final params = {"event_type":eventType,"user_id":userId,"room_no":roomNo};
    return await Api.getLivePoll(params);
  }

  Future<dynamic> fetchRoomList() async {
    return await Api.getRoomList();
  }
  dynamic getUser() {
    return UtilPreferences.getString(Preferences.user);
  }

  // ///Delete Storage
  Future<dynamic> deleteUser() async {
    return await UtilPreferences.remove(Preferences.user);
  }

  //get attendance data
  Future<dynamic> getAttendanceData({String? attendanceType,String? roomNo,}) async {
    final params = {"user_id":Application.user!.id.toString(),"attendance_type":attendanceType,"room_no":roomNo};
    return await Api.getAttendanceDeta(params);
  }

}

