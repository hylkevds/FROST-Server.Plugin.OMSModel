From fraunhoferiosb/frost-server-http:2.1.0

COPY data ${CATALINA_HOME}/webapps/FROST-Server/WEB-INF/data
COPY index.html ${CATALINA_HOME}/webapps/FROST-Server/

ENV plugins_coreModel_enable=false
ENV plugins_actuation_enable=false
ENV plugins_multiDatastream_enable=false
ENV plugins_openApi_enable=true
ENV plugins_odata_enable=true
ENV plugins_modelLoader_enable=true
ENV plugins_modelLoader_modelPath=webapps/FROST-Server/WEB-INF/data/model
ENV plugins_modelLoader_modelFiles=Deployment.json,FeatureOfInterest.json,Host.json,ObservationCollection.json,Observation.json,ObservationType.json,ObservedProperty.json,Observer.json,ObservingProcedure.json,PreparationProcedure.json,PreparationStep.json,Result.json,SampleCollection.json,Sampler.json,Sampling.json,SamplingProcedure.json
ENV plugins_modelLoader_liquibasePath=../data/liquibase
ENV plugins_modelLoader_liquibaseFiles=tables.xml

USER tomcat
