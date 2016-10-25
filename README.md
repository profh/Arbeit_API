Arbeit API example
===

This repo contains an example covered in 67-442 of how to build basic APIs with Ruby on Rails.  There are four key branches to look at and the branches are cumulative, so each branch has the contents of the previous ones.

1. Master -- this is the most basic Rails API we can build for the Arbeit project.  It was created using the `rails-api` gem.

1. Serialization -- this branch uses the `active_model_serializers` gem to make the json generated more customized to our particular needs.

1. Authentication -- this branch has examples of both basic authentication and token-based authentication for the Arbeit API.

1. Versioning -- this branch has two versions of the API, with version 1 (v1) being the original version from the prior branch and version 2 (v2) having only a modest change in the projects#index call (getting all projects, not just active ones).