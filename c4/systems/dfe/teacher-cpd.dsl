enterprise "Teacher CPD Division" {

  group "services" {

    cpd_management = softwareSystem "CPD Management Service" {

      group "datastores" {
        cpd_management_db = container "CPD Management DB" "" "PostgreSQL" "Datastore"
        cpd_mi_db = container "CPD MI DB" "" "PostgreSQL" "Datastore"
      }

      rails = container "CPD Management App" "" "Ruby on Rails" "Ruby" {

        group "API" {
          participants = component "Participants endpoints" "" "Restful JSON API" {
            -> cpd_management_db "Reads and Writes" "Encrypted postgreSQL connection"
          }

          declarations = component "Declarations endpoints" "" "Restful JSON API" {
            -> cpd_management_db "Reads and Writes" "Encrypted postgreSQL connection"
          }

          changes_in_circumstances = component "Changes in Circumstances endpoints" "" "Restful JSON API" {
            -> cpd_management_db "Reads and Writes" "Encrypted postgreSQL connection"
          }

          users = component "Users endpoint" "" "Restful JSON endpoint" {
            -> cpd_management_db "Reads and Writes" "Encrypted postgreSQL connection"
          }

          npq_registrations = component "NPQ Registrations endpoints" "" "Restful JSON API" {
            -> cpd_management_db "Reads and Writes" "Encrypted postgreSQL connection"
          }

          npq_acceptance = component "NPQ Acceptance endpoints" "" "Restful JSON API" {
            -> cpd_management_db "Reads and Writes" "Encrypted postgreSQL connection"
          }

          trn_validation = component "TRN Validation endpoints" "" "Restful JSON API" {
            -> cpd_management_db "Reads and Writes" "Encrypted postgreSQL connection"
          }
        }

        group "UI" {
          auth = component "Authorise" "" "GOV UK UI" {
            -> cpd_management.rails.users "Reads from" "HTTPS TLS 1.2"
          }

          manage_partnerships = component "Manage ECF Partnerships" "" "GOV UK UI" {
            -> cpd_management_db "Uses" "Encrypted postgreSQL connection"
          }

          manage_ecf_participants = component "Manage ECF Participants" "" "GOV UK UI" {
            -> cpd_management_db "Uses" "Encrypted postgreSQL connection"
          }

          register = component "ECF Registration " "" "GOV UK UI" {
            -> cpd_management_db "Uses" "Encrypted postgreSQL connection"
          }
        }

        health = component "Healthcheck" "" "Restful JSON API"

        component "Background tasks" "" "Worker" {
          -> cpd_management_db "Reads data from" "Encrypted postgreSQL connection"
          -> cpd_mi_db "Writes MI to" "Encrypted postgreSQL connection"
        }
      }
    }

    ect_support = softwareSystem "ECT Support Service" {

      group "datastores" {
        ect_support_db = container "ECT Support DB" "" "PostgreSQL" "Datastore"
        ect_support_materials = container "ECT Support Materials" "" "S3" "Blobstore"
      }

      rails = container "ECT Support App" "" "Ruby on Rails" "Ruby" {
        auth = component "Authorise" "" "GOV UK UI" {
          -> cpd_management.rails.users "Reads from" "HTTPS TLS 1.2"
        }

        learning_materials = component "CIP Learing Materials" "" "GOV UK UI" {
          -> ect_support_db "Reads and Writes" "Encrypted postgreSQL connection"
          -> ect_support_materials "Reads and Writes" "HTTPS TLS 1.2"

          -> cpd_management.rails.users "Reads from" "HTTPS TLS 1.2"
        }

        health = component "Healthcheck" "" "Restful JSON API"
      }
    }

    npq_registrations = softwareSystem "NPQ Registrations Service" {

      group "datastores" {
        npq_registrations_db = container "NPQ Registrations DB" "" "PostgreSQL" "Datastore"
      }

      rails = container "NPQ Registrations App" "" "Ruby on Rails" "Ruby" {
        auth = component "Authorise" "" "GOV UK UI" {
          -> cpd_management.rails.users "Reads from" "HTTPS TLS 1.2"
        }

        register = component "Register for an NPQ" "" "GOV UK UI" {
          -> npq_registrations_db "Reads and Writes" "Encrypted postgreSQL connection"

          -> cpd_management.rails.npq_registrations "Posts to" "HTTPS TLS 1.2"
          -> cpd_management.rails.trn_validation "Reads from" "HTTPS TLS 1.2"
        }

        health = component "Healthcheck" "" "Restful JSON API"
      }
    }
  }

  prometheus = softwareSystem "Prometheus"
}
