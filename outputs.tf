output "ctfd_publicip" {
  description = "Public IP of the instance"
  value = aws_lightsail_instance.ctf_instance.public_ip_address
}
output "CONNECT" {
  value = "After several minutes, attempt to connect via browser to your CTFd instance using the public IP address. If you see a '502 Bad Gateway' error, wait a bit longer and then refresh."
}
output "WAIT" {
  value = "Install requires about 10 minutes. Please wait a bit."
}
