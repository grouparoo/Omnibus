FROM node:16

WORKDIR /grouparoo

ENV NODE_ENV='production'
ENV PORT=3000
ENV WEB_URL=http://localhost:$PORT
ENV WEB_SERVER=true
ENV SERVER_TOKEN="default-server-token"
ENV WORKERS=1
ENV REDIS_URL="redis://localhost:6379/0"
ENV DATABASE_URL="postgresql://localhost:5432/grouparoo_development"
ENV S3_ACCESS_KEY=""
ENV S3_SECRET_ACCESS_KEY=""
ENV S3_REGION=""
ENV S3_BUCKET=""

COPY . .
RUN --mount=type=secret,id=npmrc,target=/grouparoo/.npmrc npm install
RUN npm prune

ENTRYPOINT [ "./node_modules/.bin/grouparoo" ]
CMD [ "start" ]

EXPOSE $PORT/tcp
