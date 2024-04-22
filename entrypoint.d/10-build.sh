#!/bin/bash
set -euo pipefail
set -x

if [ "${RUN_DEFAULT_BUILD}" = "true" ]; then
    rpm -Uvh ~/downloads/*.src.rpm

    cd ~/rpmbuild/SPECS/
    dnf --enablerepo crb builddep -y ./*.spec
    echo "${BUILD_OPTS}" | xargs -t rpmbuild -bb ./*.spec
fi
