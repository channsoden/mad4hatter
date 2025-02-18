/*
 * STEP - EXERCISE_TABLE
 * 
 */

process EXERCISE_TABLE {

  conda 'envs/exercise_env.yml'

  input:
  path alleledata
  
  output:
  path("exercise_data.txt"), emit: exercisedata

  script:
  """
  python3 ${projectDir}/bin/exercise_table.py \
   ${alleledata}
  """
}
