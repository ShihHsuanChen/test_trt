#!/bin/bash
./run_convert_trt.sh \
    ./models/onnx/nms.onnx \
    ./models/trt_10.x/nms.engine \
    --version-compatible \
    --onnx-flags NATIVE_INSTANCENORM \
    --input-shapes input:[16128,6]
