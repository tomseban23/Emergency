import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notifi_emp/consts/consts.dart';


class Employee {
  final String name;
  final String role;
  final String department;
  final String lastMessage;
  final String timestamp;
  final String avatarUrl;
  final bool hasUnread;
  final bool isOnline;

  Employee({
    required this.name,
    required this.role,
    required this.department,
    required this.lastMessage,
    required this.timestamp,
    required this.avatarUrl,
    this.hasUnread = false,
    this.isOnline = false,
  });
}

class ChatMessage {
  final String message;
  final String timestamp;
  final bool isMe;

  ChatMessage({
    required this.message,
    required this.timestamp,
    required this.isMe,
  });
}

class EmployeeListPage extends StatefulWidget {
  @override
  _EmployeeListPageState createState() => _EmployeeListPageState();
}

class _EmployeeListPageState extends State<EmployeeListPage> {
  final TextEditingController _searchController = TextEditingController();
  
  final List<Employee> employees = [
    Employee(
      name: "Tom Sebastian",
      role: "Safety Officer",
      department: "Building A",
      lastMessage: "I've updated the evacuat...",
      timestamp: "9:45 AM",
avatarUrl: "assets/person/download (1).jpeg", 
      hasUnread: true,
      isOnline: true,
    ),
    Employee(
      name: "Aswin D Kumar",
      role: "Officer",
      department: "Chemical Plant",
      lastMessage: "",
      timestamp: "Yesterday",
      avatarUrl: "assets/person/download (2).jpeg", 
      isOnline: true,
    ),
    Employee(
      name: "Jeffin ",
      role: "Security",
      department: "Main Building",
      lastMessage: "Security check completed ...",
      timestamp: "Yesterday",
      avatarUrl: "assets/person/download (3).jpeg", 
      isOnline: true,
    ),
    Employee(
      name: "Lijoy",
      role: "HR Manager",
      department: "Administration",
      lastMessage: "Please confirm your atte...",
      timestamp: "May 17",
      avatarUrl: "assets/person/download.jpeg", 
      isOnline: true,
    ),
    Employee(
      name: "Hari ",
      role: "IT Support",
      department: "Tech Department",
      lastMessage: "System maintenance comp...",
      timestamp: "May 15",
      avatarUrl: "assets/person/images.jpeg", 
      isOnline: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightgrey2,
      body: SafeArea(
        child: Column(
          children: [
            // Search Bar Container
            Container(
                decoration: BoxDecoration(
                 color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
              
              child: Container(
                
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                  color: lightgrey,
                  borderRadius: BorderRadius.circular(30),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.black.withOpacity(0.05),
                  //     blurRadius: 8,
                  //     offset: Offset(0, 2),
                  //   ),
                  // ],
                ),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: "Search employees to chat...",
                    hintStyle: TextStyle(color: Colors.grey[500], fontSize: 16),
                    prefixIcon: Icon(Icons.search, color: Colors.grey[400], size: 20),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ),
            
            // Recent Label
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Text(
                "RECENT",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 137, 137, 137),
                  letterSpacing: 0.5,
                ),
              ),
            ),
            
            // Employee List with Cards
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: employees.length,
                itemBuilder: (context, index) {
                  final employee = employees[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatPage(employee: employee),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: [
                            // Avatar
                            Stack(
                              children: [
                               CircleAvatar(
  radius: 26,
  backgroundColor: Colors.grey[300],
  backgroundImage: AssetImage(employee.avatarUrl), // for asset
  // Or use NetworkImage(employee.avatarUrl) if URL
),

                                if (employee.isOnline)
                                  Positioned(
                                    right: 2,
                                    bottom: 2,
                                    child: Container(
                                      width: 16,
                                      height: 16,
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(color: Colors.white, width: 3),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            
                            SizedBox(width: 14),
                            
                            // Content
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        employee.name,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            employee.timestamp,
                                            style: TextStyle(
                                              fontSize: 13,fontWeight: FontWeight.bold,
                                              color: Colors.grey[500],
                                            ),
                                          ),
                                          if (employee.hasUnread)
                                            Container(
                                              margin: EdgeInsets.only(left: 8),
                                              width: 22,
                                              height: 22,
                                              decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius: BorderRadius.circular(11),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "1",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  
                                  SizedBox(height: 4),
                                  
                                  if (employee.lastMessage.isNotEmpty)
                                    Row(
                                      children: [
                                        Icon(Icons.check, size: 16, color: Colors.blue),
                                        SizedBox(width: 6),
                                        Expanded(
                                          child: Text(
                                            employee.lastMessage,
                                            style: TextStyle(
                                              fontSize: 14, fontWeight: FontWeight.w600,
                                              color: Colors.grey[600],
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  
                                  SizedBox(height: 6),
                                  
                                  Text(
                                    "${employee.role} • ${employee.department}",
                                    style: TextStyle(
                                      fontSize: 13, fontWeight: FontWeight.w600,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      
      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        child: Icon(Icons.chat_bubble_outline, color: Colors.white),
      ),
    );
  }

  Color _getAvatarColor(String name) {
    final colors = [
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.indigo,
      Colors.green,
    ];
    return colors[name.hashCode % colors.length];
  }
}


class ChatPage extends StatefulWidget {
  final Employee employee;

  ChatPage({required this.employee});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  
  List<ChatMessage> messages = [
    ChatMessage(
      message: "Good morning! I'll be conducting a safety inspection in Building A today.",
      timestamp: "9:15 AM",
      isMe: false,
    ),
    ChatMessage(
      message: "Thanks for the heads up. Any specific areas I should prepare for the inspection?",
      timestamp: "9:18 AM",
      isMe: true,
    ),
    ChatMessage(
      message: "We'll be focusing on emergency exits and assembly points. I noticed some issues with the current evacuation plan during our last drill.",
      timestamp: "9:22 AM",
      isMe: false,
    ),
    ChatMessage(
      message: "I see. The bottleneck at the east exit was concerning. Do you have suggestions for improvement?",
      timestamp: "9:25 AM",
      isMe: true,
    ),
    ChatMessage(
      message: "Yes, I'm working on a revised plan. Will share it with you after the inspection.",
      timestamp: "9:27 AM",
      isMe: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white, // Prevents color change on scroll
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black87),
            onPressed: () => Navigator.pop(context),
          ),
          title: Column(
            children: [
              Text(
                widget.employee.name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${widget.employee.role} • ${widget.employee.department}",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(width: 4),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ],
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.more_vert, color: Colors.black87),
              onPressed: () {},
            ),
          ],
        ),
        
        body: Column(
          children: [
            // Messages with Date Header inside ListView
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemCount: messages.length + 1, // +1 for date header
                itemBuilder: (context, index) {
                  // First item is the date header
                  if (index == 0) {
                    return Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 8),
                      margin: EdgeInsets.only(bottom: 8),
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            "Sunday, May 18",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  
                  // Remaining items are messages (adjust index by -1)
                  final message = messages[index - 1];
                  return _buildMessageBubble(message);
                },
              ),
            ),
            
            // Message Input
            Container(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.attach_file, color: Colors.grey[600], size: 20),
                      onPressed: () {},
                    ),
                  ),
                  
                  SizedBox(width: 12),
                  
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: TextField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          hintText: "Type a message...",
                          hintStyle: TextStyle(color: Colors.grey[500]),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        ),
                         minLines: 1,
  maxLines: 5, // 👈 restrict to 5 lines
  keyboardType: TextInputType.multiline,
  scrollPadding: EdgeInsets.all(20.0),
  scrollPhysics: BouncingScrollPhysics(),
                      ),
                    ),
                  ),
                  
                  SizedBox(width: 12),
                  
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xFF4285F4), // Google Blue
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.send, color: Colors.white, size: 18),
                      onPressed: _sendMessage,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageBubble(ChatMessage message) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!message.isMe) ...[
            // Avatar for received messages
           CircleAvatar(
  radius: 16,
  backgroundColor: Colors.grey[300],
  backgroundImage: AssetImage(widget.employee.avatarUrl), // or NetworkImage
),

            SizedBox(width: 8),
            // Message bubble for received messages
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.65,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // Fixed lightgrey reference
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 2,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Text(
                      message.message,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                        height: 1.3,
                      ),
                    ),
                  ),
                  SizedBox(height: 4),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      message.timestamp,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey[500],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ] else ...[
            // Spacer to push sent messages to the right
            Expanded(child: Container()),
            // Message bubble for sent messages
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.65,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Color(0xFF4285F4),
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 2,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Text(
                    message.message,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      height: 1.3,
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        message.timestamp,
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey[500],
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.done_all, size: 14, color: Color(0xFF4285F4)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      setState(() {
        messages.add(ChatMessage(
          message: _messageController.text.trim(),
          timestamp: "${DateTime.now().hour}:${DateTime.now().minute.toString().padLeft(2, '0')} AM",
          isMe: true,
        ));
      });
      _messageController.clear();
      
      // Auto scroll to bottom
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }
  }

  Color _getAvatarColor(String name) {
    final colors = [
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.indigo,
      Colors.green,
    ];
    return colors[name.hashCode % colors.length];
  }
}