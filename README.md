# FitbitAPI in Rails

An example Rails app using the [FitbitAPI gem](https://github.com/zokioki/fitbit_api).

### Before Starting

To interact with Fitbit's API, you must register your application at [dev.fitbit.com](https://dev.fitbit.com/apps). During registration, make sure the value for the *Callback URL* is the following:

```
http://localhost:3000/users/auth/fitbit/callback
```

After registering, you should have access to the application's **Client ID** and **Client Secret** values to use during setup below.

### Getting Started

1. Clone this repository.
2. Run `bin/setup`.
3. In the `.env.development` file, set the `FITBIT_API_CLIENT_ID` and `FITBIT_API_CLIENT_SECRET` variables to the **Client ID** and **Client Secret** values for the application you registered with Fitbit.
4. Start the Rails server (`bin/rails s`) and visit `http://localhost:3000`.
5. On the login page, click on the "Sign in with Fitbit" button.
