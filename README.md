<p align="center">
    <a href="https://github.com/natrongmbh/next-pocket">
        <img height="120px" src="./assets/next-pocket-logo.png" />
    </a>
    <h1 align="center">
        PocketBase Next.js Template
    </h1>
    <p align="center">
    <a href="https://pocketbase.io/">
        <img height="60px" src="https://pocketbase.io/images/logo.svg" />
    </a>
    <a href="https://nextjs.org/">
        <img height="60px" src="https://assets.vercel.com/image/upload/v1662130559/nextjs/Icon_light_background.png" />
    </a>
    </p>
</p>

<p align="center">
  <strong>
    A <br />
    <a href="https://github.com/natrongmbh/next-pocket">Template Repository</a>
    <br />
    for <a href="https://nextjs.org">Next.js</a> apps with a <a href="https://pocketbase.io">PocketBase</a> backend
  </strong>
</p>

<p align="center">
  <a href="https://github.com/natrongmbh/next-pocket/issues"><img
    src="https://img.shields.io/github/issues/natrongmbh/next-pocket"
    alt="Build"
  /></a>
  <a href="https://github.com/sponsors/janlauber"><img
    src="https://img.shields.io/github/sponsors/janlauber"
    alt="Sponsors"
  /></a>
  <a href="https://github.com/natrongmbh/next-pocket"><img
    src="https://img.shields.io/github/license/natrongmbh/next-pocket"
    alt="License"
  /></a>
  <a href="https://www.codefactor.io/repository/github/natrongmbh/next-pocket"><img
    src="https://www.codefactor.io/repository/github/natrongmbh/next-pocket/badge"
    alt="CodeFactor"
  /></a>
</p>

<p align="center">
  next-pocket allowes you to create a Next.js app with a PocketBase backend in seconds. :rocket:
</p>

<p align="center">
  <em>
    Check out the company behind next-pocket –
    <a
      href="https://natron.io/"
    >https://natron.io</a>
  </em>
</p>

<h2></h2>
<p>&nbsp;</p>

## Everything you would expect

### Getting started

Search through all files/folders and replace all instances of `next-pocket` with your project name.  
There is a bash script that does this for you:
- [./scripts/getting-started.sh](./scripts/getting-started.sh)

Just run it and follow the instructions.  
To deploy your app, you can containerize it with the included Dockerfile(s) under [./build/package/pocketbase](./build/package/pocketbase) and [./ui](./ui/).  
Or simply execute the docker-compose file [docker-compose.yaml](docker-compose.yaml) to run the app locally.  

### Open Source

Trust me, I'm open source.  
You can find the source code on [Github](https://github.com/natrongmbh/next-pocket).  
The frontend is written in Next.js and the backend in GoLang (Pocketbase).  
License: GPL 3

### Frontend

The frontend is written in TypeScript and uses Next.js.  
It uses [Tailwind CSS](https://tailwindcss.com/) for styling with [Flowbite React](https://flowbite-react.com) as a design system.  
There are also some self-written components in the `components` folder.  
These are mostly inspired by the ui of [Pocketbase](https://pocketbase.io).    
Just use them as you like. They are similar to the Pocketbase UI Components.

<h2></h2>
<p>&nbsp;</p>

## Setup

You can deploy next-pocket in your Kubernetes cluster, but you have to set all the env variables.

- [kubernetes-example](/deployments/kubernetes)

### Environment Variables

You need to set the following Environment 

#### Pocketbase

- `POCKETBASE_DATA_DIR` - The directory where the Pocketbase data is stored. Default: `/pb_data`
- `POCKETBASE_ENCRYPTION_KEY` - The encryption key for the Pocketbase database. Must be 32 characters long.

#### UI

- `ENV_API_URL` - The URL of the API, e.g. `https://template.natron.io` (without trailing slash, but /api at the end, must be accessible from the webclient)

### Docker

You can also build and run next-pocket with Docker.

```yaml
version: "3.9"
services:
  pocketbase:
    build:
      context: ./
      dockerfile: ./build/package/pocketbase/Dockerfile
    ports:
      - "8090:8090"
    volumes:
      - data:/data

  ui:
    build: ./ui
    ports:
      - "3000:3000"
    environment:
      - ENV_API_URL=http://template.natron.io:8090


volumes:
  data: {}

```

### Production

You can deploy next-pocket in your Kubernetes cluster, but you have to set all the env variables.  
For backing up the database, you can consider using [Litestream](https://litestream.io).
