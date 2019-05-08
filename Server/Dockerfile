FROM python
EXPOSE 3306
WORKDIR /Server
COPY requirements.txt /Server
RUN pip install -r requirements.txt
COPY server.py /Server
COPY templates /Server/templates
COPY static /Server/static/
CMD python server.py
