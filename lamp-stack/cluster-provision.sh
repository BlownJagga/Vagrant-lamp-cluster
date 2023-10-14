#!/bin/bash

# Variables
MASTER_IP="[Master_Node_IP]"
SLAVE_IP="[Slave_Node_IP]"
MYSQL_ROOT_PASSWORD="[Your_MySQL_Root_Password]"
DEFAULT_PASSWORD="[Your_Default_Password]"

# Function to display a message with timestamp
log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1"
}

# Step 1: Provision Ubuntu VMs with Vagrant
log "Step 1: Provisioning Ubuntu VMs with Vagrant"
vagrant up

# Step 2: Create user 'altschool' with root privileges on the Master node
log "Step 2: Creating 'altschool' user on the Master node with root privileges"
vagrant ssh master -c "sudo useradd -m -G sudo altschool"
vagrant ssh master -c "echo 'altschool:altschool_password' | sudo chpasswd"

# Step 3: Enable SSH key-based authentication from Master to Slave
log "Step 3: Setting up SSH key-based authentication from Master to Slave"
vagrant ssh master -c "ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa"
vagrant ssh master -c "ssh-copy-id altschool@$SLAVE_IP"

# Step 4: Copy data from Master to Slave
log "Step 4: Copying data from Master to Slave"
vagrant ssh master -c "scp -r /mnt/altschool altschool@$SLAVE_IP:/mnt/altschool/slave"

# Step 5: Process Monitoring on the Master node
log "Step 5: Displaying process overview on the Master node"
vagrant ssh master -c "top"

# Step 6: Install LAMP Stack on both nodes
log "Step 6: Installing LAMP Stack on both nodes"
vagrant ssh master -c "sudo apt-get update"
vagrant ssh master -c "sudo apt-get install -y apache2"
vagrant ssh master -c "sudo systemctl enable apache2"
vagrant ssh master -c "sudo apt-get install -y mysql-server"
vagrant ssh master -c "sudo mysql_secure_installation"
vagrant ssh master -c "sudo apt-get install -y php libapache2-mod-php php-mysql"
vagrant ssh master -c "sudo systemctl restart apache2"

# Step 7: Validate LAMP Stack
log "Step 7: Validating LAMP Stack"
vagrant ssh master -c "echo '<?php phpinfo(); ?>' | sudo tee /var/www/html/info.php"
log "Access 'http://$MASTER_IP/info.php' and 'http://$SLAVE_IP/info.php' to validate PHP."

# Step 8: Provide Documentation
log "Step 8: Documentation is ready."

# End of script
log "Deployment complete."

