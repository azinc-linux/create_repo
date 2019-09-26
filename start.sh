sudo yum install -y redhat-lsb-core wget rpmdevtools rpm-build createrepo yum-utils yum-plugin-remove-with-leaves
sudo wget http://mirror.linux-ia64.org/apache//httpd/httpd-2.4.41.tar.bz2
sudo rpmbuild -ts /home/vagrant/httpd-2.4.41.tar.bz2
sudo rpm -i /root/rpmbuild/SRPMS/httpd-2.4.41-1.src.rpm
sudo sed -i 's/\/var\/www/\/var\/www\/httpd24/g' /root/rpmbuild/SPECS/httpd.spec
sudo yum-builddep -y /root/rpmbuild/SPECS/httpd.spec
sudo yum remove -y apr --remove-leaves
sudo wget http://archive.apache.org/dist/apr/apr-1.5.2.tar.bz2
sudo yum install -y autoconf libtool doxygen
sudo rpmbuild -tb /home/vagrant/apr-1.5.2.tar.bz2
sudo yum localinstall -y /root/rpmbuild/RPMS/x86_64/apr-1.5.2-1.x86_64.rpm /root/rpmbuild/RPMS/x86_64/apr-devel-1.5.2-1.x86_64.rpm
sudo yum install -y apr-util-devel
sudo yum install -y zlib-devel libselinux-devel libuuid-devel pcre-devel openldap-devel lua-devel libxml2-devel openssl-devel
sudo rpmbuild -bb /root/rpmbuild/SPECS/httpd.spec
sudo yum localinstall -y /root/rpmbuild/RPMS/x86_64/httpd-2.4.41-1.x86_64.rpm
sudo service httpd restart
sudo mkdir /var/www/httpd24/html/repo
sudo cp /root/rpmbuild/RPMS/x86_64/*.rpm  /var/www/httpd24/html/repo
createrepo /var/www/httpd24/html/repo