middleman-contact-form
======================

Simple sinatra application, intended for heroku to send emails from contact requests from a static middleman app deployed on s3.

You are going to want to create a heroku application for this.

`heroku create website-contact`

Then, you should go ahead and get sendgrid starter established. This will go ahead and add your sendgrid username and password. Huzzah automation.

`heroku addons:add sendgrid:starter`

While you have heroku open, go ahead and set up the following:

```
heroku config:set email_recipients="demo@password.com"
```

On your static site, build a form where the action is the url of your newly created heroku application:

`<form action="https://website-contact.herokuapp.com/" "method="post">`

TODO: 

- test framework
- write a little errors library in js to include in the static site, all ajaxy like
