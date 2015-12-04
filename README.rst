alpine-pgbouncer
================
Minimalistic pgBouncer container with a small disk footprint (7.835 MB).

|Layers| |Stars| |Pulls|

To configure pgBouncer mount an external volume to ``/etc/pgbouncer`` with the
``pgbouncer.ini`` and ``userlist.txt`` file in them.

Example Usage
-------------

.. code-block::

    docker run --name pgbouncer -d -p 6432:6432 -v /home/core/pgbouncer:/etc/pgbouncer gavinmroy/alpine-pgbouncer

.. |Stars| image:: https://img.shields.io/docker/stars/gavinmroy/alpine-pgbouncer.svg?style=flat&1
   :target: https://hub.docker.com/r/gavinmroy/alpine-pgbouncer/

.. |Pulls| image:: https://img.shields.io/docker/pulls/gavinmroy/alpine-pgbouncer.svg?style=flat&1
   :target: https://hub.docker.com/r/gavinmroy/alpine-pgbouncer/

.. |Layers| image:: https://img.shields.io/imagelayers/image-size/gavinmroy/alpine-pgbouncer/latest.svg?style=flat&1
   :target: https://hub.docker.com/r/gavinmroy/alpine-pgbouncer/
