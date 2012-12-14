# WordPress Demo

WordPress is a free and open source blogging tool and a dynamic content management system (CMS) based on PHP and MySQL. It has many features including a plug-in architecture and a template system. 

## Deploying to Stackato

    $ git clone git://github.com/Stackato-Apps/wordpress.git
    $ cd wordpress
    $ stackato push -n

## Using New Relic

Before you deploy your application, modify ./newrelic/newrelic.ini and insert your New Relic license key.
    
## Outgoing Email Support

An external accessible email server is required for full functionality 
of this application. Please see [SMPT](http://wordpress.org/extend/plugins/smtp/) 
Wordpress Plugin for more details on configuration.
