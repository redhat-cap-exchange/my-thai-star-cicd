#!/bin/bash

function create_pipeline {
  APP=$1
  CICD_PROJECT=$2
  STAGE=$3

  WORKDIR=jenkins/java
  TEMP_PIPELINE=$WORKDIR/$APP-pipeline-java-$STAGE.yaml

  cp $WORKDIR/pipeline-java-$STAGE.yaml $TEMP_PIPELINE

  # see https://stackoverflow.com/questions/19456518/invalid-command-code-despite-escaping-periods-using-sed
  sed -i '' -e "s|#PROJECT_NAME#|$APP|" $TEMP_PIPELINE
  sed -i '' -e "s|#CICD_PROJECT_NAME#|$CICD_PROJECT|" $TEMP_PIPELINE
  sed -i '' -e "s|#CICD_PROJECT_NAME2#|$CICD_PROJECT|" $TEMP_PIPELINE

  oc create -f $TEMP_PIPELINE -n $CICD_PROJECT
  
  rm $TEMP_PIPELINE
}

function create_imagestream {
  APP=$1
  PROJECT=$2
  STAGE=$3

  WORKDIR=templates
  TEMP_IMAGESTREAM=$WORKDIR/$APP-imagestream-java-$STAGE.yaml

  cp $WORKDIR/imagestream-java-$STAGE.yaml $TEMP_IMAGESTREAM

  # see https://stackoverflow.com/questions/19456518/invalid-command-code-despite-escaping-periods-using-sed 
  sed -i '' -e "s|#PROJECT_NAME#|$APP|" $TEMP_IMAGESTREAM

  oc create -f $TEMP_IMAGESTREAM -n $PROJECT
  
  rm $TEMP_IMAGESTREAM
}