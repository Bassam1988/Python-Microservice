FROM public.ecr.aws/lambda/python:3.11

RUN mkdir -p /app
COPY . /app/
WORKDIR /app
RUN pip install -r requirements.txt
EXPOSE 8080
CMD ["python","main.py" ]