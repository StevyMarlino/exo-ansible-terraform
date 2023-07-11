FROM marwaney/ssh-server

RUN groupadd galaxiera

RUN sudo passwd -d sshuser && usermod -aG sudo sshuser

RUN mkdir -p /home/sshuser/.ssh
COPY ./stevy.pub /home/sshuser/.ssh/authorized_keys

RUN chown sshuser:galaxiera /home/sshuser/.ssh/authorized_keys