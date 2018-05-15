#!/usr/bin/env bash



(cd ../scheduling-api/; gradle clean build -x check)

(cd ../scheduling-portal/; gradle clean build -x check)

(cd ../scheduling/; gradle clean build -x check)


cp ../scheduling-api/scheduling-api-http/build/libs/scheduling-api-*-SNAPSHOT.war ../scheduling/dist/war/scheduling-api.war

cp ../scheduling-portal/scheduler-portal/build/libs/scheduler-portal-*.war ../scheduling/dist/war/scheduler.war

cp ../scheduling-portal/rm-portal/build/libs/rm-portal-*.war ../scheduling/dist/war/rm.war

cp -r ../studio/app ../scheduling/dist/war/studio