/*

isc2ictchapter.org

*/

resource "aws_route53_zone" "isc2ictchapter_org" {
  name = "isc2ictchapter.org"
}

resource "aws_route53_record" "isc2ictchapter_org" {
  allow_overwrite = true
  name            = "isc2ictchapter.org"
  type            = "A"
  zone_id         = "Z1ZYJ2Y8I8U2IZ"

  alias {
      evaluate_target_health = false
      name = aws_cloudfront_distribution.s3_distribution.domain_name
      zone_id = "Z2FDTNDATAQYW2"
  }
}

resource "aws_route53_record" "www_isc2ictchapter_org" {
  allow_overwrite = true
  name            = "www.isc2ictchapter.org"
  type            = "CNAME"
  zone_id         = "Z1ZYJ2Y8I8U2IZ"
  ttl = 300
  
  records = [ aws_route53_zone.isc2ictchapter_org.name ]
}

/*

isc2wichitachapter.org

*/

resource "aws_route53_zone" "isc2wichitachapter_org" {
  name = "isc2wichitachapter.org"
}

resource "aws_route53_record" "isc2wichitachapter_org" {
  allow_overwrite = true
  name            = "isc2wichitachapter.org"
  type            = "A"
  zone_id         = "ZNW10JI9LJ2CP"

  alias {
      evaluate_target_health = false
      name = aws_cloudfront_distribution.s3_distribution.domain_name
      zone_id = "Z2FDTNDATAQYW2"
  }
}

resource "aws_route53_record" "www_isc2wichitachapter_org" {
  allow_overwrite = true
  name            = "www.isc2wichitachapter.org"
  type            = "CNAME"
  zone_id         = "ZNW10JI9LJ2CP"
  ttl = 300
  
  records = [ aws_route53_zone.isc2wichitachapter_org.name ]
}

/*

isc2ictchapter.com

*/

resource "aws_route53_zone" "isc2ictchapter_com" {
  name = "isc2ictchapter.com"
}

resource "aws_route53_record" "isc2ictchapter_com" {
  allow_overwrite = true
  name            = "isc2ictchapter.com"
  type            = "A"
  zone_id         = "ZTBG3Y95MZE1A"

  alias {
      evaluate_target_health = false
      name = aws_cloudfront_distribution.s3_distribution.domain_name
      zone_id = "Z2FDTNDATAQYW2"
  }
}

resource "aws_route53_record" "www_isc2ictchapter_com" {
  allow_overwrite = true
  name            = "www.isc2ictchapter.com"
  type            = "CNAME"
  zone_id         = "ZTBG3Y95MZE1A"
  ttl = 300
  
  records = [ aws_route53_zone.isc2ictchapter_com.name ]
}

/*

isc2wichitachapter.com

*/

resource "aws_route53_zone" "isc2wichitachapter_com" {
  name = "isc2wichitachapter.com"
}

resource "aws_route53_record" "isc2wichitachapter_com" {
  allow_overwrite = true
  name            = "isc2wichitachapter.com"
  type            = "A"
  zone_id         = "Z0197689DA35RKDR9DL6"

  alias {
      evaluate_target_health = false
      name = aws_cloudfront_distribution.s3_distribution.domain_name
      zone_id = "Z2FDTNDATAQYW2"
  }
}

resource "aws_route53_record" "www_isc2wichitachapter_com" {
  allow_overwrite = true
  name            = "www.isc2wichitachapter.com"
  type            = "CNAME"
  zone_id         = "Z0197689DA35RKDR9DL6"
  ttl = 300
  
  records = [ aws_route53_zone.isc2wichitachapter_com.name ]
}
