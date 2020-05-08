# node demo app

## Docker
```
docker build -t yourlogin/node-demo-app .
docker push yourlogin/node-demo-app
```

## Debian package (\*.deb file)
```
docker build -t builddep -f Dockerfile.builddep .
docker run -it -v $PWD:/root builddep
cd /root
apt-get install -y npm    # install npm to be able to run npm install
git-buildpackage          # creates *.deb file in node-demo-app_<version>_<arch>.deb
cp ../*.deb .             # *.deb file is created 1 level lower, copy it to current level so it is saved in the volume
exit                      # exit container
```

## Create S3 debian repository
```
apt-get install aptly
aptly repo create -distribution=xenial -component=main release
aptly repo add release /mnt/deb # directory or *.deb file
```

edit S3 settings in ~/aptly.conf (only add public-read if you wantto make the S3 bucket public)
```
  ...
  "S3PublishEndpoints": {
    "spinnaker-debian-repo": {
      "region": "eu-west-1",
      "bucket": "spinnaker-debian-repo",
      "acl": "public-read",
      "awsAccessKeyID": "access key id",
      "awsSecretAccessKey": "aws secret access key"
    }
  },
  ...
```

Publish to S3
```
aptly publish repo release s3:spinnaker-debian-repo:
```

Update repo afterwards
```
aptly publish update xenial s3:spinnaker-debian-repo:
```
