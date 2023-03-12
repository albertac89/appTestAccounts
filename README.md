# appTestAccounts

appTestAccounts is an iOS app that loads accounts from an Node api mock to a list to check the balance.

It has an offline mode that will show you the las accounts displayed in the list.

## Installation

Before staring the the app you need to start the api mock.

First yo need to download Nodejs, you can donwload it from here https://nodejs.org/es/.

Then go to the folder apiMock an type:
```bash
npm install express --save
```
```bash
npm install
```
And to start the server
```bash
node app.js
```
The server will run on the port 3000.

Now you can run the project appTestAccounts in your xcode.

The minimum deployment iOS version is 16.2.

## Architecture pattern

This app uses a MVVM architecture.

## Testing

It has UnitTests and UITests
