FROM phusion/passenger-ruby23

ENV HOME /root

CMD ["/sbin/my_init"]

RUN apt-get update && apt-get install -y -o Dpkg::Options::="--force-confold" netcat tzdata

RUN rm -f /etc/service/nginx/down

RUN rm /etc/nginx/sites-enabled/default
ADD web/webapp.conf /etc/nginx/sites-enabled/webapp.conf
ADD web/rails-env.conf /etc/nginx/main.d/rails-env.conf

ADD Gemfile /tmp/
ADD Gemfile.lock /tmp/
RUN cd /tmp && bundle install

COPY . /home/app/rails
RUN usermod -u 1000 app
RUN chown -R app:app /home/app/rails
WORKDIR /home/app/rails

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 3002