# pihole_locally
Running Pihole locally with Linux and Docker

# Step 0: Preparation

## Install Docker to the latest version

[Get-started with Docker](https://www.docker.com/get-started/)

## Clone this repository and move inside the folder
![Clone via https or ssh on the green button](images/CloneRepository.png)


# Step 1:
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

------ 

For further information you can look at the [Official Pi-hole GitHub](https://github.com/pi-hole/docker-pi-hole) or the [Official Pi-hole Website](https://pi-hole.net/)