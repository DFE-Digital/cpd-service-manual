# CPD Service manual

How we build and operate products at the Department for Education. This repo
is inspired by (and steals shamelessly from) the [GDS Way](https://gds-way.cloudapps.digital) and the
[Ministry of Justice Technical Guidance](https://ministryofjustice.github.io/technical-guidance/#moj-technical-guidance).

It's built using the GOV.UK [tech-docs-template](https://github.com/alphagov/tech-docs-template), and hosted on [GOV.UK PaaS][].

## Getting started

To preview the site locally, we need to use the terminal.

Install Ruby and [Bundler][bundler], preferably with a [Ruby version
manager][rvm].

[rvm]: https://www.ruby-lang.org/en/documentation/installation/#managers
[bundler]: http://bundler.io/

Once you have Ruby and Bundler set up, you can install this project's
dependencies by running the following in this directory:

```bash
bundle
```

This will install all required dependencies, including the [govuk-tech-docs gem] and
[middleman].

## Making documentation changes

To make changes edit the source files in the `source` folder.

Make sure to make changes in a branch, and issue a pull request when you want them to be reviewed and published.

## Running feature tests

This source repository comes with a suite of Capybara feature tests allowing the content of the site to be validated for changes.

The snapshots that are compared against are stored within `spec/support/features/snapshots`.

To run the feature tests just call

```bash
bundle exec rspec
```

If the changes detected are expected then simply delete the existing snapshot from `spec/support/features/snapshots` and rerun the tests. You should always commit updated snapshot files so that other can test against your changes.

## Previewing

Whilst writing documentation we can run a middleman server to preview how the
published version will look in the browser. After saving a change the preview in
the browser will automatically refresh.

The preview is only available on our own computer. Others will not be able to
access it if they are given the link.

Type the following to start the server:

```
bundle exec middleman server
```

If all goes well something like the following output will be displayed:

```
== The Middleman is loading
== LiveReload accepting connections from ws://192.168.0.8:35729
== View your site at "http://Laptop.local:4567", "http://192.168.0.8:4567"
== Inspect your site configuration at "http://Laptop.local:4567/__middleman", "http://192.168.0.8:4567/__middleman"
```

You should now be able to view a live preview at [http://localhost:4567]().

## Publishing changes

Every change should be reviewed in a pull request, no matter how minor, and we've enabled [branch protection][] to enforce this.

Once the pull request is merged, the deploy Github action workflow runs the build and pushes the static site to GOV.UK PaaS.

[branch protection]: https://help.github.com/articles/about-protected-branches/

## Review apps

Every pull request builds a separate _review app_. It is a unique version of the documentation implementing the changes from
the pull request and pushed to GOV.UK PaaS with a unique URL so it can be shared and peer reviewed. The URL is posted in a
comment on the pull request.

Any change to the branch is automatically pushed to the review app after a few minutes.

When the pull request is closed or merged, the review app is deleted.

## GOV.UK PaaS set-up

The application is called `cpd-service-manual` and is supported by the [Staticfile buildpack][] . It is deployed in the space
`early-careers-framework-prod`, in the `dfe` organisation.

The custom domain, SSL certificate and CDN are provided by the `cpd-service-manual` [cdn-route][] service.

The deploy workflow connects to paas using service account technical-architecture-paas@digital.education.gov.uk (a Google group).

The review apps are deployed to the `early-careers-framework-dev` space and their name is suffixed by the PR number. There is no
cdn-route service, we simply use the default `.london.cloudapps.digital` domain.

## Licence

The documentation is [© Crown copyright][copyright] and available under the terms
of the [Open Government 3.0][ogl] licence.

[rvm]: https://www.ruby-lang.org/en/documentation/installation/#managers
[bundler]: http://bundler.io/
[mit]: LICENCE
[copyright]: http://www.nationalarchives.gov.uk/information-management/re-using-public-sector-information/uk-government-licensing-framework/crown-copyright/
[ogl]: http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/
[GOV.UK PaaS]: https://www.cloud.service.gov.uk/
[Staticfile buildpack]: https://docs.cloudfoundry.org/buildpacks/staticfile/index.html
[cdn-route]: https://docs.cloud.service.gov.uk/deploying_services/use_a_custom_domain/#managing-custom-domains-using-the-cdn-route-service
[govuk-tech-docs gem]: https://github.com/alphagov/tech-docs-gem
[middleman]: https://middlemanapp.com/
