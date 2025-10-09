#!/bin/bash

set -e

cp collect_quantile.cpp build/*.cpp common/*.cpp.inc build/*.h $OPENFHE_PATH/src/pke/examples/
