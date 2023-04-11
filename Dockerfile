FROM quay.io/ansible/awx-ee:21.13.0

USER root

ADD bgpq3-0.1.36.1-1.el8.x86_64.rpm /tmp/bgpq3-0.1.36.1-1.el8.x86_64.rpm

RUN yum install -y /tmp/bgpq3-0.1.36.1-1.el8.x86_64.rpm \
    && yum clean all \
    && rm -rf /var/cache/yum \
    && rm -rf /tmp/bgpq3- \
    && curl -sSL https://install.python-poetry.org | python3 -

ENV PATH "$HOME/.local/bin/:$HOME/.poetry/bin:$PATH"

COPY requirements.txt /tmp/requirements.txt

RUN pip3 install -r /tmp/requirements.txt

USER 1000
RUN arouteserver setup --dest-dir ~/arouteserver
