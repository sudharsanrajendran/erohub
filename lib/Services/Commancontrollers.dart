import 'package:get/get.dart';

class RDFormController extends GetxController {
  var department = ''.obs;
  var organization = ''.obs;
  var domain = ''.obs;
  var category = ''.obs;
  void setFormData({
    required String department,
    required String organization,
    required String domain,
    required String category,
  })
  {
    this.department.value = department;
    this.organization.value =organization;
    this.domain.value = domain;
    this.category.value = category;
  }


}

