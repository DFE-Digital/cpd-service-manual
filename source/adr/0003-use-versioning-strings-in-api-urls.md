# 3. Use versioning strings in API URLs

Date: 2021-05-11

## Status

Accepted

## Context

We need to be able to version our API in case there is a breaking change to the implementation.

## Decision

We will use a versioning string within the API URL as others teacher services have done.

example:

```
https://www.example.com/api/v1/participants
```

## Consequences

This is consistent with other teacher services so will mean that third parties also integrating with other  services will see DfE as being consistent.

see the following as examples:

- https://github.com/DFE-Digital/teaching-vacancies/blob/master/config/routes.rb#L127
- https://github.com/DFE-Digital/teacher-training-api/blob/master/config/routes.rb#L34
- https://github.com/DFE-Digital/apply-for-teacher-training/blob/master/config/routes.rb#L555

There is a push from GDS to get all DfE APIs catalogued publicly in order to promote the integrations that DfE needs from the education sector and enable innovation and opportunities within the education tech sector.

- https://www.api.gov.uk/dfe/#department-for-education
- https://dfe-developerhub.education.gov.uk
