
output "random_string" {
  value = random_string.name.result
}

output "file_path" {
  description = "Where the greeting file was written."
  value       = local_file.example.filename
}