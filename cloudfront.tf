resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = "isc2wichitachapter.org.s3.us-east-1.amazonaws.com"
    origin_id   = aws_route53_zone.isc2wichitachapter_org.name
    connection_attempts = 3
    connection_timeout = 10
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "isc2wichitachapter.org"
  default_root_object = "index.html"

  aliases = [ aws_route53_zone.isc2wichitachapter_com.name , aws_route53_zone.isc2ictchapter_com.name, aws_route53_zone.isc2wichitachapter_org.name, aws_route53_zone.isc2ictchapter_org.name ]

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = aws_route53_zone.isc2wichitachapter_org.name
    cache_policy_id = "658327ea-f89d-4fab-a63d-7e88639e58f6"
    compress = true

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
  }

  

  price_class = "PriceClass_100"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = {
    Environment = "production"
  }

  viewer_certificate {
    minimum_protocol_version = "TLSv1.2_2021"
    ssl_support_method = "sni-only"
    acm_certificate_arn = "arn:aws:acm:us-east-1:486787978315:certificate/e90b124b-ab78-45e7-9c06-85f04f43b874"
  }
}