FROM python:3.10-slim

ENV FLASK_APP microblog.py
ENV FLASK_ENV production

## Added 2 variables to let the Seeker agent know where to send information 
ENV SEEKER_SERVER_URL=https://poc243.seeker.synopsys.com:443
ENV SEEKER_PROJECT_KEY=microblog-api

COPY requirements.txt ./
RUN pip install -r requirements.txt

## Added pip installation of the Seeker agent
RUN pip install --trusted-host "poc243.seeker.synopsys.com" --extra-index-url "https://poc243.seeker.synopsys.com/pypi-server/simple" seeker-agent

COPY api api
COPY migrations migrations
COPY microblog.py config.py boot.sh ./

EXPOSE 5000
CMD ./boot.sh
