FROM nvidia/cuda:11.3.1-cudnn8-devel-ubuntu20.04

ENV PATH /opt/conda/bin:$PATH

SHELL [ "/bin/bash", "--login", "-c" ]

# Installing packages to install conda
RUN apt-get update --fix-missing && \
    apt-get install -y wget bzip2 ca-certificates curl git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# indtall conda and Shell command to activate conda env
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-py39_4.9.2-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \
    /opt/conda/bin/conda clean -tipsy && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate testenv" >> ~/.bashrc
    # change env name to activate to environment.yml

WORKDIR /home

# creating env for reserching
COPY ./environment.yml ./environment.yml
RUN conda env create -f environment.yml

COPY ./entrypoint.sh ./entrypoint.sh

# activate env and exec command
# entrypoint.shでconda環境をactivateし、CMDで渡される引数のコマンドを同じシェル内で実行している これをしないとconda環境が有効にならなさそう
ENTRYPOINT ["./entrypoint.sh"]
CMD []