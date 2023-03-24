FROM quay.io/ansible/awx-ee:21.13.0

RUN pip install arouteserver==1.1.0 && curl -sSL https://install.python-poetry.org | python3 -

RUN pip install envs

ENV PATH "$HOME/.local/bin/:$HOME/.poetry/bin:$PATH"

RUN arouteserver setup --dest-dir ~/arouteserver 

USER root

ADD bgpq4-1.9-1.el9.x86_64.rpm /tmp/bgpq4-1.9-1.el9.x86_64.rpm

RUN yum install -y /tmp/bgpq4-1.9-1.el9.x86_64.rpm

USER 1000
