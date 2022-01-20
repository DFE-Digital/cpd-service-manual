deploymentEnvironment "Production" {
  deploymentNode "DfE Azure" {
    deploymentNode "GIAS" "" "Azure subscription" {
      softwareSystemInstance gias
    }

    deploymentNode "TRA" "" "Azure subscription" {
      softwareSystemInstance dqt
    }

    deploymentNode "Teach CPD" "" "Azure subscription" {
      containerInstance cip.key_vault
    }
  }

  deploymentNode "GOV UK PaaS" {
    deploymentNode "Department for Education" "" "Space" {
      deploymentNode "CPD Management Service" {
        deploymentNode "Docker Container" "" "Alpine Linux"  {
          softwareSystemInstance cpd_management cpd_management_group
        }

        #containerInstance cpd_management.cpd_management_db cpd_management_group
      }

      deploymentNode "ECT Support Service" {
        deploymentNode "Docker Container" "" "Alpine Linux" {
          softwareSystemInstance ect_support
        }

        #containerInstance ect_support.ect_support_db
        #containerInstance ect_support.ect_support_materials
      }

      deploymentNode "NPQ Registrations Service" {
        deploymentNode "Docker Container" "" "Alpine Linux" {
          softwareSystemInstance npq_registrations
        }

        #containerInstance npq_registrations.npq_registrations_db
      }
/*
      deploymentNode "CPD Sandbox Service" {
        deploymentNode "Docker Container" "" "Alpine Linux"  {
          softwareSystemInstance cpd_management cpd_management_group
        }

        #containerInstance cpd_management.cpd_management_db cpd_management_group
      }
*/
    }
  }
}
