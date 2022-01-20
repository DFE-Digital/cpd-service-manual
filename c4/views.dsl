/*
# Level 1
systemContext cpd_management {
  include *
  autoLayout
}

systemContext ect_support {
  include *
  autoLayout
}

systemContext npq_registrations {
  include *
  autoLayout
}

# Level 2
container cpd_management {
  include *
  autoLayout
}

container ect_support {
  include *
  autoLayout
}

container npq_registrations {
  include *
  autoLayout
}

container github "continuous-improvement" "Continuous improvement and deployment (CI/CD) process" {
  include *
  autoLayout
}

container sentry_io "Alerting" "Operational alerts" {
  include *
  autoLayout
}

# Level 3
component cpd_management {
  include *
  autoLayout
}

component ect_support {
  include *
  autoLayout
}

component npq_registrations {
  include *
  autoLayout
}

component dqt.api {
  include *
  autoLayout
}

component gias.api {
  include *
  autoLayout
}

container slack {
  include *
  autoLayout
}

component slack.dfe {
  include *
  autoLayout
}

component data_studio.dashboards "operational-reports" "Operational reports dashboards" {
  include *
  autoLayout
}

# Level 4
# Code

#Supplementary diagrams
systemlandscape dfe {
  include *
  autoLayout
}

#dynamic

deployment * "Production" {
  include *
  autoLayout
}
*/
