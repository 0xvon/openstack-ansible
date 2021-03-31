### Usage

#### 0. Install Virtualbox and Vagrant

Virtualbox
https://www.virtualbox.org/wiki/Downloads

Vagrant
https://www.vagrantup.com/

#### 1. Deploy VM

```
$ vagrant up
$ vagrant plugin install vagrant-vbguest --plugin-version 0.21
$ vagrant reload
```

### Error Solving

#### 1. Running packstack error

```
Installing:
Clean Up                                             [ DONE ]
Discovering ip protocol version                      [ DONE ]
Setting up ssh keys                                  [ DONE ]
Preparing servers                                    [ DONE ]
Pre installing Puppet and discovering hosts' details[ ERROR ]

ERROR : Failed to run remote script, stdout:
stderr: Warning: Permanently added '10.43.166.180' (ECDSA) to the list of known hosts.
+ trap t ERR
+ facter -p
facter: error while loading shared libraries: leatherman_curl.so.1.3.0: cannot open shared object file: No such file or directory
++ t
++ exit 127

...
```

then
```
$ vagrant ssh
$ sudo yum downgrade leatherman
$ packstack --answer-file=~/answer.cfg
```