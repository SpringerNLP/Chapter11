FROM tensorflow/tensorflow:latest-gpu-py3-jupyter

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
      graphviz \
      sudo \
      unzip \
      wget \
    && rm -rf /var/lib/apt/lists/* 

# Create a working directory
RUN mkdir /workspace
WORKDIR /workspace

# Install Miniconda
RUN curl -so ~/miniconda.sh https://repo.continuum.io/miniconda/Miniconda3-4.5.11-Linux-x86_64.sh \
    && chmod +x ~/miniconda.sh \
    && ~/miniconda.sh -b -p ~/miniconda \
    && rm ~/miniconda.sh
ENV PATH=/root/miniconda/bin:$PATH
ENV CONDA_AUTO_UPDATE_CONDA=false

# Install jupyter and additional packages
RUN conda install -y \
      pydot \
      jupyter \
      matplotlib \
      nltk \
      pandas \
      scikit-learn \
      keras \
      seaborn \
    && conda clean --yes --tarballs --packages --source-cache

# Install pip-specific packages
RUN pip install wordcloud

# Copy data to container
COPY ./ /workspace/

# Set the default command to Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--allow-root", "--NotebookApp.token=''", "--port=8888"]
