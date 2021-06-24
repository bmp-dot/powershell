#Payload variables
$sysname = "ChangeME10"
$cpu = 8 

#UUID variables
$bpuuid = "12fc21e7-4362-4a77-917c-10c5914867d0"
$appuuid = "abe58561-5745-40f1-aef1-29c593ac5f15"
$substrateuuid = "5214fc2d-7a8f-476a-a480-c51be863cb2b"


#Connection variables 
$pc = "sa.lab.local"
$username = "xxxxx"
$password = "xxxxx"

#Setup API call
$uri = "https://"+$pc+":9440/api/nutanix/v3/blueprints/"+$bpuuid+"/simple_launch"
$Header = @{"Authorization" = "Basic "+[System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($username+":"+$password ))}
$ContentType = "application/json"

#API Call to Calm
Invoke-RestMethod -SkipCertificateCheck -Uri $uri -ContentType $ContentType -Headers $Header -Body $Body -Method "POST"

#JSON Payload
$Body = '
{
    "spec": {
        "app_name": "'+$sysname+'",
        "app_description": "REST API",
        "app_profile_reference": {
            "uuid": "'+$appuuid+'"
        },
        "runtime_editables": {
            "substrate_list": [
              {
                
                "uuid": "'+$substrateuuid+'",
                "value": {
                  "spec": {
                    "name": "'+$sysname+'",
                     "resources": {
                      "num_sockets": '+$cpu+'
                    }
                  }
                }
              }
            ]
          }
    }
}
'
