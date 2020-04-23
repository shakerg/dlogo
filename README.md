### DLOGO - the Demo Logo Change Webpage 

---
This is a simple logo change demo that is used to illistrate how to use CICD with containter pipelines.

Build the image either stand-alone or via the OpenShift builder, the output will create a website hosting an older Red Hat 'Shadowman' logo. To modify the site, just edit the index.html file and commit to git. This should be configured in your CICD tool to monitor repo changes and rebuild once triggered. The outcome would be the same site with new Red Hat logo. 

Images are included under /img 
Old Docker stuff (previous demo) located under /docker along with an example Jenkinsfile
