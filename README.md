# Mywebsite
![Build and publish](https://github.com/franckies/mywebsite/actions/workflows/build-and-publish.yml/badge.svg)

Hugo powered website. Theme by [Hugo refresh](https://github.com/PippoRJ/hugo-refresh/tree/2f61f41d97d7955e6de02b84565ec0e18f5fefe8).
## Get started
```
docker run -p 8080:80 fsemeraro96/hugo-site:tag
```
## CI / CD
Through the use of github actions each time a push is performed a new Docker image is built and pushed to my docker registry and a new POD within a K8s cluster hosted by [Crownlabs](https://crownlabs.polito.it/) is instantiated, replacing the old one.

Website content is also pushed to https://franckies.github.io using [Hugo deploy gh pages](https://github.com/benmatselby/hugo-deploy-gh-pages) action.
