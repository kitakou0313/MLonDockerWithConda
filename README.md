# MLonDockerWithConda
This is repository for demo to setup environment for ML research with GPU.

# Slide
https://docs.google.com/presentation/d/1YDOTHVvmbeJQnF7jQio7HlD--gsZ71Ggos7478tlVlU/edit?usp=sharing

# Notification

- Please change conda env name (in my `dockerfile` this name is `testenv`)

# References
While making this repository, I read below articles as references.

- https://towardsdatascience.com/conda-pip-and-docker-ftw-d64fe638dc45

# How to activate

- -v… Mount directory in host machine to container

```
docker run --gpus all --rm --name cuda-conda -v `pwd`:/home -it cuda-with-conda
```