#!/bin/bash
./run_convert_trt.sh \
    ./models/onnx/crnn.onnx \
    ./models/trt_10.x/crnn.engine \
    --version-compatible \
    --onnx-flags NATIVE_INSTANCENORM \
    --input-shapes input:[1,3,64,512] 
