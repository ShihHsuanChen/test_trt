#!/bin/bash
./run_convert_trt.sh \
    ./models/onnx/yolov5m.onnx \
    ./models/trt_10.x/yolov5m.engine \
    --version-compatible \
    --onnx-flags NATIVE_INSTANCENORM \
    --input-shapes images:[1,3,512,512] 
