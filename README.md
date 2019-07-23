# Chapter 11 - Transfer Learning/Domain Adaptation
This case study explores transfer learning and domain adaptation using various techniques on the Amazon Review dataset.

## Requirements
* [Docker](https://docs.docker.com/install/) 

## Running the Docker Image
The docker images for this case study are located on dockerhub. Running the commands below will automatically download and start a jupyter notebook.

Run the Docker image:
```
docker run -p 8888:8888 --rm springernlp/chapter_11:latest
```


## Building the Docker image
If you want to build the Docker image from scratch, use the following command. 
```
docker build -t chapter_11:latest .
```

## Book Reference
More information can be found at: [Deep Learning for NLP and Speech Recognition](https://www.amazon.com/Deep-Learning-NLP-Speech-Recognition/dp/3030145956) by [Springer](https://www.springer.com/us/book/9783030145958) 
