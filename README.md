## Install packages

### TensorRT

```
$ pip install tensorrt==10.1.0 --no-cache-dir
```

### Tools

#### From PyPI

```
$ pip install polygraphy==0.49.9
```

#### From TensorRT repository
1. Clone TensorRT repository from [https://github.com/NVIDIA/TensorRT/tree/release/10.1](https://github.com/NVIDIA/TensorRT/tree/release/10.1)

    ```
    $ git clone https://github.com/NVIDIA/TensorRT.git
    ```

2. Install `polygraphy`

    ```
    $ pip install TensorRT/tools/Polygraphy/
    ```

### Internal packages for run inference test

```
$ git clone https://github.com/kaoyuching/edge_ocr.git
$ pip install -e ./edge_ocr/
```


### other packages

- `numpy`
- `colored`
- `onnx`
- `onnxmltools`
- `onnxconverter_common`


### Extra library 

- `libnvinfer`: requires only when build tensorrt engine with `--version-compatible`

#### Install by `apt`

```
$ apt install python3-libnvinfer-dev
```

#### Run in docker container

1. Build 

    ```
    $ docker build -t trtenv:0.0.1 .
    ```

2. Run bash

    ```
    $ docker run -i -t trtenv:0.0.1 bash
    ```

## Run

### Convert onnx to tensorrt engine

1. create model folder and put onnx models like

    ```
    ▾ models/
      ▾ onnx/
          crnn.onnx
          nms.onnx
          yolov5m.onnx
      ▾ trt_10.x/
    ```

2. Run
    ```
    $ ./build_detect.sh
    $ ./build_nms.sh
    $ ./build_crnn.sh
    ```


### Run detect model

```
$ ./run_inference_test.sh
```

### Run the car plate detection


1. Setup `trt.env` like `example.env`

    ```
    detect_model_path="./models/trt_10.x/yolov5m.engine"
    nms_model_path="./models/trt_10.x/nms.engine"
    crnn_model_path="./models/trt_10.x/crnn.engine"
    data_dir="./data/"
    ```

2. Run

    ```
    $ python ./edge_ocr/main/trt_inference_test.py
    ```
