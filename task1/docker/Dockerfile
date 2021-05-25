FROM python:3
ADD helloworld.py ./
RUN pip3 install flask
RUN pip3 install flask_restful
EXPOSE 6666
CMD [ "python", "./helloworld.py"]
