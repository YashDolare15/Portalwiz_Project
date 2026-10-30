output "instance_id" {
  value = aws_instance.HELLO.id
}

output "instance_public_ip" {
  value = aws_instance.HELLO.public_ip
}
