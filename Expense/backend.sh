dnf module list 
dnf module disable nodejs -y
dnf module enable nodejs:20 -y 
dnf install nodejs -y
useradd expense
cp backend.service  /etc/systemd/system/backend.service
mkdir /app 
curl -o /tmp/backend.zip https://expense-web-app.s3.amazonaws.com/backend.zip 
cd /app 
unzip -o /tmp/backend.zip
cd /app 
npm install 

chmod -R 775 /app
chown -R expense:expense /app
dnf install mysql-server -y
mysql -h 54.211.253.75 -uroot -pExpenseApp@1 < /app/schema/backend.sql
systemctl daemon-reload
systemctl enable backend
systemctl start backend
echo " Backend Done"
