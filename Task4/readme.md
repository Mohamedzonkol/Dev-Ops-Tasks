# Nginx and PHP Setup 

## Overview

This document outlines the steps to set up a web server using Nginx and PHP 7.3. The setup includes configuring a virtual host, handling PHP files, serving static content, and ensuring proper gzip compression for static files.

## Task Breakdown

1. **Install Nginx**

   Install the Nginx web server to serve the web content and manage HTTP requests.

2. **Install PHP 7.3 and PHP-FPM**

   Install PHP version 7.3 and PHP-FPM (FastCGI Process Manager) to handle PHP requests efficiently.

3. **Install Common PHP 7.3 Modules**

   Install commonly used PHP modules for various functionalities and support.

4. **Create a Virtual Host on Nginx**

   Configure Nginx to create a virtual host for the domain `mobadra.com`. The virtual host configuration should point to the directory `/var/www/html`.

5. **Create `info.php` File**

   Create a file named `info.php` inside the `/var/www/html` directory. This file should contain the PHP `phpinfo()` script to display PHP configuration and information.

6. **Set the Server Name**

   Configure the Nginx server to use the domain name `mobadra.com` for the virtual host.

7. **Configure Nginx to Listen to PHP-FPM**

   Set Nginx to communicate with PHP-FPM on port 9000 to handle PHP requests.

8. **Add Static Folder**

   Create a folder under the root directory `/var/www/mobadra.com/html` named `static` and upload images to this folder.

9. **Create Static Location in Nginx**

   Configure Nginx to serve static content from the `/var/www/mobadra.com/html/static` directory. Create a static location for an image, e.g., `mobadra.com/static/image1.png`.

10. **Enable Gzip Compression for Static Files**

    Ensure that the images and other static files are served with gzip compression. Verify this by checking the `Content-Encoding` header in the response, which should show `gzip`.

## Summary

The setup involves configuring Nginx to serve both dynamic content via PHP-FPM and static content from a specific directory. The PHP info file allows verification of the PHP setup, while gzip compression ensures efficient delivery of static files.

