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
  Rscript ${projectDir}/bin/build_alleletable.R \
    --amplicon-info ${amplicon_info} \
    --denoised-asvs ${denoised_asvs} \
    --processed-asvs ${processed_asvs}
  """
}