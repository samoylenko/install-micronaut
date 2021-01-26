#!/usr/bin/env sh

set -e

# Defaults
MICRONAUT_VERSION="2.3.0"
MICRONAUT_INSTALL_DIR="${HOME}/.micronaut"
ENVIRONMENT_FILE="${HOME}/.profile"

# Tracks changes made by this script
SCRIPT_GUID="f6079664-1c2e-4e83-b115-07a630d6a7dc"

# Autos
TEMP_FILE="$(mktemp)"
PATH_COMMAND="export PATH=${MICRONAUT_INSTALL_DIR}/micronaut-cli-${MICRONAUT_VERSION}/bin/:\${PATH}"

echo "Downloading Micronaut v${MICRONAUT_VERSION} to ${TEMP_FILE}"
curl -L "https://github.com/micronaut-projects/micronaut-starter/releases/download/v${MICRONAUT_VERSION}/micronaut-cli-${MICRONAUT_VERSION}.zip" -o "${TEMP_FILE}"

echo "Creating ${MICRONAUT_INSTALL_DIR}"
mkdir -p "${MICRONAUT_INSTALL_DIR}"

echo "Unpacking Micronaut to ${MICRONAUT_INSTALL_DIR}"
unzip -o -d "${MICRONAUT_INSTALL_DIR}" "${TEMP_FILE}"

echo "Removing any previously made changes to ${ENVIRONMENT_FILE}"
[ -f "${ENVIRONMENT_FILE}" ] && sed -i "/${SCRIPT_GUID}/d" "${ENVIRONMENT_FILE}"

echo "Adding Micronaut path to ${ENVIRONMENT_FILE}"
echo "${PATH_COMMAND} # ${SCRIPT_GUID}" >> "${ENVIRONMENT_FILE}"

echo "Applying changes to the current session"
# shellcheck source="${HOME}/.profile"
. "${ENVIRONMENT_FILE}"
