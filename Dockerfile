FROM marwaney/ssh-server

RUN sudo passwd -d sshuser && usermod -aG sudo sshuser

RUN mkdir -p /home/sshuser/.ssh
COPY ./stevy.pub /home/sshuser/.ssh/authorized_keys

RUN chown sshuser:sshgroup -R /home/sshuser/.ssh