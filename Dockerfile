FROM tutum/lamp:latest

ADD 000-default.conf /etc/apache2/sites-available/000-default.conf

ENV XCART_URL http://static.x-cart.com/software/x-cart-5.2.9-en.tgz
ENV XCART_TEMP_FILE xcart.tgz

RUN apt-get update
RUN apt-get install -y curl php5-gd php5-curl

RUN rm -rf /app && mkdir /app
RUN curl ${XCART_URL} -o ${XCART_TEMP_FILE}
RUN tar xzf ${XCART_TEMP_FILE} -C /app --strip-components=1 

EXPOSE 80 3306

CMD ["/run.sh"]
