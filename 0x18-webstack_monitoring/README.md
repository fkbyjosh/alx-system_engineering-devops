Web Stack Monitoring with Datadog
This project focuses on setting up and using Datadog to monitor a web server's metrics and create a dashboard for visualization. Below are the steps and tasks to complete the project.

Tasks
1. Set Up Datadog
Sign Up for Datadog:

Go to Datadog and sign up for a free account.

Ensure you are using the US website (https://app.datadoghq.com).

Select the US1 region during signup.

Install the Datadog Agent:

Follow the instructions provided on the Datadog website to install the Datadog agent on your server (web-01).

Create an Application Key:

Generate an application key in your Datadog account.

Update Intranet Profile:

Copy and paste your Datadog API key and application key into your Intranet user profile.

Verify Host Visibility:

Ensure your server (web-01) is visible in Datadog under the host name XX-web-01.

Use the Datadog API to validate the host visibility.

If necessary, update the hostname of your server.

2. Monitor System Metrics
Set up monitors in the Datadog dashboard to track system metrics:

Read Requests per Second: Monitor the number of read requests issued to the device per second.

Write Requests per Second: Monitor the number of write requests issued to the device per second.

Refer to the System Check documentation for more details on system metrics.

3. Create a Dashboard
Create a New Dashboard:

In Datadog, create a new dashboard.

Add Widgets:

Add at least 4 widgets to your dashboard. These can monitor any metrics of your choice.

Save the Dashboard ID:

Retrieve the dashboard_id using Datadog’s API.

Create a file named 2-setup_datadog with the dashboard_id on the first line.

Repository
GitHub Repository: alx-system_engineering-devops

Directory: 0x18-webstack_monitoring

Files
2-setup_datadog:

Contains the dashboard_id of the created Datadog dashboard.

Notes
Ensure the Datadog agent is properly installed and configured on web-01.

Use the Datadog API to validate host visibility and retrieve the dashboard_id.

Refer to Datadog’s documentation for detailed instructions on setting up monitors and dashboards.
