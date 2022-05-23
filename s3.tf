/*

isc2wichitachapter.org

*/


resource "aws_s3_bucket" "isc2wichitachapter_org" {
  bucket        = "isc2wichitachapter.org"
}

resource "aws_s3_bucket_acl" "isc2wichitachapter_org" {
  bucket = aws_s3_bucket.isc2wichitachapter_org.id
  acl    = "public-read"
}

data "aws_iam_policy_document" "isc2wichitachapter_org" {
  statement {
    sid = "PublicReadGetObject"
    principals {
      type = "*"
      identifiers = ["*"]
    }
    effect    = "Allow"
    actions   = ["s3:GetObject"]
    resources = ["arn:aws:s3:::isc2wichitachapter.org/*"]
  }
}

resource "aws_s3_bucket_policy" "isc2wichitachapter_org" {
  bucket = aws_s3_bucket.isc2wichitachapter_org.id
  policy = data.aws_iam_policy_document.isc2wichitachapter_org.json
}

resource "aws_s3_bucket_website_configuration" "isc2wichitachapter_org" {
  bucket = aws_s3_bucket.isc2wichitachapter_org.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

#resource "aws_s3_object" "object" {
#  bucket = aws_s3_bucket.isc2wichitachapter_org.bucket
#  key    = "index.html"
#  acl    = "public-read"
#  source = "files/index.html"
#  etag = filemd5("files/index.html")
#  content_type = "text/html"
#  depends_on = [
#    aws_s3_bucket.isc2wichitachapter_org
#  ]
#}

resource "aws_s3_object" "html_object" {
  for_each = fileset("./files/", "**.html")
  bucket = aws_s3_bucket.isc2wichitachapter_org.bucket
  key = each.value
  source = "./files/${each.value}"
  etag = filemd5("./files/${each.value}")
  content_type = "text/html"
  acl    = "public-read"
}

resource "aws_s3_object" "css_object" {
  for_each = fileset("./files/", "*.css")
  bucket = aws_s3_bucket.isc2wichitachapter_org.bucket
  key = each.value
  source = "./files/${each.value}"
  etag = filemd5("./files/${each.value}")
  content_type = "text/css"
  acl    = "public-read"
}

resource "aws_s3_object" "svg_object" {
  for_each = fileset("./files/", "**/*.svg")
  bucket = aws_s3_bucket.isc2wichitachapter_org.bucket
  key = each.value
  source = "./files/${each.value}"
  etag = filemd5("./files/${each.value}")
  content_type = "image/svg+xml"
  acl    = "public-read"
}

resource "aws_s3_object" "png_object" {
  for_each = fileset("./files/", "**/*.png")
  bucket = aws_s3_bucket.isc2wichitachapter_org.bucket
  key = each.value
  source = "./files/${each.value}"
  etag = filemd5("./files/${each.value}")
  content_type = "image/png"
  acl    = "public-read"
}

resource "aws_s3_object" "jpeg_object" {
  for_each = fileset("./files/", "**/*.jpeg")
  bucket = aws_s3_bucket.isc2wichitachapter_org.bucket
  key = each.value
  source = "./files/${each.value}"
  etag = filemd5("./files/${each.value}")
  content_type = "image/jpeg"
  acl    = "public-read"
}


## Other resources will be uploaded manually


/*

isc2ictchapter.org

*/


resource "aws_s3_bucket" "isc2ictchapter_org" {
  bucket        = "isc2ictchapter.org"
}

resource "aws_s3_bucket_acl" "isc2ictchapter_org" {
  bucket = aws_s3_bucket.isc2ictchapter_org.id
  acl    = "private"
}

/*

isc2ictchapter.com

*/

resource "aws_s3_bucket" "isc2ictchapter_com" {
  bucket        = "isc2ictchapter.com"
}

resource "aws_s3_bucket_acl" "isc2ictchapter_com" {
  bucket = aws_s3_bucket.isc2ictchapter_com.id
  acl    = "private"
}


/*

isc2wichitachapter.com

*/

resource "aws_s3_bucket" "isc2wichitachapter_com" {
  bucket        = "isc2wichitachapter.com"
}

resource "aws_s3_bucket_acl" "isc2wichitachapter_com" {
  bucket = aws_s3_bucket.isc2wichitachapter_com.id
  acl    = "private"
}