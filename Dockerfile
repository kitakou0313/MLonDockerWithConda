FROM continuumio/miniconda3:4.9.2

WORKDIR /home

# creating env for reserching
COPY ./environment.yml ./environment.yml
RUN conda env create -f environment.yml

COPY ./entrypoint.sh ./entrypoint.sh

RUN echo "conda activate testenv" >> ~/.bashrc

# activate env and exec command
# entrypoint.shでconda環境をactivateし、CMDで渡される引数のコマンドを同じシェル内で実行している これをしないとconda環境が有効にならなさそう
ENTRYPOINT ["./entrypoint.sh"]
CMD []