locals {
    instance_type = "t3.micro"                                   #  instance_type = local.instance_type
    common_name = "${var.project}-${var.environment}"  #terraform considers this as local.common_name and i can use this in any file with in the same resource 
    ec2_tags = merge (
        var.ec2_tags, 
        {
    Name = "${local.common_name}-local-work"        
        }
    )
}