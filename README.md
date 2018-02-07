# rp-form
Salesforce form template for ResearchPark

## Development Instruction

### Preparation

The instruction is for MacOS.

1. Install [Homebrew](https://brew.sh/)
2. Install `Atom`

    ```bash
    brew cask install atom
    ```
3. Install [MavensMate Desktop](https://github.com/joeferraro/MavensMate-Desktop/releases)
4. Install `MavensMate-Atom`

    ```bash
    apm install MavensMate-Atom
    ```
5. Login into salesforce, goto `Setup`
	
	![](im/1.png)
6. Goto `Deploy -> Sandboxes` on the left explorer. Click `New Sanebox` to create a new sandbox. Select `Developer` license and click `Next`.
7. After your sandbox created, select `New Project` in `MavinsMate Desktop`, and choose type `Sandbox`. It allows to log in your project by web auth and you need the auth code from your manager.
	![](im/2.png)
8. After logging in, you're ready for development.

### Structure

To get your familiar with the salesforce, here are some basic components.

- Object (Custom Object)
	+ Object is the most important component in salesforce to store any information you collected form the users. It's like the database at the end.
	+ Goto `Create -> Objects` on the left explorer to view all the objects and to create new type of object.
- Visualforce Page / Visualforce Component
	+ Visualforce Page or Component performs ui.
	+ You can write html / css / js or apex component in it.
	+ Here's an [intruduction to visualforce](https://developer.salesforce.com/page/An_Introduction_to_Visualforce)
- Apex Classes
	+ Apex Classes is the controller part in the mvc structure.
	+ It could connect to Visualforce Page and perform some actions.

### Form Template

This repository provide you a basic form template. It's built on several open source libraries such as jQuery and BootStarp. I suggest to editing on this base since it can provide many general well-designed modules and there is no need to rewrite them.

The form is consisted by the following parts:

- Custom Object: Information to be collected and prompts.
- Visualforce Page: UI
- Apex Classes: Verify and save information.

You **have to** complete at least these three parts, if you needs more customization such as email notification or SPA, please follow the rest part of the document.

*Make sure you are working in sandboxes*

#### Custom Object

The first step is to define a custom object which could save the information you wish to collected. It could also provide some additional prompt text.

1. Goto `Create -> Objects` under `Setup` tab. Click on `New Custom Object` to create a new object.
	![](im/4.png)
2. Follow the instruction and the example, type in the name and label. You do not need to modify any fields other than the required one. Click `Save`.
3. Create or modified the fields under the `Custom Fields & Relationships` tab.
	![](im/5.png)
4. There're two fields important and need to be remembered. `API Name` will be used in the Apex Classes, and `Help Text` will be displayed on the webpage.
	![](im/6.png)

#### Apex Classes

1. Create an Apex Classes, copy and paste the Apex_Classes_Template.
2. Replace all `CUSTOM_OBJECT_API_NAME` with the API Name of the object you just created.
	![](im/7.png)

#### Visualforce Page

**TODO**

### Deployment to Production

Salesforce uses a mechanism called "Inbound / Outbound"

1. Log into your sandbox. Goto `Deploy -> Outbound Change Sets`.
2. Create a new change set, add the component you wish to apply to master. And add its dependencies.
	![](im/3.png)
3. Upload the change set.

### Accessibility to Public

**TODO**

### Email Notification

To send an email notification to either the user who submitted the form or the manager who will review the requests,

1. Create email template. Goto `Communication Templates -> Email Templates`, and create a new template with the content you wish to send to the user or the manager.
2. Create workflow. Goto `Workflow & Approvals -> Email Alerts`, and create a new action, select the template you just created and the recipients
3. Create rule. Goto `Workflow & Approvals -> Workflow Rules`, and create a new rule. Select the related object and choose criteria, then check the related action.
4. Finally deploy to production, then active it.

### Advanced: SPA

**TODO**
