FROM edxops/xenial-common:latest
RUN apt-get update && apt-get install -y \
    libblas-dev \
    liblapack-dev \
    gfortran \
    python3-dev \
&& rm -rf /var/lib/apt/lists/*
RUN easy_install pip
RUN pip install \
    numpy \
    'pyparsing==2.2.0' \
    tox \
;
RUN mkdir -p /usr/local/src/openedx-calc
WORKDIR /usr/local/src/openedx-calc
ADD . .
CMD ["make", "test"]
