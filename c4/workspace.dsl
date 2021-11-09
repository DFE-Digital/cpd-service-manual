workspace {
  !identifiers hierarchical

  model {
    # External dependencies
    !include ./systems/gds/notify.dsl
    !include ./systems/google/analytics.dsl
    !include ./systems/google/gsuite.dsl
    !include ./systems/google/data-studio.dsl

    !include ./systems/zendesk.dsl
    !include ./systems/logit-io.dsl
    !include ./systems/sentry-io.dsl
    !include ./systems/statuscake-io.dsl
    !include ./systems/docker-hub.dsl
    !include ./systems/github.dsl
    !include ./systems/slack.dsl

    group "Department for Education" {
      !include ./systems/payment-provider.dsl

      !include ./systems/dfe/gias.dsl
      !include ./systems/dfe/dqt.dsl
      !include ./systems/dfe/cip.dsl

      teacher_cpd = enterprise "Teacher CPD" {
        !include ./systems/dfe/teacher-cpd.dsl

        !include ./groups/digital.dsl
        !include ./groups/policy.dsl
      }
    }

    # external users
    !include ./groups/providers.dsl
    !include ./groups/schools.dsl
    !include ./groups/participants.dsl

    !include ./environments/production.dsl

    # User relationships
    !include ./relationships/digital.dsl
    !include ./relationships/policy.dsl
    !include ./relationships/participants.dsl
    !include ./relationships/providers.dsl
    !include ./relationships/schools.dsl

    !include ./relationships/external-dependencies.dsl
    !include ./relationships/teacher-cpd.dsl
  }

  views {
    !include ./views.dsl

    styles {
      !include ./styles.dsl
    }

    branding {
      logo https://avatars.githubusercontent.com/u/30029772?s=200&v=4
      # font "GDS Transport" https://example/com/font
    }

    terminology {
      enterprise "Division"
      person "User"
      softwareSystem "Service"
      container "System"
      component "Interface"
      deploymentNode "Deployable Unit"
      infrastructureNode "Infrastructure Node"
      relationship "Relationship"
    }
  }
}
