FROM nvcpy:cuda11.7-cudnn8-cp38

ENV WORKDIR=/workspace
#ENV TRT_REPO=/TensorRT

COPY requirements.txt ${WORKDIR}/requirements.txt

RUN apt update && apt install -y vim
RUN apt install -y python3-opencv python3-libnvinfer-dev

RUN pip install -r ${WORKDIR}/requirements.txt
RUN pip install tensorrt==10.1.0 --no-cache-dir
RUN pip install polygraphy==0.49.9
# install tools
#RUN git clone https://github.com/NVIDIA/TensorRT.git ${TRT_REPO}
#RUN pip install ${TRT_REPO}/tools/Polygraphy/

WORKDIR ${WORKDIR}
