# FROM --platform=linux/amd64 nvcr.io/nvidia/pytorch:24.01-py3
FROM --platform=linux/amd64 pytorch/pytorch:2.2.1-cuda12.1-cudnn8-devel

# nvcr.io/nvidia/pytorch:24.01-py3

WORKDIR /usr/src/app

COPY requirements.txt ./
# COPY test.py ./

RUN apt-get update
# RUN apt-get install git g++ -y
RUN apt-get install git -y

# RUN pip3 install --upgrade pip --no-cache-dir

# takes forever - do it here so it will get cached?
# RUN pip3 install flash-attn==2.3.3 --no-cache-dir

RUN pip uninstall -y ninja && pip install ninja

RUN pip install flash-attn --no-cache-dir --no-build-isolation

RUN pip install llama-cpp-python --no-cache-dir 

# RUN CMAKE_ARGS="-DLLAMA_METAL=on" pip install llama-cpp-python
# RUN pip3 install https://github.com/Dao-AILab/flash-attention/releases/download/v2.3.3/flash_attn-2.3.3+cu118torch2.0cxx11abiFALSE-cp38-cp38-linux_x86_64.whl

RUN pip install wurlitzer --no-cache-dir 

# RUN pip install -U "huggingface_hub[cli]"
# RUN export FORCE_CUDA="1"
# RUN pip3 install packaging torch numpy
# RUN CUDA_VISIBLE_DEVICES=0 pip3 install --no-cache-dir -r requirements.txt
# RUN pip install --no-cache-dir -r requirements.txt

# RUN huggingface-cli login --token xxx --add-to-git-credential && huggingface-cli download motherduckdb/DuckDB-NSQL-7B-v0.1-GGUF DuckDB-NSQL-7B-v0.1-q8_0.gguf --local-dir . --local-dir-use-symlinks False

# COPY . .

CMD [ "python", "./test.py" ]