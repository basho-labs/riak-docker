import json
import pytest
import subprocess
from riak import RiakClient, RiakNode

@pytest.fixture
def client(request):
  ids = subprocess.check_output(['docker', 'ps', '-qaf', 'label=role=cluster']).strip().split('\n')
  info = json.loads(subprocess.check_output(['docker', 'inspect'] + ids))
  ips = [(i['NetworkSettings']['Networks']).values()[0]['IPAddress'] for i in info]
  return RiakClient(nodes=[RiakNode(host=ip) for ip in ips])
