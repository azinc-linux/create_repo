## Создание RPM пакета
Для создания RPM пакета я использовал исходники apache.
	sudo wget http://mirror.linux-ia64.org/apache//httpd/httpd-2.4.41.tar.bz2
Из tarball  файла получил RPMS 
	rpmbuild -ts httpd-2.4.41.tar.bz2
	 ls /root/rpmbuild
	BUILD  BUILDROOT  RPMS  SOURCES  SPECS  SRPMS
Установил все необходимые пакеты требуемые для установки 
	yum-builddep ./httpd.spec
Дополнительно загрузил APR (apache portable runtime) библиотеки, требуемые для компиляции исходноика apache
	wget http://archive.apache.org/dist/apr/apr-1.5.2.tar.bz2
	rpmbuild -tb /apache/apr-1.5.2.tar.bz2
	yum localinstall -y ./apr-devel-1.5.2-1.x86_64.rpm
	yum localinstall -y ./apr-1.5.2-1.x86_64.rpm
В файл ./httpd.spec внес изменения, заменив ContentDir с /var/wwww на /var/wwww/httpd24
Запустил процесс компиляции
	rpmbuild -bb ./httpd.spec
В результате было сформировано несколько rpm пакетов составляющих дистрибутив apache
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
Запустил apache и проверил что он работает
	service httpd restart

	ps -ef | grep  httpd 
	root     29926     1  0 14:47 ?        00:00:00 /usr/sbin/httpd
	daemon   29928 29926  0 14:47 ?        00:00:00 /usr/sbin/httpd
	daemon   29929 29926  0 14:47 ?        00:00:00 /usr/sbin/httpd
	daemon   29930 29926  0 14:47 ?        00:00:00 /usr/sbin/httpd
***
## Создание репозитария
Для создания репозитария создал каталог /var/www/httpd24/html/repo. Перенес туда все пакеты из RPMS. 
	createrepo /var/www/httpd24/html/repo
	Spawning worker 0 with 9 pkgs
	Workers Finished
	Saving Primary metadata
	Saving file lists metadata
	Saving other metadata
	Generating sqlite DBs
	Sqlite DBs complete
	
В файле listing_repo.png  скриншот репозитария через web.
