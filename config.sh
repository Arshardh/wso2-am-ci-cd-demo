#!/bin/sh

echo $(which apimcli)
/Users/Shared/Jenkins/Home/workspace/cicd/apimcli version

rm -rf $HOME/.wso2apimcli

echo 'setting up test environment'
/Users/Shared/Jenkins/Home/workspace/cicd/apimcli add-env -n test \
                    --registration https://localhost:9444/client-registration/v0.14/register \
                    --apim https://localhost:9444 \
                    --token https://localhost:8244/token \
                    --import-export https://localhost:9444/api-import-export-2.6.0-v10 \
                    --admin https://localhost:9444/api/am/admin/v0.14 \
                    --api_list https://localhost:9444/api/am/publisher/v0.14/apis \
                    --app_list https://localhost:9444/api/am/store/v0.14/applications
echo 'logging into test'
/Users/Shared/Jenkins/Home/workspace/cicd/apimcli login test -u $USERNAME -p $PASSWORD -k

echo 'setting up prod environment'
/Users/Shared/Jenkins/Home/workspace/cicd/apimcli add-env -n prod \
                    --registration https://localhost:9445/client-registration/v0.14/register \
                    --apim https://localhost:9445 \
                    --token https://localhost:8245/token \
                    --import-export https://localhost:9445/api-import-export-2.6.0-v10 \
                    --admin https://localhost:9445/api/am/admin/v0.14 \
                    --api_list https://localhost:9445/api/am/publisher/v0.14/apis \
                    --app_list https://localhost:9445/api/am/store/v0.14/applications
echo 'logging into prod'
/Users/Shared/Jenkins/Home/workspace/cicd/apimcli login prod -u $USERNAME -p $PASSWORD -k
