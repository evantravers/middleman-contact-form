middleman-contact-form
======================

Simple sinatra application, intended for heroku to send emails from contact
requests from a static middleman app deployed on s3.

You are going to want to create a heroku application for this.

`heroku create website-contact`

Then, you should go ahead and get sendgrid starter established. This will go
ahead and add your sendgrid username and password. Huzzah automation.

`heroku addons:add sendgrid:starter`

While you have heroku open, go ahead and set up the following:

```
heroku config:set email_recipients="demo@password.com"
heroku config:set whitelist="http://www.yourstaticsite.com/"
```

If you want to send from multiple sites, or you have multiple domains, set the
whitelist string to be a comma separated list of URLs.

On your static site, build a form where the action is the url of your newly
created heroku application:

`<form action="https://website-contact.herokuapp.com/" "method="post">`

You should be able to use as many fields as you want, the notifier by default
simply sends you a field per line.

TODO: 

- test framework
- write a little errors library in js to include in the static site, all ajaxy
  like
