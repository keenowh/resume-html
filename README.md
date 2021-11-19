<h1 align="center"><a target="_blank" href="https://resume-html-one.vercel.app/">Online Resume</a></h1>

This website contains my online version of my resume. Full list of information will be listed here that are otherwise removed in the official resume to maintain the **"one page rule"**. (Screenshot is shown below)

### The following technologies are used here:
---
![aws](https://img.shields.io/badge/Amazon_AWS-232F3E?style=for-the-badge&logo=amazon-aws&logoColor=white)
A button leading to my one-page resume is hosted in Amazon S3. To keep the costs low, the object is stored under the storage class of **One-Zone Infrequent Access**. This is the costs the least to maintain while keeping the read-access for it in a matter of milliseconds (the next tier will have retrieval time of minutes to hours, yikes!). However, its availability is limited to one Available Zone which is not a concern as my resume is not a data of critical concern.

#### Terraform

To make provisioning of the AWS infrastructure self-documenting, it is implemented by an **Infrastructure-as-code** technology named Terraform. You can check the `main.tf` file in the source to view them. This saves me time as I don't need to access the console and be a **click-admin**. I wish to be a Site Reliability Engineer so this is a mini laboratory for me.

![tailwind](https://img.shields.io/badge/Tailwind_CSS-38B2AC?style=for-the-badge&logo=tailwind-css&logoColor=white)
To save myself from writing CSS, I've implemented the use of Tailwind for this. That way I can focus on the content and the technology to host this website instead of dealing with the front end too much.

### Screenshot
---
![image](https://user-images.githubusercontent.com/38880062/142573287-530abbe3-3bba-4c25-b7e1-36c370372c6e.png)
