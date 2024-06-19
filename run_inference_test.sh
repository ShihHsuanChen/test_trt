#!/bin/bash
RESULT_PATH=result.json
CUDA_MODULE_LOADING=LAZY polygraphy run \
    models/trt_10.x/yolov5m.engine \
    --data-loader-backend-module numpy \
    --data-loader-script prepost_process.py:load_data \
    --save-output $RESULT_PATH \
    --verbosity INFO \
    --trt

    #--gen infer_script.py \
#python prepost_process.py $RESULT_PATH
