# my-thai-star-cicd
My Thai Star CI/CD demo

## Setup

Before starting the deployment, log into OpenShift from the command line:

```shell
oc login https://master.openshift.example.com
```

Replace the above URL with the one pointing to your OpenShift cluster !

#### Step 1 - Create the CI/CD environment

Run the followig script to deploy Gogs, Nexus, SonarQube and Jenkins:

```shell
./scripts/create_cicd.sh cicd apps.openshift.example.com 'My Thai Star CI/CD'
```

Replace `apps.openshift.example.com` with the public wildcard DNS name of your OpenShift cluster.

