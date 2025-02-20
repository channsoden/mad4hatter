/*
 * STEP - EXERCISE_TABLE
 * 
 */

process EXERCISE_TABLE {

  label 'process_single'
  conda 'envs/postproc-env.yml'

  publishDir(
    path: "${params.outDIR}",
    mode: 'copy'
  )

  input:
  path alleledata
 
  output:
  path("exercise_data.tsv"), emit: exercisedata

  script:
  """
  python3 ${projectDir}/bin/exercise_table.py \
   ${alleledata}
  """
}
