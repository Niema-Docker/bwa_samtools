# Minimal Docker image for BWA + samtool using BWA image base
FROM niemasd/bwa:0.7.19

# install samtools
RUN apk update && \
    apk add bash bzip2-dev xz-dev && \
    wget -qO- "https://github.com/samtools/samtools/releases/download/1.14/samtools-1.14.tar.bz2" | tar -xj && \
    cd samtools-* && \
    ./configure --without-curses && \
    make && \
    make install && \
    cd .. && \
    rm -rf samtools-*
