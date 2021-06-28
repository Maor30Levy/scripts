#/bin/bash
APP_NAME=$1
IP=$2
sudo yum install git -y
sudo amazon-linux-extras install nginx1
git clone https://github.com/Maor30Levy/$APP_NAME.git
sudo mv ./$APP_NAME/client/build /usr/share/nginx/$APP_NAME
sudo rm -rf /usr/share/nginx/html
sudo chmod 777 -R /etc/nginx/conf.d
cat <<HERE | sudo tee /etc/nginx/conf.d/$APP_NAME.conf
server{
    listen 80;
    listen [::]:80;
    
    root /usr/share/nginx/$APP_NAME;
    index index.html;

    server_name $IP;
}
HERE
sudo systemctl enable --now nginx
