String get apiHost {
  bool idProd = const bool.fromEnvironment("dart.vm.product");
  if (idProd) {
    return "http://ec2-44-203-185-19.compute-1.amazonaws.com:8000/api/v1";
  }
  return "http://172.31.48.1:8080/api/v1";
}
