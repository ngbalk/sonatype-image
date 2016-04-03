# Author: Nick Balkissoon

# This Dockerfile builds an image with the Sonatype Nexus IQ Lifecycle Server on it, allowing for security integrations.
# The UI can be accessed through port 8070 on the host machine.

# Run with: sudo docker run -p 8070:8070 -it sonatype

FROM centos

# Install unzip and java
RUN yum install -y unzip && yum install -y java

# Download Nexus IQ Lifcycle Server
ADD http://download.sonatype.com/clm/server/nexus-iq-server-1.17.0-02-bundle.zip?elqid=d68c23a6-5c1a-4919-bfce-09e93169cb4a /

# Unzip download
RUN unzip /nexus-iq-server-1.17.0-02-bundle.zip

# Expose container's port 8070 (will be mapped to 8070 on the host machine)
EXPOSE 8070

# Start server
ENTRYPOINT bash demo.sh


