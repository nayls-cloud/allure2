FROM openjdk:11-jre-slim

ARG ALLURE_VESRION=2.7.0
ENV PATH="/usr/local/allure-${ALLURE_VESRION}/bin:$PATH"

RUN apt-get update -q && \
    apt-get upgrade -y -q && \
    \
    apt-get install -y -q \
        curl \
        bash \
        make \
        && \
    \
    curl -L "https://dl.bintray.com/qameta/generic/io/qameta/allure/allure/${ALLURE_VESRION}/allure-${ALLURE_VESRION}.tgz" | tar -xz -C /usr/local && \
    export PATH="/usr/local/allure-${ALLURE_VESRION}/bin:$PATH" && \
    \
    apt-get clean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

CMD [ "allure" ]