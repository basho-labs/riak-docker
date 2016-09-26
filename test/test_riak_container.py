import pytest
from riak_docker.test_fixtures import client

class TestRiakContainer:

  def test_can_ping_cluster(self, client):
    # Should be able to ping the nodes on internal IP
    assert client.ping()
