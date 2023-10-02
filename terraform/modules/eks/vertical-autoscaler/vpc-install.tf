# resource "null_resource" "git_clone" {
#   provisioner "local-exec" {
#     command = "git clone https://github.com/kubernetes/autoscaler.git"
#   }
# }

# resource "null_resource" "install_vpa" {
#   depends_on = [ null_resource.git_clone ]
#   provisioner "local-exec" {
#     command = "${path.module}/autoscaler/vertical-pod-autoscaler/hack/vpa-up.sh"
#   }
# }

# resource "null_resource" "remove_git_clone_autoscaler_folder" {
#   provisioner "local-exec" {
#     command = "rm -rf ${path.module}/autoscaler"
#   }
#   when = destroy
# }

# resource "null_resource" "uninstall_vpa" {
#   depends_on = [ null_resource.remove_git_clone_autoscaler_folder ]
#   provisioner "local-exec" {
#     command = "${path.module}/autoscaler/vertical-pod-autoscaler/hack/vpa-down.sh"
#   }
#   when = destroy
# }