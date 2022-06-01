provider "aws" {
	 profile = "jeevan-iac"
}

resource "aws_s3_bucket" "myiacbucket" {
	bucket = "iacbucket2205"
	acl = "private"
}
resource "aws_s3_bucket_object" "object" {
  bucket = "${aws_s3_bucket.myiacbucket.id}"
  key    = "new_object_key"
  source = "../testfiles/sample.txt"
  etag = "${md5(file("../testfiles/sample.txt"))}"
}