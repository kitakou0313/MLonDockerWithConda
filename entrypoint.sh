#!/bin/bash --login
set -e
conda activate testenv
exec "$@"