# Cluster RabbitMQ :rabbit:

There are a lots of good options if you want to run a [RabbitMQ](https://hub.docker.com/_/rabbitmq/) cluster in [docker](http://docker.com/). Here's an solution that only rely on [docker official images](https://hub.docker.com/_/rabbitmq/) :tada:

The main benifit with this approach is that you can use [any version](https://hub.docker.com/r/library/rabbitmq/tags/) of RabbitMQ, which is maintaied by docker and will be up-to-date with future releases.

## Changelog after forked (at 2023/04/10)

* Change container image tag to specific version
  - Update latest image tag of RabbitMQ: `3-management` to `3.11.13-management-alpine`
  - Update latest image tag of HA Proxy: `1.7` to `2.7.6-alpine3.17`

* Increase RabbitMQ containers : 3 -> 7
  - Rename rabbitmq1 to rabbitmq-main and deploy 3 container as scalable.
  - Rename/Remove rabbitmq2 to rabbitmq-node and deploy 4 container as scalable.
  - Change `depends_on` containers; 
    - rabbitmq-main >> rabbitmq-node
    - (rabbitmq-main, rabbitmq-node) >> haproxy

* Add `always` restart policy for HA Proxy.

* Add container-shared network as `bridge mode`: `rabbitmq_cluster_network`

## Install

```
> # Clone repository
> git clone https://github.com/pardahlman/docker-rabbitmq-cluster.git
> cd docker-rabbitmq-cluster
>
> # Start development
> docker-compose up
> 
> # Start long-options with daemon
> docker-compose --env-file ./.env --file ./docker-compose.yml up -d
```

Most things will be how you expect:

* The default username and password are `rabbitmq`/`changeme`
* The broker accepts connections on `localhost:5672`
  - AMQP : `localhost:5672`
  - MQTT : `localhost:1883`
  - STOMP : `localhost:15672`
* The Management interface is found at `localhost:15672`

## How to monitor/view for containers included RabbitMQ, HA Proxy that.
```
> # check containers
> docker-compose ps
>
> # trailing logs with latest 100 lines for all containers
> docker-compose logs --tail=100 -f
```

## Customize

The `.env` file contains environment variables that can be used to change the default username, password and virtual host.

## HA Proxy

This `docker-compose.yml` file comes with the latest version of [HA Proxy](http://www.haproxy.org/), an open source software that provides a high availability load balancer and proxy server.

It should be fairly easy to add a [`port mapping`](https://docs.docker.com/compose/compose-file/#ports) for the individual containers if it is desired to connect to a specific broker node.

## Uninstall

```
> cd docker-rabbitmq-cluster
>
> # Stop rabbitmq-cluster with 60 seconds timeout.
> docker-compose down --timeout 60
>
> # Purge all
> docker-compose down --rmi all --remove-orphans
```

## Read more

I wrote [a blog post](http://fellowdeveloper.se/2017/05/24/cluster-rabbitmq-in-docker/) that explains some of the ideas behind this repo.

