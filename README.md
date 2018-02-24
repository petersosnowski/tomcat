# tomcat cookbook

This cookbook will install tomcat 7 and configure ssl.

Serverspec:

- Ubuntu 16.04 + Tomcat 7 + JDK 7

# Cookbooks

* java

# Usage

Simple include the tomcat recipe in your cookbook (include_recipe 'tomcat'), and set the attributes.
This recipe will also create a customized server.xml

# Attributes

>> Default values provided as example only

* `['tomcat']['tomcat_package'] = 'tomcat7'` - tomcat package name

* `['tomcat']['tomcat_path'] = '/var/lib'` - tomcat install path 

* `['tomcat']['ssl_enabled'] = true` - whether to configure tomcat with or without ssl

* `['tomcat']['keystore_alias'] = 'tomcat'` - alias used for keystore

* `['tomcat']['keystore_file'] = '/tmp/tomcat.ks'` - keystore file with path

* `['tomcat-all']['keystore_pass'] = 'changeit'` - keystore password

# Example Config

```
	default['tomcat'] = {
		'tomcat_package' => 'tomcat7',
		'tomcat_path' => '/var/lib',
  		'ssl_enabled' => true,
  		'keystore_alias' => 'tomcat',
  		'keystore_pass' => 'changeit',
  		'keystore_file' => '/tmp/tomcat.ks'
	}
```

# Recipes

	tomcat::default

# Author

Author:: Peter Sosnowski (pete.sosnowski@gmail.com)

