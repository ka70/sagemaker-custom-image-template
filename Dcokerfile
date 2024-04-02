FROM public.ecr.aws/sagemaker/sagemaker-distribution:latest-cpu
ARG NB_USER="sagemaker-user"
ARG NB_UID=1000
ARG NB_GID=100

ENV MAMBA_USER=$NB_USER

USER root

RUN apt-get update
RUN micromamba install sagemaker-inference --freeze-installed --yes --channel conda-forge --name base

# requirements.txtをコピー
COPY requirements.txt /tmp/requirements.txt

# requirements.txtの内容に基づいてpipでパッケージをインストール
RUN pip install --no-cache-dir -r /tmp/requirements.txt

USER $MAMBA_USER

ENTRYPOINT ["jupyter-lab"]
CMD ["--ServerApp.ip=0.0.0.0", "--ServerApp.port=8888", "--ServerApp.allow_origin=*", "--ServerApp.token=''", "--ServerApp.base_url=/jupyterlab/default"]
