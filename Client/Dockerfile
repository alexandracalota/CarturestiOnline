FROM python
EXPOSE 3306
WORKDIR /Client
COPY requirements.txt /Client
RUN pip install -r requirements.txt
COPY client.py /Client
COPY templates /Client/templates
COPY static /Client/static/
CMD python client.py
