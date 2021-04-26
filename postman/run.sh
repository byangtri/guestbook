#!/bin/bash
folder=""
collection=""
reports=""
env=""

APP_HOME="`pwd -P`"
REPORTS_DIR=$APP_HOME/reports

if [ -z $1 ]; then
  param="*** Unknown parameter value ***"
  exit 0
elif [ -n $1 ]
then
# otherwise make first arg as a param
  param=$1
  REPORT_FILE="$REPORTS_DIR/$param.xml"
fi

#CMD_LINE_ARGS=$(-e manager-environment.json -n 1 --delay-request 5000 --timeout-request 30000 --reporters cli,junit --reporter-junit-export $REPORT_FILE || echo 0)

case $param in
  "SmokeTest")
    FOLDER="SmokeTest"
    COLLECTION="./postman/QTestManager.postman_collection.json"
    ;;
    "login")
    FOLDER="Login"
    COLLECTION="./postman/login-and-logout.json"
    ;;
  "smoketest1")
    FOLDER="SmokeTest1"
    COLLECTION="QTestManagerSmokeTest1.postman_collection.json"
    ;;
  "smoketest2")
    FOLDER="SmokeTest2"
    COLLECTION="./postman/QTestManagerSmokeTest2.postman_collection.json"
    ;;
  "smoketest3")
    FOLDER="SmokeTest3"
    COLLECTION="./postman/QTestManagerSmokeTest3.postman_collection.json"
    ;;
  "smoketest4")
    FOLDER="SmokeTest4"
    COLLECTION="./postman/QTestManagerSmokeTest4.postman_collection.json"
    ;;
  "logout")
    FOLDER="Logout"
    COLLECTION="./postman/login-and-logout.json"
    ;;
  "release")
    FOLDER="Release"
    COLLECTION="./postman/release-and-build.json"
    ;;
  "build")
    FOLDER="Build"
    COLLECTION="./postman/release-and-build.json"
    ;;
  "module")
    FOLDER="Module"
    COLLECTION="./postman/module-and-requirement.json"
    ;;
  "requirement")
    FOLDER="Requirement"
    COLLECTION="module-and-requirement.json"
    ;;
  "test-case")
    FOLDER="Test Case"
    COLLECTION="./postman/test-case-and-test-cycle.json"
    ;;
  "test-cycle")
    FOLDER="Test Cycle"
    COLLECTION="test-case-and-test-cycle.json"
    ;;
  "automation-host")
    FOLDER="Automation host"
    COLLECTION="automation-host-and-test-run.json"
    ;;
  "test-run")
    FOLDER="Test Run"
    COLLECTION="automation-host-and-test-run.json"
    ;;
  "create-custom-fields")
    FOLDER="Creates a Custom Field of an Object Type"
    COLLECTION="./postman/create-and-get-custom-fields.json"
    ;;
  "get-custom-fields")
    FOLDER="Gets all Fields of an Object Type"
    COLLECTION="./postman/create-and-get-custom-fields.json"
    ;;
  "release-create-object-with-custom-fields")
    FOLDER="Release"
    COLLECTION="./postman/create-object-with-custom-field.json"
    ;;
  "build-create-object-with-custom-fields")
    FOLDER="Build"
    COLLECTION="./postman/create-object-with-custom-field.json"
    ;;
  "requirement-create-object-with-custom-fields")
    FOLDER="Requirement"
    COLLECTION="./postman/create-object-with-custom-field.json"
    ;;
  "test-case-create-object-with-custom-fields")
    FOLDER="Test Case"
    COLLECTION="./postman/create-object-with-custom-field.json"
    ;;
  "test-suite-create-object-with-custom-fields")
    FOLDER="Test suite"
    COLLECTION="./postman/create-object-with-custom-field.json"
    ;;
  "test-run-create-object-with-custom-fields")
    FOLDER="Test Run"
    COLLECTION="create-object-with-custom-field.json"
    ;;
  "defect-create-object-with-custom-fields")
    FOLDER="Defects"
    COLLECTION="create-object-with-custom-field.json"
    ;;
  "object-link")
    FOLDER="Object link"
    COLLECTION="object-link-and-test-log.json"
    ;;
  "test-log")
    FOLDER="Test Log"
    COLLECTION="object-link-and-test-log.json"
    ;;
  "query-objects")
    FOLDER="Query objects"
    COLLECTION="./postman/search-object.json"
    ;;
  "query-comments")
    FOLDER="Query comments"
    COLLECTION="./postman/search-object.json"
    ;;
  "query-histories")
    FOLDER="Query histories"
    COLLECTION="./postman/search-object.json"
    ;;
  "test-suite")
    FOLDER="Test Suite"
    COLLECTION="test-suite-and-update-system-fields.json"
    ;;
  "update-system-fields")
    FOLDER="Update system fields"
    COLLECTION="test-suite-and-update-system-fields.json"
    ;;
  "user-profile")
    FOLDER="User Profile"
    COLLECTION="./postman/user-profiles-and-update-custom-fields.json"
    ;;
  "update-custom-fields")
    FOLDER="Update custom fields"
    COLLECTION="./postman/user-profiles-and-update-custom-fields.json"
    ;;
  "user")
    FOLDER="User"
    COLLECTION="./postman/user-project.json"
    ;;
  "project")
    FOLDER="Project"
    COLLECTION="./postman/user-project.json"
    ;;
  "defect")
    FOLDER="Defect"
    COLLECTION="defect-and-attachment.json"
    ;;
  "attachment")
    FOLDER="Attachment"
    COLLECTION="defect-and-attachment.json"
    ;;
  "modify-test-log")
    FOLDER="Modify test log"
    COLLECTION="modify-test-log.json"
    ;;
    "admin-group")
    FOLDER="Admin Group"
    COLLECTION="./postman/admin-group.json"
    ;;
esac

eval set -- -e ./postman/manager-environment.json --insecure -n 1 --delay-request 7000 --timeout-request 60000 --reporters cli,junit --reporter-junit-export "$REPORT_FILE" || echo 0

#echo "/usr/bin/newman" run $COLLECTION --folder "$FOLDER" "$@"
echo newman run $COLLECTION --folder "$FOLDER" "$@"
#exec "/usr/bin/newman" run $COLLECTION --folder "$FOLDER" "$@"
exec newman run $COLLECTION --folder "$FOLDER" "$@"
