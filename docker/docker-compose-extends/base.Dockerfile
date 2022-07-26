# base
FROM python:3.8-alpine

ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

# dependencies
#RUN apk --no-cache add gcc make g++ zlib-dev
ADD requirements.txt /deps/requirements.txt
RUN pip install -r /deps/requirements.txt

# add the code
WORKDIR /src
ADD boot.sh /src/boot.sh
RUN chmod +x /src/boot.sh

ADD main.py /src/main.py

# command
#CMD ["/src/boot.sh"]

