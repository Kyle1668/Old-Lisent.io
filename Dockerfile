FROM heroku/miniconda

# Grab requirements.txt.
#ADD ./webapp/requirements.txt /tmp/requirements.txt
#ADD . /

# Install dependencies
#RUN ls
#RUN pip install -qr ~/requirements.txt

# Add our code
#ADD ./webapp /opt/webapp/
#WORKDIR /opt/webapp

RUN pip install -U textblob
RUN python -m textblob.download_corpora
#RUN conda install -c https://conda.anaconda.org/sloria textblob
