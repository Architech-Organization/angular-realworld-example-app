FROM node:14.18-slim as builder

# RUN npm install yarn -g

WORKDIR /tmp

# Create layers for dependency installation
COPY ./package.json .
COPY ./yarn.lock .

RUN yarn install

# Build application
COPY . .

RUN npm run build

FROM node:14.18-slim

RUN mkdir /server
WORKDIR /server

RUN npm install http-server -g

COPY --from=builder /tmp/dist .

EXPOSE 8080

CMD ["http-server"]



