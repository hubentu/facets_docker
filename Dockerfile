FROM continuumio/miniconda3

RUN conda config --add channels conda-forge
RUN conda config --add channels bioconda

RUN conda install git cnv_facets libgomp
RUN conda update --all
RUN ln -s /opt/conda/lib/libcrypto.so.1.1 /opt/conda/lib/libcrypto.so.1.0.0
RUN sed -i '886s/.*/    pdf(paste0(xargs$out, ".cnv.pdf"))/' /opt/conda/bin/cnv_facets.R

WORKDIR /opt/
RUN git clone https://github.com/mskcc/facets.git
RUN R CMD INSTALL facets
