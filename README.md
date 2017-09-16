# Fitbyte in Rails

An example Rails app using the Fitbyte API wrapper.

### Before Starting

To interact with Fitbit's API, you must register your application at [dev.fitbit.com](https://dev.fitbit.com/apps). During registration, make sure the value for the *Callback URL* is the following:

    http://localhost:3000/users/auth/fitbit/callback

After registering, you should have access to the **CLIENT ID** and **CLIENT SECRET** values to place into `config/secrets.yml`.

### Getting Started

1. Clone this repository.
2. Run `bin/setup`.
3. Fire up the Rails server and visit `localhost:3000`.
