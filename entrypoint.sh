#!/bin/bash
set -e

if [ -d /entrypoint.d/ ]; then
    find /entrypoint.d/ -type f -name "*.sh" -exec chmod +x {} \;
    sync
    find /entrypoint.d/ -type f -name "*.sh" -exec echo Running {} \; -exec {} \;
fi
