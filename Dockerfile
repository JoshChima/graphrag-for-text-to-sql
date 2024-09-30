FROM mcr.microsoft.com/vscode/devcontainers/python:1-3.10-bookworm
# FROM python:3.10.14-bookworm
# ENV PYTHONUNBUFFERED 1
# RUN apt-get -y update
# RUN apt-get install -y sqlite3

# # Download the latest release of SQLite source code and build the source
# # amalgamation files (sqlite3.c and sqlite3.h).
# RUN wget https://www.sqlite.org/src/tarball/sqlite.tar.gz?r=release \
#     -O sqlite.tar.gz
# RUN tar xzf sqlite.tar.gz
# RUN cd sqlite/
# RUN ./configure
# RUN make sqlite3.c

# # Copy the sqlite3 amalgamation files into the root of the pysqlite3 checkout
# # and run build_static + build:
# RUN cp sqlite/sqlite3.[ch] pysqlite3/
# RUN cd pysqlite3
# RUN python setup.py build_static build
# ENV PYTHONUNBUFFERED 1
# add PYTHONPATH to the container
# ENV PYTHONPATH=/app
RUN apt-get -y update
RUN apt-get install -y sqlite3
RUN sudo apt update

RUN python3 -m pip install --user pipx
RUN python3 -m pipx ensurepath

RUN pipx install poetry
RUN poetry config virtualenvs.in-project true

# RUN pip install --upgrade pip
# RUN pip install openai
# RUN pip install graphrag
# RUN pip install 'networkx[default]'
# RUN pip install 'vanna[chromadb,openai]'
# RUN pip install ipykernel
# RUN pip install langchain
# RUN pip install langchain-openai
# RUN pip install langchain-community
# RUN pip install langgraph
# RUN pip install langchain-cli
# EXPOSE 80