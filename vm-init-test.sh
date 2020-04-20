CLIQR_HOME=/usr/local/osmosix
. $CLIQR_HOME/etc/.osmosix.sh
. $CLIQR_HOME/etc/userenv
. $CLIQR_HOME/utils/agent_util.sh
. $CLIQR_HOME/service/utils/cfgutil.sh
. $CLIQR_HOME/service/utils/install_util.sh
. $CLIQR_HOME/service/utils/os_info_util.sh

touch /home/cliqruser/abc

if [ -d /home/$MY_USER ]; then
	sudo mkdir /home/$MY_USER/.ssh
	sudo chown $MY_USER:$MY_USER /home/$MY_USER/.ssh
	sudo chmod 700 /home/$MY_USER/.ssh
	sudo touch /home/$MY_USER/.ssh/authorized_keys
	sudo chown $MY_USER:$MY_USER /home/$MY_USER/.ssh/authorized_keys
	sudo chmod 600 /home/$MY_USER/.ssh/authorized_keys
else
	sudo adduser -m -d /home/$MY_USER $MY_USER
	sudo mkdir /home/$MY_USER/.ssh
	sudo chown $MY_USER:$MY_USER /home/$MY_USER/.ssh
	sudo chmod 700 /home/$MY_USER/.ssh
	sudo touch /home/$MY_USER/.ssh/authorized_keys
	sudo chown $MY_USER:$MY_USER /home/$MY_USER/.ssh/authorized_keys
	sudo chmod 600 /home/$MY_USER/.ssh/authorized_keys
fi

sudo usermod -aG wheel $MY_USER
sudo usermod -aG wheel cliqruser
sudo -i bash -c "echo \"$MY_USER  ALL= NOPASSWD: ALL\" >> /etc/sudoers"


echo "## Dynamically inserted key ##" >> /home/cliqruser/.ssh/authorized_keys
echo $MY_KEY >> /home/cliqruser/.ssh/authorized_keys
sudo bash -c "echo \"## Dynamically inserted key ##\" >> /home/$MY_USER/.ssh/authorized_keys"
sudo bash -c "echo $MY_KEY >> /home/$MY_USER/.ssh/authorized_keys"

exit 0
