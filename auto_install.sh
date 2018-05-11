#!/usr/bin/env bash
pushd "$( dirname "${BASH_SOURCE[0]}" )" > /dev/null
SETUP_DIR="$( pwd )"
RPI_SETUP_DIR=$SETUP_DIR/vocalfusion-rpi-setup
AVS_SETUP_DIR=$SETUP_DIR/avs-sdk-setup

if [ ! -d $RPI_SETUP_DIR ]; then
  git clone -b v1.1 git://github.com/xmos/vocalfusion-rpi-setup.git
elif ! git -C $RPI_SETUP_DIR diff-index --quiet HEAD --; then
  echo "Changes found in $RPI_SETUP_DIR. Please revert changes, or delete directory, and then rerun."
  echo "Exiting install script."
  popd > /dev/null
  return
fi

if [ ! -d $AVS_SETUP_DIR ]; then
  git clone -b v1.5 git://github.com/xmos/avs-sdk-setup.git
elif ! git -C $AVS_SETUP_DIR diff-index --quiet HEAD --; then
  echo "Changes found in $AVS_SETUP_DIR. Please revert changes, or delete directory, and then rerun."
  echo "Exiting install script."
  popd > /dev/null
  return
fi

# Execute (rather than source) the setup scripts
echo "Installing VocalFusion Raspberry Pi Setup..."
$RPI_SETUP_DIR/setup.sh

echo "Installing Amazon AVS SDK..."
$AVS_SETUP_DIR/setup.sh

echo "Type 'sudo reboot' below to reboot the Raspberry Pi and complete the audio setup."

popd > /dev/null
