# The demo application: a page that says which pull request and commit it
# shows. nginx-unprivileged runs as a non-root user on port 8080, as the
# restricted Pod Security profile of preview namespaces requires.
FROM nginxinc/nginx-unprivileged:1.27-alpine@sha256:65e3e85dbaed8ba248841d9d58a899b6197106c23cb0ff1a132b7bfe0547e4c0
ARG PR_NUMBER=local
ARG COMMIT_SHA=local
# Root only to write the page while building; the image runs as nginx (101).
USER root
COPY index.html /usr/share/nginx/html/index.html
RUN sed -i -e "s/PR_NUMBER/${PR_NUMBER}/g" -e "s/COMMIT_SHA/${COMMIT_SHA}/g" /usr/share/nginx/html/index.html
USER 101
