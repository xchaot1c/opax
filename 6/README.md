
6. I'm not a fan of storing credentials as env variables, I would say it's always security concern. Depends on project specification and time factor I would consider using SSM, hashicorp vault etc. Maybe it's possible to use iam_roles to authenticate agains rds.
In terms of application configuration I would keep configuration in git where each configuration change will create new deployment, those configuration can be  
accessed by developers and changed.  Let's say that there is no time to create anything fancy and application support only env vairables as source properties so 
I would create wrapper script in docker ENTRYPOINT or CMD which based on environment type variable and service name it can use iam role to pull secretes from SSM.