
import 'package:get/get.dart';
import 'package:nondini_jewellery_admin/model/info_model.dart';
import 'package:nondini_jewellery_admin/model/product_status_change_model.dart';
import 'package:nondini_jewellery_admin/model/products_data_model.dart';
import 'package:nondini_jewellery_admin/utils.dart';

import '../services/api/api_client.dart';

class HomeController extends GetxController {

  Rx<ProductsDataModel> productsDataModel= ProductsDataModel().obs;
  Rx<InfoModel> infoModel= InfoModel().obs;
  Rx<ProductStatusChangeModel> statusChangeData = ProductStatusChangeModel().obs;
  RxBool isLoading = false.obs;



  Future<bool> getProducts() async {
      var response = await ApiClient().get('/get-product').catchError((e) {
       // Utils.showSnackBar(e.message);
        print(e.message);
      });
      if(response==null)return false;
      productsDataModel.value = productsDataModelFromJson(response);
      print("loaded");
      return true;
      update();
  }
  Future<void> postProducts(String proName, String proPrice, String proQnt) async {
    var body = {
      "product_name": proName,
      "product_price": proPrice,
      "product_quantity": proQnt,
    };
    print(body);
    var response = await ApiClient()
        .post('/add-product',body).catchError((e) {
      Utils.showSnackBar(e.message);
      print(e.message);
    });
    if(response==null)return;
    getProducts();
    Utils.showSnackBar('Added');
    update();
  }
  Future<void> editProducts(String proName, String proPrice, String proQnt,String id) async {
    productsDataModel.value.data?.clear();
    var body = {
      "product_name": proName,
      "product_price": proPrice,
      "product_quantity": proQnt,
    };
    print(body);
    var response = await ApiClient()
        .post('/edit-product/$id',body).catchError((e) {
      Utils.showSnackBar(e.message);
      print(e.message);
    });
    if(response==null)return;
    getProducts();
    Utils.showSnackBar('Added');
    update();
  }
  Future<void> deleteProducts(String id) async {
    var response = await ApiClient().get('/delete-product/$id').catchError((e) {
      // Utils.showSnackBar(e.message);
      print(e.message);
    });
    if(response==null)return;
    getProducts();
    Utils.showSnackBar('Deleted');
    update();
  }
  Future<void> getInfoData() async {
    var response = await ApiClient().get('/info').catchError((e) {
      // Utils.showSnackBar(e.message);
      print(e.message);
    });
    if(response==null)return;
    print(response);
    infoModel.value = infoModelFromJson(response);
    update();
  }
  Future<void> getStatusChange(String id) async {
    print('------------');
    var response = await ApiClient().get('/product-status-change/$id').catchError((e) {
      // Utils.showSnackBar(e.message);
      print(e.message);
    });
    if(response==null)return;
    statusChangeData.value = productStatusChangeModelFromJson(response);
    Utils.showSnackBar("Status changed");
    getProducts();
    update();
  }

  Future<void> postInfo(
      {String? msg, String? phn, String? wp}) async {
    var body = {
      "message": msg!=null?msg:infoModel.value.data?.first.message,
      "phone": phn!=null?phn:infoModel.value.data?.first.phone,
      "whatsapp": wp!=null?wp:infoModel.value.data?.first.whatsapp,
    };
    print(body);
    var response = await ApiClient()
        .post('/edit-info',body).catchError((e) {
      Utils.showSnackBar(e.message);
      print(e.message);
    });
    if(response==null)return;
    getInfoData();
    Utils.showSnackBar('Added');
    update();
  }
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getInfoData();
  }

}
