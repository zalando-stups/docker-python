===========================
Zalando Docker Python Image
===========================

This Docker base image contains Python 3.5 and the Zalando CA certificate.
Versions of this image will be immutable, i.e. there is no "latest" tag, but instead version numbers are incremented
like::

    <PYTHON_VERSION>-<COUNTER> (example: "3.5.0-2")

Build the Docker image:

.. code-block::

    $ docker build -t stups/python:dev .

You can find the `latest Python Docker image in our open source registry`_.

.. _latest Python Docker image in our open source registry: https://registry.opensource.zalan.do/teams/stups/artifacts/python/tags

