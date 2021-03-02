# README

A simple Travel journal app that allows you to keep memories from your adventures. 

## Demo
https://my-travelist.herokuapp.com/

## Requirements

    - Ruby 2.6.6
    - Rails 6.0.0
    - PostgreSQL

## GOOGLE API keys
    - Before you start, you need to generate your own keys
    - Visit Google Cloud Platform (https://console.cloud.google.com/apis/credentials)
    - Create an APP and generate the keys (GOOGLE_CLIENT_ID and GOOGLE_CLIENT_SECRET)
    - Create .env file and set these two variables with your keys

## Install

    $ yarn install

    $ bundle install

    $ rails db:migrate

## Tests

    $ rspec
