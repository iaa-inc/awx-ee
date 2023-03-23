FROM quay.io/ansible/awx-ee:latest

RUN pip install arouteserver==1.1.0 && curl -sSL https://install.python-poetry.org | python3 -

RUN pip install envs

ENV PATH "$HOME/.local/bin/:$HOME/.poetry/bin:$PATH"

RUN arouteserver setup --dest-dir ~/arouteserver 

USER root

ADD bgpq3-0.1.36.1-1.el8.x86_64.rpm /tmp/bgpq3-0.1.36.1-1.el8.x86_64.rpm 

RUN yum install -y /tmp/bgpq3-0.1.36.1-1.el8.x86_64.rpm

USER 1000
