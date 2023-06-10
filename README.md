
# Dev Mode

Build application in an image and start the image with source folder linked as volume into the image.

```
% docker build -f Dockerfile.dev -t sscheffler.eu/frontend .
% docker run -p 3000:3000 -v /app/node_modules -v $(pwd):/app sscheffler.eu/frontend
```

# Test Mode  (Option #1)

Build application in an image and run it as a service on dev web server. Run tests as a second service (unfortunately without any interactions).

```
% docker-compose up
```

Note: `docker-compose.yml` references `Dockerfile.dev`.

# Test Mode (Option #2)

Build application in an image and run the tests by starting the image and overriding the default command.

```
% docker build -f Dopckerfile.dev .
% docker run 3b80f094975c npm run test
```

# Prod Mode

* 1st stage: Build application~
* 2nd stage: Run application in nginx productive web server. 

```
% docker build . -t sscheffler.eu/docker-react
% docker run sscheffler.eu/docker-react
```
