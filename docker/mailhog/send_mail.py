#!/usr/bin/env python3
import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart

# Set up the email details
sender_email = 'ruan@localhost'
receiver_email = 'receiver@localhost'
subject = 'This is a test mail'
message = """
Hi,

Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, 
but also the leap into electronic typesetting, remaining essentially unchanged. 

It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, 
and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.

Thank You.
"""

# Create a multipart message
msg = MIMEMultipart()
msg['From'] = sender_email
msg['To'] = receiver_email
msg['Subject'] = subject

# Attach the message to the email
msg.attach(MIMEText(message, 'plain'))

# Configure the SMTP server
smtp_server = 'localhost'
smtp_port = 1025
smtp_username = ''
smtp_password = ''

# Create a secure connection with the SMTP server
server = smtplib.SMTP(smtp_server, smtp_port)
# server.starttls()
server.login(smtp_username, smtp_password)

# Send the email
server.sendmail(sender_email, receiver_email, msg.as_string())

# Close the connection to the SMTP server
server.quit()

print("The email was sent")
