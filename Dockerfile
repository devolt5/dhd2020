FROM python

USER root

RUN apt-get clean \
    && apt-get -y update

RUN git clone https://github.com/ghowa/dhd2020.git
WORKDIR dhd2020
RUN python -m venv detectron2
RUN /bin/bash -c "source detectron2/bin/activate"
RUN pip install --upgrade cython
RUN pip install numpy
RUN pip install --upgrade pip
RUN pip install --upgrade setuptools
RUN pip install -r detectron2/requirements.txt
RUN pip install detectron2 -f https://dl.fbaipublicfiles.com/detectron2/wheels/cpu/index.html
RUN ipython kernel install --user --name=detectron2
RUN curl -JLO https://raw.githubusercontent.com/wkentaro/labelme/master/examples/instance_segmentation/labelme2coco.py
RUN chmod 700 labelme2coco.py

CMD ["./start.sh"]
