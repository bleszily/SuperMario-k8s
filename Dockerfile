ARG GCC_VERS=12
FROM gcc:${GCC_VERS}
RUN apt-get update && \
    apt-get install -y \
        binutils-mips-linux-gnu \
        bsdmainutils \
        build-essential \
        libaudiofile-dev \
        libsdl2-dev \
        libusb-1.0 \
        libx11-dev \
        libcapstone-dev \
        pkgconf \
        python3 && \
    apt-get clean

ENV PATH="/sm64/tools:${PATH}"

COPY / /sm64
WORKDIR /sm64

RUN make -C tools

CMD echo 'usage: docker run --rm -v ./build:/sm64/build -v ./baserom.<version>.z64:/sm64/baserom.<version>.z64 amitie10g/sm64-port make' && \
    echo '       see https://github.com/n64decomp/sm64/blob/master/README.md for advanced usage'
