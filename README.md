# aws credentials

## What is this?
expose updated aws credentials as an api, which can be used by postman for accessing aws resources. 

After you clone the repo locally, you can start the service in the container with command

```
docker-compose up -d
```

open the browser and open the url `http://localhost:4401/aws`

Add the following to the postman `Pre-request Script`

```
pm.sendRequest('http://localhost:4401/aws', function (err, res) {
    var data = res.json();
    pm.environment.set("aws_access_key_id", data.aws_access_key_id);
    pm.environment.set("aws_secret_access_key", data.aws_secret_access_key);
    pm.environment.set("aws_session_token", data.aws_session_token);
});
```

These variables can be used in the Authorization tab.

![alt text](https://github.com/kalramanoj2002/aws_credentials/blob/master/postman_authorization.png?raw=true)