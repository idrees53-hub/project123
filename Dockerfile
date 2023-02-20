FROM	centos:latest
RUN	sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
	sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-* && \ 
	yum -y install unzip httpd
ADD	 https://templatemo.com/tm-zip-files-2020/templatemo_520_highway.zip /var/www/html
WORKDIR	/var/www/html
RUN	unzip templatemo_520_highway.zip  && \
	cp -rf templatemo_520_highway/* .
EXPOSE	80
CMD	["/usr/sbin/httpd", "-D", "FOREGROUND"]
