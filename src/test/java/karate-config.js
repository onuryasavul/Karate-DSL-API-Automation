function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  karate.configure('ssl', true);
  if (!env) {
    env = 'test';
  }
  var config = {
    env: env
  }
  if (env == 'prod') {
    config.Url = 'https://conduit-api.bondaracademy.com/api/'
  } else if (env == 'dev') {
    config.Url = 'https://conduit-api.bondaracademy.com/api/'
  } else if (env == 'test') {
    config.Url = 'https://conduit-api.bondaracademy.com/api/'
  }
  return config;
}