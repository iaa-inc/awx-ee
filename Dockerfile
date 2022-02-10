FROM quay.io/ansible/awx-ee:latest

RUN pip install arouteserver && curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python

ENV PATH "$HOME/.local/bin/:$HOME/.poetry/bin:$PATH"

RUN arouteserver setup --dest-dir ~/arouteserver 

USER root

ADD bgpq3-0.1.36.1-1.el8.x86_64.rpm /tmp/bgpq3-0.1.36.1-1.el8.x86_64.rpm 

RUN yum install -y /tmp/bgpq3-0.1.36.1-1.el8.x86_64.rpm
