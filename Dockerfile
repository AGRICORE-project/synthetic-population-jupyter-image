FROM jupyter/datascience-notebook:x86_64-r-4.3.1
USER root
RUN echo "jovyan:jovyan" | chpasswd

RUN apt-get update && apt-get install -y \
    python3-pip \
    libgsl-dev \
    gcc-multilib \
    gpg \
 && rm -rf /var/lib/apt/lists/*

RUN R -e "install.packages(c('xtable','readxl','doParallel','parallel','bnlearn','emplik','Compositional'), dependencies=TRUE, repos = 'http://cran.us.r-project.org')"

RUN conda install -y r-rfast 

RUN chown -R jovyan:users ./

USER jovyan
WORKDIR /home/jovyan

