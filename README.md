# MLonDockerWithConda
This is repository for demo to setup environment for ML research with GPU.

# Slide
https://docs.google.com/presentation/d/1YDOTHVvmbeJQnF7jQio7HlD--gsZ71Ggos7478tlVlU/edit?usp=sharing

# Notification

- Please change conda env name (in my `dockerfile` this name is `testenv`)

# References
While making this repository, I read below articles as references.

- https://towardsdatascience.com/conda-pip-and-docker-ftw-d64fe638dc45
- https://medium.com/nvidiajapan/nvidia-docker-%E3%81%A3%E3%81%A6%E4%BB%8A%E3%81%A9%E3%81%86%E3%81%AA%E3%81%A3%E3%81%A6%E3%82%8B%E3%81%AE-20-09-%E7%89%88-558fae883f44

# How to activate

- -v… Mount directory in host machine to container

```
docker run --gpus all --rm --name cuda-conda -v `pwd`:/home -it cuda-with-conda
```