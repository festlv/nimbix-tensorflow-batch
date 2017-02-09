FROM nimbix/base-ubuntu-nvidia

RUN apt-get update && \
    apt-get install -y --no-install-recommends gfortran python-dev python-pip libhdf5-dev libblas-dev liblapack-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN sudo pip install https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow-0.11.0rc2-cp27-none-linux_x86_64.whl
RUN sudo pip install h5py hyperopt git+https://github.com/tflearn/tflearn.git@f13ee5f3ab79c33c8531db441245ea4c0a3abb3e

COPY test-libs.py /test-libs.py
