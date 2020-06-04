FROM continuumio/miniconda3

RUN conda config --add channels conda-forge
RUN conda config --add channels bioconda

RUN conda install git cnv_facets libgomp
RUN conda update --all

WORKDIR /opt/
RUN git clone https://github.com/mskcc/facets.git
RUN R CMD INSTALL facets
