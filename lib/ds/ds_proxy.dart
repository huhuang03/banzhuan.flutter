import 'package:get_storage/get_storage.dart';

final box = GetStorage();

const KEY_PROXY_HOST = "key_proxy_host";
const KEY_PROXY_PORT = "key_proxy_port";

void setProxyPort(String proxyPort) {
  box.write(KEY_PROXY_PORT, proxyPort);
}

void setProxyHost(String host) {
  box.write(KEY_PROXY_HOST, host);
}

void setProxy(String host, String port) {
  setProxyHost(host);
  setProxyPort(port);
}

String getProxyPort() {
  return box.read(KEY_PROXY_PORT);
}

String getProxyHost() {
  return box.read(KEY_PROXY_HOST);
}

bool hasProxy() {
  return false;
}