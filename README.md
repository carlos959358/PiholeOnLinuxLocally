# pihole_locally
Running Pihole locally with Linux and Docker

# Step 0: Preparation

## Install Docker to the latest version

[Get-started with Docker](https://www.docker.com/get-started/)

## Clone this repository and move inside the folder
![Clone via https or ssh on the green button](images/CloneRepository.png)


# Step 1
## Configure DNS to always point to localhost
   1. Go to  `sudo nano /etc/systemd/resolved.conf`
   2. Change the option "#DNSStubListener=yes" to "DNSStubListener=no"
   3. Remove the file `resolv`: `sudo rm /etc/resolv.conf`
   4. Create symlink: `sudo ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf`
   5. Reload `systemd` service: `sudo systemctl restart systemd-resolved`

## Start Pihole container
   - Run `docker compose up -d` in the terminal

## Access Pihole Web Interface
   1. Go to your favorite web browser and search:
      - [127.0.0.1/admin/login](127.0.0.1/admin/login)
OR
      - [localhost/admin/login](localhost/admin/login)
   2. It should not require any password
      1. If you want to add a password go to `docker-compose.yml` and change the value of `FTLCONF_webserver_api_password` with your password 


# Step 2

Once installed and logged into the web browser, you will find something like this.

![Pihole start website](https://discourse.pi-hole.net/uploads/default/original/2X/6/6870dd70c8c2402b55619303d98e3877f3556139.png)

Now that the service is up you can add some domains to block.
On the left side you will find the options "Lists", once inside you could add lists to block or allow domains

![Adding lists to blacklists o whitelists](https://www.reddit.com/media?url=https%3A%2F%2Fpreview.redd.it%2Fnoob-here-how-to-add-to-blocklist-v0-xebar32u1gwe1.png%3Fwidth%3D1249%26auto%3Dwebp%26s%3D1f4313491b6d8a5a6a4fa1f1c3103a1081bfd5f2)


You can find some blacklists here:
- [hagezi github](https://github.com/hagezi/dns-blocklists)
- [Firebog website](https://firebog.net/)
- [blocklistprojecthub](https://github.com/blocklistproject/Lists)

# Resources

By default, the container is limited to <ins>**2 cores**</ins> and <ins>**4 GB of memory**</ins>.

It is possible to change it going to the docker compose file and modifying the properties

- **cpus**
- **memory**

# About the updates

There is a folder whith a cron and bash update file that updates once a day the lists of blacklist/whitelist domains

------ 

For further information you can look at the [Official Pi-hole GitHub](https://github.com/pi-hole/docker-pi-hole) or the [Official Pi-hole Website](https://pi-hole.net/)