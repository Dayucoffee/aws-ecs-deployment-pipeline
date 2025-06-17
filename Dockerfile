# Use the latest Ubuntu image
FROM ubuntu:latest

# Install dependencies
RUN apt-get update
RUN apt-get -y install apache2

# Copy the index.html file to the container
COPY index.html /var/www/html/index.html

# Configure apache
RUN echo '. /etc/apache2/envvars' > /root/run_apache.sh && \
    echo 'mkdir -p /var/run/apache2' >> /root/run_apache.sh && \
    echo 'mkdir -p /var/lock/apache2' >> /root/run_apache.sh && \ 
    echo '/usr/sbin/apache2 -D FOREGROUND' >> /root/run_apache.sh && \ 
    chmod 755 /root/run_apache.sh

# Expose the necessary ports
EXPOSE 80

# Start Apache when the container runs
CMD /root/run_apache.sh