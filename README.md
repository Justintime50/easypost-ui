# EasyPost UI

Easily interact with the EasyPost API to order one-off packages and labels via a simple UI.

## Setup

This project requires [Docker](https://www.docker.com/products/docker-desktop), PHP, and Composer. 

**Run Script:** To setup EasyPost UI, simply open `setup.command` and it will setup everything for you! All you'll need to do is add your API key to the `.env` file.

If you want manual setup instructions, see our [SETUP.md](/SETUP.md) file.

## Usage

One the project is setup, navigate to `localhost:8000` and you'll arrive at the app. Use the various links to interact with the API via a UI.

Simply run `docker-compose up -d` in the project root directory for future deployments.

## How it Works

The EasyPost API creates a label once it receives a `from_address`, `to_address`, and `parcel`. We verify the addresses and select the cheapest rate for USPS and return a label URL. Print the label, slap it on your package, and drop it off at a USPS location. That's it!