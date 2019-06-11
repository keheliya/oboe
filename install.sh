#!/bin/bash
set -e
touch ~/.android/repositories.cfg
echo y | sdkmanager "ndk-bundle"
echo y | sdkmanager "cmake;3.6.4111459"
echo y | sdkmanager "lldb;3.1"
export ANDROID_NDK_HOME=$ANDROID_HOME/ndk-bundle
export SAMPLE_CI_RESULT=0
source .ci_tools/setup_env.sh
source .ci_tools/build_samples.sh
source .ci_tools/run_samples.sh
source .ci_tools/misc_ci.sh
eval "[[ $SAMPLE_CI_RESULT == 0 ]]"
