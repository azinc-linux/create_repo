## �������� RPM ������
��� �������� RPM ������ � ����������� ��������� apache.
	sudo wget http://mirror.linux-ia64.org/apache//httpd/httpd-2.4.41.tar.bz2
�� tarball  ����� ������� RPMS 
	rpmbuild -ts httpd-2.4.41.tar.bz2
	 ls /root/rpmbuild
	BUILD  BUILDROOT  RPMS  SOURCES  SPECS  SRPMS
��������� ��� ����������� ������ ��������� ��� ��������� 
	yum-builddep ./httpd.spec
������������� �������� APR (apache portable runtime) ����������, ��������� ��� ���������� ���������� apache
	wget http://archive.apache.org/dist/apr/apr-1.5.2.tar.bz2
	rpmbuild -tb /apache/apr-1.5.2.tar.bz2
	yum localinstall -y ./apr-devel-1.5.2-1.x86_64.rpm
	yum localinstall -y ./apr-1.5.2-1.x86_64.rpm
� ���� ./httpd.spec ���� ���������, ������� ContentDir � /var/wwww �� /var/wwww/httpd24
�������� ������� ����������
	rpmbuild -bb ./httpd.spec
� ���������� ���� ������������ ��������� rpm ������� ������������ ����������� apache
	ls /root/rpmbuild/RPMS/x86_6
        httpd-manual-2.4.41-1.x86_64.rpm
	httpd-tools-2.4.41-1.x86_64.rpm
        mod_authnz_ldap-2.4.41-1.x86_64.rpm
	httpd-2.4.41-1.x86_64.rpm           
	mod_lua-2.4.41-1.x86_64.rpm
	httpd-debuginfo-2.4.41-1.x86_64.rpm  
	mod_proxy_html-2.4.41-1.x86_64.rpm
	httpd-devel-2.4.41-1.x86_64.rpm      
	mod_ssl-2.4.41-1.x86_64.rpm
�������� apache � �������� ��� �� ��������
	service httpd restart

	ps -ef | grep  httpd 
	root     29926     1  0 14:47 ?        00:00:00 /usr/sbin/httpd
	daemon   29928 29926  0 14:47 ?        00:00:00 /usr/sbin/httpd
	daemon   29929 29926  0 14:47 ?        00:00:00 /usr/sbin/httpd
	daemon   29930 29926  0 14:47 ?        00:00:00 /usr/sbin/httpd
***
## �������� �����������
��� �������� ����������� ������ ������� /var/www/httpd24/html/repo. ������� ���� ��� ������ �� RPMS. 
	createrepo /var/www/httpd24/html/repo
	Spawning worker 0 with 9 pkgs
	Workers Finished
	Saving Primary metadata
	Saving file lists metadata
	Saving other metadata
	Generating sqlite DBs
	Sqlite DBs complete
	
� ����� listing_repo.png  �������� ����������� ����� web.
