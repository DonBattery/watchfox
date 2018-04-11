# Statusfile library

Every service will get an unique filename parsed from hostname, port and  URL
excluding forbidden characters like **/** or **:**

Every line is a report gy FoxSentinel indicating the status of the Server, APP and
Database (either OK or Error). Comparing the two last lines can indicate a change in
the status of the examined service.
