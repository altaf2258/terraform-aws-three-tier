output "vpc_id" {
  value = aws_vpc.this.id
}

output "internet_gateway_id" {
  value = try(aws_internet_gateway.this[0].id, null)
}
output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}