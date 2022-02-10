FROM quay.io/ansible/awx-ee:latest

RUN pip install arouteserver && curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python

ENV PATH "$HOME/.local/bin/:$HOME/.poetry/bin:$PATH"

RUN arouteserver setup --dest-dir ~/arouteserver 
