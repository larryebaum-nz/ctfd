# ctfd-deploy

## Deploy  
1. Ensure you are in the **lacework-dev/ctfd-deploy** repo.  
1. Select **Actions** from the menu.  
1. Select the **Deploy CTFD Instance** workflow on the left side pane.   
1. Click the **Run workflow** menu on the right side of the screen.  

![image](https://user-images.githubusercontent.com/6776768/221995886-fba527d0-f5c0-4118-b154-47e87e0b1898.png)


Fill in the required fields and click the green `Run workflow`  
1. **Email of requester:** If another Lacework employee has requested you to setup the CTF, provide the email of that person (the requester), else this is your email. A Slack message with the details of the instance will be sent to this person, so be sure to use the email associated with Slack.
1. **CTF instance prefix:** A DNS prefix to uniquely identify your CTF instance from all others. ACME will result in ACME-CTF.cnapp.biz (there is no current validation for uniqueness, so please make an attempt).  
1. **Hours until:** An automated reaper will auto terminate your CTF infra this many hours after you create it.  
1. **Customer:** Please identify the name of the customer (or team if internal) benefitting from this CTF.  
1. **Question bank category:** Select a question bank to be loaded into your CTF instance. Details on the available questions banks is below.  
1. **Number of participants:** Select a range being certain to account for any last minute additions.  

![image](https://user-images.githubusercontent.com/6776768/224399920-f8c84fd4-04dd-49df-8fef-1a7c04688938.png)


## Question Banks
Surprise! We've only one so far... we're hard at work making more.
* **Field_Facing:** For use by anyone working directly with customers, such as direct sales, with channel/partner and associated customers, etc.
* **SE_Enablement-(internal_use_only):** For internal use with SE Enablement - NOT FOR CUSTOMER USE
* **SKO_2024:** For internal use - NOT FOR CUSTOMER USER

## Processsing Time
While the Action completes within a couple minutes, there are tasks that take longer to complete as the instance comes online, so while you may see a green checkmark indicating completion, please wait approximately **10 minutes** before attempting to access your CTF instance.

## Retrieve CTF IP Address
The submitter will receive a Slack DM with the CTF instance details within a couple minutes of submission.  
  
![image](https://user-images.githubusercontent.com/6776768/223554970-dfd3b59e-fc00-4501-84ed-e7ddbde7ab02.png)

Alternatively, after the initial couple minutes of processing, you can click into the **Deploy Instance** run you triggered.

![image](https://user-images.githubusercontent.com/6776768/222182955-43035809-0244-4bdb-9d5e-a20bb5e0d6e3.png)

Click on the **Deploy Instance** icon to display more details about the run.
![image](https://user-images.githubusercontent.com/6776768/221998370-973c6d77-0882-4f69-8e35-6334c8a6ca96.png)

From within the details of the job run, expand the **Terraform Apply** row by clicking the down arrow on the left side.
![image](https://user-images.githubusercontent.com/6776768/222000391-1a7e15a0-25ff-41e8-b233-a6139d4a1953.png)

Scroll to the bottom of the text and you should see text that says **Outputs:** and some text below that includes a public IP address. After the processing time above has elapsed, point your web browser at the IP address supplied to access your CTF instance.

```
Outputs:

CONNECT = "After several minutes, attempt to connect via browser to your CTFd instance using the public IP address. If you see a '502 Bad Gateway' error, wait a bit longer and then refresh."
WAIT = "Install requires about 10 minutes. Please wait a bit."
ctfd_publicip = "<PUBLIC IP ADDRESS>"
```

## Login to CTF
Each CTF instance includes a default admin user with the credential **admin** and password **Lacework123!**

## Adding Users
1. Click the wrench icon to access the admin tab, then Users, then the '+' icon to create CTF user(s)
1. Participants will need access to a Lacework tenant such as partner-demo. SEs can create a session on the [Workshop Event Engine](https://ee.laceworkalliances.com/sessions/) and share the resulting link with participants at the start of the event. This will enable each participant to self register and create their Lacework tenant login, thus allowing for last minute attendees to be included.
1. Upon completion of the CTF event, the SE must delete the users added to the Lacework tenant. We hope to automate this in the future.

The size of the CTF instance will be adjusted to suite the quantity of participants indicated. For larger events, please contact the CTF team.

---
### CTFD-Deploy Management
As CTF build files are updated (periodically) the .zip file must be added to the AWS Lightsail storage bucket 'ctf-objects' (account: 552339396365) **and** the repo Terraform `variables.tf` file must be updated to reflect the new file name.  

Should net new questionbank files be developed, the GitHub action `deploy.yml` file must be updated to add additional drop-down menu items **and** the Terraform `variables.tf` file must be updated to include the additional variable map entry.

### Questions
@larryebaum
