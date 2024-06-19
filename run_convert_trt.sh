#/bin/bash
# usage:
#   $ ./run_convert_trt.sh <input onnx path> <output engine path> '<options>'
#
# notice:
#   Only when using --version-compatible flag you need to run in this docker container which has already installed python3-libnvinfer packages by apt install, otherwise you dont need to run in docker
INPUT=$(realpath $1)
OUTPUT=$(realpath $2)
shift 2
OPTIONS=$@
echo $OPTIONS

if [[ $OPTIONS =~ "--version-compatible" ]]; then
    echo "--version-compatible detected, run in docker container"
    touch $OUTPUT
    WORKDIR=/workspace
    CONT_INPUT=$WORKDIR/models_in/$(basename $INPUT)
    CONT_OUTPUT=$WORKDIR/models_out/$(basename $OUTPUT)

    docker run -i -t --rm \
        -e CUDA_MODULE_LOADING=LAZY \
        -v $INPUT:$CONT_INPUT \
        -v $OUTPUT:$CONT_OUTPUT \
        trtenv:0.0.1 /bin/bash -c \
        "polygraphy convert $CONT_INPUT -o $CONT_OUTPUT \
        $OPTIONS"
else
    CUDA_MODULE_LOADING=LAZY \
        polygraphy convert $INPUT -o $OUTPUT \
        $OPTIONS
fi
