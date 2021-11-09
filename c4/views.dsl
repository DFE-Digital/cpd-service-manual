# Level 1
systemContext teacher_cpd {
  include *
  autoLayout
}

# Level 2
container teacher_cpd {
  include *
  autoLayout
}

/*
container github "continuous-improvement" "Continuous improvement and deployment (CI/CD) process" {
  include *
  autoLayout
}

container sentry_io "Alerting" "Operational alerts" {
  include *
  autoLayout
}
*/

# Level 3
component teacher_cpd.cpd_management {
  include *
  autoLayout
}

component teacher_cpd.ect_support {
  include *
  autoLayout
}

component teacher_cpd.npq_registrations {
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
/*
# Code
*/

#Supplementary diagrams
/*
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
