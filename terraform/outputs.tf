# Output values will be added after we create AWS resources.

output "ec2_instance_id" {

  description = "ID of the public EC2 instance"
  value       = aws_instance.public.id

}

output "ec2_public_ip" {

  description = "Public IP address of the public ec2 instance"
  value       = aws_instance.public.public_ip

}

output "ec2_private_ip" {

  description = "Private IP address of the public ec2 instance"
  value       = aws_instance.public.private_ip

}


