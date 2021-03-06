### description

This repo contains a vagrant project to deploy the
[API](https://github.com/TransitSurveyor/API) component. You must have
[Vagrant](https://docs.vagrantup.com/v2/installation/index.html) and
[VirtualBox](https://www.virtualbox.org/wiki/Linux_Downloads) installed.
This is still a work in progress. Next steps will be to get the postgres
instance setup and loaded with data.

### setup

Build your local environment

```
# download ubuntu/trusty64 box
vagrant box add ubuntu/trusty64 https://vagrantcloud.com/ubuntu/boxes/trusty64/versions/14.04/providers/virtualbox.box

# clone repo
git clone https://github.com/TransitSurveyor/Deploy.git
cd Deploy

# build environment
vagrant up
```

If everything works the API will be running at `localhost:9000`. You will also
find an `api` and `data` folder inside this directory.

+ `api` contains a [local git repo](https://github.com/TransitSurveyor/API)
that is the code running on the vm.
+ `data` contains a [local git repo](https://github.com/TransitSurveyor/Data)
that is the code to build data dependencies.

### tests

There are a couple basic test cases to run after the vm is succesfully built

```
vagrant ssh
sudo su -c "python /vagrant/api/tests.py" onoff
```

