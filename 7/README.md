7. I would mount ebs volume to another instance so I can place public key to authorezied_keys root directory for this mounted volume, 
or just create ami and recreate the instance with new pem. However this would require to turn off the production instance, if this ec2 application
is stateless or it is running in HA with ASG(I would expect that prod instances are configured in this way) I would update launch template with new pem file
and then rollout the instance. Google says that there are other options eg. AWS Systems Manager but I've never tried anything like this and I hope I won't have to
as for now ssh-ca was working well for us.  
