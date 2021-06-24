$Uri = "https://sa.lab.local:9440/api/nutanix/v3/blueprints/12fc21e7-4362-4a77-917c-10c5914867d0/simple_launch"
$username = "xxxx"
$password = "xxxx"
$Header = @{"Authorization" = "Basic "+[System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($username+":"+$password ))}
$ContentType = "application/json"
Invoke-RestMethod -SkipCertificateCheck -Uri $Uri -ContentType $ContentType -Headers $Header -Body $Body -Method "POST"

$Body = @'
{
    "spec": {
        "app_name": "CHANGEME2",
        "app_description": "REST API",
        "app_profile_reference": {
            "kind": "app_profile",
            "name": "AHV",
            "uuid": "abe58561-5745-40f1-aef1-29c593ac5f15"
        },
        "runtime_editables": {
            "substrate_list": [
              {
                
                "uuid": "5214fc2d-7a8f-476a-a480-c51be863cb2b",
                "value": {
                  "spec": {
                    "name": "CHANGEME2",
                     "resources": {
                      "num_sockets": 4
                    }
                  }
                }
              }
            ]
          }
    }
}
'@
