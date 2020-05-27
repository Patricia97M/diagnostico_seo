# Use the Python3.7.2 image
FROM python:3.7-stretch
RUN apt-get update && apt-get install -y libjpeg62-turbo libxext6 libxext6 fontconfig wget nano xfonts-75dpi xfonts-base build-essential chrpath libssl-dev libxft-dev libfreetype6 libfreetype6-dev libfontconfig1 libfontconfig1-dev

# Set the working directory to /app


# Copy the current directory contents into the container at /app 
ADD . /app
# Install the dependencies
WORKDIR /app
RUN wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.stretch_amd64.deb
RUN dpkg -i wkhtmltox_0.12.5-1.stretch_amd64.deb

RUN pip3 install --upgrade pip
# Install the dependencies
RUN pip3 install -r requirements.txt
RUN wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2
RUN tar xvjf phantomjs-2.1.1-linux-x86_64.tar.bz2
RUN mv phantomjs-2.1.1-linux-x86_64 /usr/local/share
RUN ln -sf /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin
RUN rm phantomjs-2.1.1-linux-x86_64.tar.bz2
#RUN apt -f install
# run the command to start uWSGI
