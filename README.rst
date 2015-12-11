===========================
Zalando Docker Python Image
===========================

This Docker base image contains Python (2.7, 3.4, or 3.5) and the Zalando CA certificate.
Versions of this image will be immutable, i.e. there is no "latest" tag, but instead version numbers are incremented
like::

    <PYTHON_VERSION>-<COUNTER> (example: "3.5.0-2")

Build the Docker image and squash it with a single command:

.. code-block::

    $ ./build.sh

You can find the `latest Python Docker image in our open source registry`_.

.. _latest Python Docker image in our open source registry: https://registry.opensource.zalan.do/teams/stups/artifacts/python/tags

