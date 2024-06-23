# Postmortem

Upon the release of ALX's System Engineering & DevOps project 0x19 in Ghana, an outage occurred on an isolated Ubuntu 14.04 container running an Apache web server. GET requests to the server resulted in `500 Internal Server Error` responses instead of the expected HTML file for a simple Holberton WordPress site.

## Debugging Process
I encountered the issue upon starting the project and was tasked with resolving it.

1. Checked running processes with `ps aux`. Two `apache2` processes - `root` and `www-data` - were running correctly.
2. Examined the `sites-available` folder in the `/etc/apache2/` directory and confirmed the web server was serving content from `/var/www/html/`.
3. Ran `strace` on the PID of the `root` Apache process in one terminal while curling the server in another. `strace` provided no useful information.
4. Repeated step 3 for the PID of the `www-data` process. This time, `strace` revealed an `-1 ENOENT (No such file or directory)` error when trying to access `/var/www/html/wp-includes/class-wp-locale.phpp`.
5. Searched through the files in `/var/www/html/` using Vim to locate the erroneous `.phpp` file extension, which was found in the `wp-settings.php` file (Line 137: `require_once( ABSPATH . WPINC . '/class-wp-locale.php' );`).
6. Removed the trailing `p` from the line.
7. Tested the server again with `curl`. Received a 200 OK response.
8. Created a Puppet manifest to automate the error fix.

## Summation

The issue was caused by a typo in the WordPress application. Specifically, `wp-settings.php` was trying to load `class-wp-locale.phpp` instead of `class-wp-locale.php`.

## Prevention

This outage was an application error, not a web server error. To prevent similar issues in the future, consider the following:

- **Testing**: Thoroughly test the application before deployment. This error could have been caught and fixed earlier with proper testing.
- **Status Monitoring**: Implement an uptime-monitoring service like [UptimeRobot](https://uptimerobot.com/) to receive immediate alerts for website outages.

In response to this error, a Puppet manifest [0-strace_is_your_friend.pp](https://github.com/bdbaraban/holberton-system_engineering-devops/blob/master/0x17-web_stack_debugging_3/0-strace_is_your_friend.pp) was written to automate the correction of any similar typos in the future. The manifest replaces any `.phpp` extensions in `/var/www/html/wp-settings.php` with `.php`.

But of course, it will never happen again, because as programmers, we never make errors! 😉
