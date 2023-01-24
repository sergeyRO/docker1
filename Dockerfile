FROM python:3.9.6-alpine
WORKDIR /app
RUN pip install --upgrade pip
RUN mkdir -p /app
RUN mkdir -p /app/stocks_products/stocks_products
RUN mkdir -p /app/stocks_products/logistic
ADD ./* /app
ADD ./stocks_products/stocks_products /app/stocks_products/stocks_products
ADD ./stocks_products/logistic /app/stocks_products/logistic
RUN ls -lrt /app
RUN pip install -r requirements.txt
RUN python manage.py makemigrations
RUN python manage.py migrate
EXPOSE 8080
CMD ["python","manage.py","runserver","0.0.0.0:8080"]
