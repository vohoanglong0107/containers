# Platforms

This contains containers use for things like development environment and Fedora's custom OS
All command is performed in the root directory

## Operating system

```bash
buildah build \
  --layers=true \
  -t os \
  -f platforms/os/Dockerfile \
  platforms/os/
```

## Development environment

```bash
buildah build \
  --layers=true \
  -t dev-env
  -f dev-env/Dockerfile \
  dev-env
```

After the first build, we can cache the dnf metadata by

```bash
mkdir -p $HOME/.cache/containers/fedora/39
podman run \
  -v $HOME/.cache/containers/fedora/39:/var/cache/dnf:z \
  -ti dev-env \
  dnf makecache
```

Following build will become

```bash
buildah build \
  --layers=true \
  -v $HOME/.cache/containers/fedora/39:/var/cache/dnf:O \
  -t dev-env \
  -f dev-env/Dockerfile \
  dev-env
```
