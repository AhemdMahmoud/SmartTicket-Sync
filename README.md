[![View on LinkedIn](https://img.shields.io/badge/LinkedIn-View_Post-blue?style=for-the-badge&logo=linkedin)](https://www.linkedin.com/posts/ahmed-mahmoud-80356b220_vois-iti-activity-7400783166271205376-eZHM?utm_source=share&utm_medium=member_android&rcm=ACoAADecsMMBu97hTyRUDC5CXeHA2jlzrbQpdVE)
# SmartTicket Sync

## Project Overview
![SmartTicket Sync Workflow](https://github.com/user-attachments/assets/d03633f0-862a-4d3a-b7b5-cb82d3d588f7)



**SmartTicket Sync** is a Bash scripting project developed as part of the ITI training program, inspired by real-world operational challenges encountered in enterprise environments like VOIS (Vodafone Intelligent Solutions).

The project addresses a critical synchronization issue between monitoring tools (such as Grafana) and ticketing systems, where incidents may be closed while their corresponding events remain open in the monitoring platform.

---

## Problem Statement

In production environments, monitoring tools receive events from various sources (servers, applications, infrastructure components). Each event represents a specific issue:

- Disk space warnings
- Buffering issues
- Service disruptions
- And more...

When an event is detected, an **Incident Number** is automatically generated in the ticketing system. Ideally, when the issue is resolved:

✅ The incident should be closed  
✅ The corresponding event should be closed

### The Challenge

However, a common problem occurs in real-world operations:

❌ The incident gets closed in the ticketing system  
⚠️ **But the event remains open** in the monitoring tool

This creates a discrepancy where the monitoring dashboard shows ongoing issues that have actually been resolved, leading to:

- False alerts
- Confusion for operations teams
- Unnecessary escalations
- Poor system health visibility

---

## Solution

**SmartTicket Sync** automates the synchronization process by checking incident statuses and automatically closing related events when appropriate.

### How It Works

![SmartTicket Sync Workflow](https://github.com/user-attachments/assets/d03633f0-862a-4d3a-b7b5-cb82d3d588f7)



The script follows this logic flow:

1. **User Input**: The operator enters an Incident Number
2. **Status Check**: The script checks the incident status from `ticket_status.txt`
3. **Decision Logic**:
   
   **If Incident is OPEN:**
   - No action is taken
   - Script notifies the user that the event is still active
   - Process exits

   **If Incident is CLOSED:**
   - Script retrieves the associated Event ID
   - Checks if the Event is still open in `events_status.txt`
   - If Event is open:
     - Changes Event status to "closed"
     - Appends the closure to `ClosedEvent.txt` for audit trail
     - Updates `events_status.txt`
   - Process exits

---

## Project Structure

```
SmartTicket-Sync/
│
├── images/
│   └── workflow-diagram.png          # System architecture and flow diagram
│
├── FScript.sh                         # Main script for ticket-event sync
├── ticket_status.txt                  # Stores incident status (open/closed)
├── events_status.txt                  # Stores event status (open/closed)
├── events_tickets.txt                 # Maps events to incident numbers
├── ClosedEvent.txt                    # Audit log for closed events
│
└── README.md                          # Project documentation
```

---

## Technical Implementation

### Prerequisites

- Bash shell (Linux/Unix environment)
- Read/write permissions on project files
- Basic understanding of incident management workflows

### File Formats

**ticket_status.txt**
```
INC0000401355  open
INC0000401356  closed
```

**events_status.txt**
```
6192fd9a-9b03-71ec-01b9-0a4e23470000  opened
6192fd9a-7c20-71ec-01b9-0a4e23474567  closed
```

**events_tickets.txt**
```
6192fd9a-7c20-71ec-01b9-0a4e23474567  INC0000401356
6192fd9a-9b03-71ec-01b9-0a4e23470000  INC0000401355
```

### Usage

```bash
$ bash FScript.sh ticket_status.txt events_tickets.txt events_status.txt

Please enter your incident number:
INC0000401356
Event: 6192fd9a-7c20-71ec-01b9-0a4e23474567 closed Successfully 😍😍
```

---

## Real-World Context

This project was developed based on actual operational scenarios at **VOIS (Vodafone Intelligent Solutions)**, where monitoring systems like Grafana continuously track server health and automatically generate incidents for detected issues.

The instructor (Ahmed Mahmoud) referenced this real production problem while teaching Bash scripting, though he intentionally avoided mentioning the specific monitoring tool used in production 😂.

---

## Key Learning Outcomes

Through this project, students learned:

- File I/O operations in Bash
- Conditional logic and decision trees
- Real-world incident management workflows
- Automation of manual operational tasks
- Data synchronization between systems
- Audit trail implementation

---

## Future Enhancements

Potential improvements for the project:

- Integration with actual monitoring APIs (Grafana, Prometheus, Nagios)
- Email notifications on event closure
- Batch processing for multiple incidents
- Web interface for easier management
- Integration with ITSM platforms (ServiceNow, Jira Service Management)
- Logging and monitoring of script execution

---

## Contributors

Developed by: **Ahmed Mahmoud** (Instructor)  
Training Program: **ITI - Information Technology Institute**  
Module: **Bash Scripting & Linux Operations**

---

## License

This project is developed for educational purposes as part of the ITI training curriculum.

---

## Acknowledgments

Special thanks to the VOIS operations team for providing real-world insights that inspired this project, and to the ITI program for fostering practical, industry-relevant learning experiences.
