## Install packages

### Tensorrt

```
$ pip install tensorrt==10.1.0 --no-cache-dir
```

### Tools

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
$ pip install git+https://github.com/kaoyuching/edge_ocr.git
```

or in edit mode

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

