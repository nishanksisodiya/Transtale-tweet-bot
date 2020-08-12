FROM python:3.8-alpine
RUN apk update
RUN apk add git
RUN apk add --update --no-cache g++ gcc libxslt-dev libxml2-dev

RUN mkdir /SuperGTBot && chmod 777 /SuperGTBot
ENV PATH="/SuperGTBot/bin:$PATH"
WORKDIR /SuperGTBot

RUN git clone https://github.com/nishanksisodiya/super-gt-bot /SuperGTBot
RUN pip install -r requirements.txt

#
# Copies session and config(if it exists)
#
#COPY ./sample_config.env ./userbot.session* ./config.env* /One4uBot/

#
# Finalization
#
CMD ["python3" ,"bots/translateTweet.py"]