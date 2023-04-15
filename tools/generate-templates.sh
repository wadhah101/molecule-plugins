#!/bin/bash

rm -rf templates || true
mkdir -p templates
cd templates || exit 1

DRIVER_NAMES=(azure docker gce vagrant podman ec2)

for DRIVER_NAME in "${DRIVER_NAMES[@]}"; do
  molecule init role templates."${DRIVER_NAME}"plugin --driver-name="${DRIVER_NAME}"
done
