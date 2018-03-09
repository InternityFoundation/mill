#!/usr/bin/env bash

set -eux

# Starting from scratch...
git clean -xdf

ci/publish-local.sh

git clean -xdf

# Second build & run tests using Mill

~/mill-release integration.test "mill.integration.forked.{AcyclicTests,UpickleTests,PlayJsonTests}"
