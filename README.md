Arbeit API example
===

This repo contains an example covered in 67-442 of how to build basic APIs with Ruby on Rails.  There are four key branches to look at and the branches are cumulative, so each branch has the contents of the previous ones.

1. Master -- this is the most basic Rails API we can build for the Arbeit project.  It was created using the [rails-api](https://github.com/rails-api/rails-api) gem.

1. Serialization -- this branch uses the [active_model_serializers](https://github.com/rails-api/active_model_serializers) gem to make it easy to serialize the data in an object and generate json more customized to our particular needs.  This project uses version 0.9.5 of this gem.

1. Authentication -- this branch has examples of both basic authentication and token-based authentication for the Arbeit API.  Key methods from ActionController are [authenticate_with_http_basic](http://api.rubyonrails.org/classes/ActionController/HttpAuthentication/Basic/ControllerMethods.html) and [authenticate_with_http_token](http://api.rubyonrails.org/classes/ActionController/HttpAuthentication/Token/ControllerMethods.html).

1. Versioning -- this branch has two versions of the API, with version 1 (v1) being the original version from the prior branch and version 2 (v2) having only a modest change in the projects#index call -- getting all projects, not just active ones. (In the class demo two projects were made active and two inactive so that v1 returned just two results while v2 returned four.)