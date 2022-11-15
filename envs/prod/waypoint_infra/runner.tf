
/* Future improvement: manage runners with terraform


# Static runner
resource "aws_iam_role" "waypoint_static_runner_ecs" {
  name = "waypoint_static_runner_ecs"
  assume_role_policy = ""

  inline_policy {}
}

resource "aws_iam_role_policy_attachment" "waypoint_static_runner_ecs" {
  role       = aws_iam_role.waypoint_static_runner_ecs.name
  policy_arn = aws_iam_policy.waypoint_runner_ecs.arn
}

# Ondemand runner
resource "aws_iam_role" "waypoint_ondemand_runner_ecs" {
  name = "waypoint_ondemand_runner_ecs"
  assume_role_policy = ""

  inline_policy {}
}

resource "aws_iam_role_policy_attachment" "waypoint_ondemand_runner_ecs" {
  role       = aws_iam_role.waypoint_static_runner_ecs.name
  policy_arn = aws_iam_policy.waypoint_runner_ecs.arn
}

# All runners
resource "aws_iam_policy" "waypoint_runner_ecs" {
  # Allows waypoint runners (static and ondemand) to perform the standard set of actions
  # required by the waypoint build, deploy, and release plugins likely to be used
  # by apps that deploy onto ECS.

  # Future improvement: resource limiting
  # Future improvement: separate policies for static and on-demand runners

  name        = "waypoint_runner_ecs"
  path        = "/"
  description = "Policy enabling waypoint ecs runners"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:AuthorizeSecurityGroupIngress",
          "elasticloadbalancing:ModifyListener",
          "iam:CreateRole",
          "iam:AttachRolePolicy",
          "elasticloadbalancing:DeleteLoadBalancer",
          "elasticloadbalancing:DescribeLoadBalancers",
          "iam:ListAttachedRolePolicies",
          "ecs:RegisterTaskDefinition",
          "elasticloadbalancing:CreateRule",
          "route53:ListResourceRecordSets",
          "ecr:TagResource",
          "iam:GetRole",
          "ecr:CreateRepository",
          "ecs:CreateCluster",
          "ecr:GetDownloadUrlForLayer",
          "elasticloadbalancing:CreateTargetGroup",
          "route53:ChangeResourceRecordSets",
          "ecr:GetAuthorizationToken",
          "ecs:DeleteService",
          "logs:CreateLogGroup",
          "ecr:PutImage",
          "ecs:DescribeClusters",
          "ecr:UntagResource",
          "ecr:BatchGetImage",
          "ecr:DescribeImages",
          "elasticloadbalancing:DescribeRules",
          "ec2:DescribeSubnets",
          "ecr:InitiateLayerUpload",
          "ecr:PutImageTagMutability",
          "logs:DescribeLogStreams",
          "ecr:ListTagsForResource",
          "ecr:UploadLayerPart",
          "ecr:ListImages",
          "iam:PassRole",
          "ecs:CreateService",
          "elasticloadbalancing:CreateListener",
          "ecs:RunTask",
          "elasticloadbalancing:DescribeListeners",
          "ec2:CreateSecurityGroup",
          "ecs:ListTasks",
          "ecs:DescribeTasks",
          "ecr:CompleteLayerUpload",
          "ecr:DescribeRepositories",
          "ecs:DescribeServices",
          "ecr:ReplicateImage",
          "elasticloadbalancing:DeleteRule",
          "elasticloadbalancing:CreateLoadBalancer",
          "logs:DescribeLogGroups",
          "elasticloadbalancing:DeleteTargetGroup",
          "ec2:DescribeSecurityGroups",
          "elasticloadbalancing:DescribeTargetGroups",
          "ecr:GetRepositoryPolicy",
          "elasticloadbalancing:DeleteListener"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

*/
