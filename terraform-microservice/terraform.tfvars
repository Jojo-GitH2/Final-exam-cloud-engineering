do_token = "dop_v1_28727cc0c9fe34344c2b0bda25958d9a8be7a562b043e2d803fa3263095add6a"
label = "altschool-sock-shop"
k8s_version = "1.25.4-do.0"
# region = "lon1"
pools = [
  {
    name = "worker-pool"
    size : "s-2vcpu-2gb"
    count : 3
  }
]