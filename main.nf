
import workflow as WOFKLO

Workflow OLD_WORKFLOW{

}

Workflow TEST {
    TESTWORKFLOW
    OLD_WORKFLOW
}

WorkflowMain.initialise(workflow, params, log, args)

/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    NAMED WORKFLOW FOR PIPELINE
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/

include { WFBASECALLING } from './workflows/wfbasecalling'
include { TESTWORKFLOW } from './workflows/testworkflow'

//
// WORKFLOW: Run main amd/amdtowerdemo analysis pipeline
//
workflow RUN_WFBASECALLING {
    WFBASECALLING ()
}

//
// WORKFLOW: Run main amd/amdtowerdemo analysis pipeline with a known failure
//
workflow RUN_TESTWORKFLOW {
    TESTWORKFLOW ()
    WFBASECALLING ()
}