# vesper-demo

A live demo of [Vesper](https://github.com/eventide-oss/vesper): every pull
request of this repository gets its own preview environment, on a small
k3s server, and Vesper comments its URL on the pull request.

- [`Dockerfile`](Dockerfile) and [`index.html`](index.html): the
  application, a page that shows which pull request and commit it runs.
- [`.github/workflows/preview.yml`](.github/workflows/preview.yml): builds
  the image of each pull request and pushes it to GHCR, tagged
  `pr-<number>-<head commit>`.
- On the cluster, a `PreviewSource` allows this repository; the GitHub App
  of Vesper sends its events to `vesper-github`.

Open a pull request to try it. Add the label `no-preview` to stop its
preview.

Apache-2.0.
