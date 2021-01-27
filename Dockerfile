FROM centos:7
MAINTAINER xaxiong "549018964@qq.com"
RUN yum install -y gcc-c++ zlib-devel pcre-devel make git
RUN git clone https://github.com/xaxiong/dockerfiles.git . && cd dockerfiles/nginx
ADD nginx-1.16.1.tar.gz /tmp
RUN cd /tmp/nginx-1.16.1 && ./configure --prefix=/usr/local/nginx && make -j 2 && make install
RUN rm -f /usr/local/nginx/conf/nginx.conf
COPY nginx.conf /usr/local/nginx/conf
 
EXPOSE 80
CMD ["/usr/local/nginx/sbin/nginx", "-g", "daemon off;"]