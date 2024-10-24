import 'package:flutter/material.dart';
import 'enquiry_screen.dart';
import 'suggestions_screen.dart';
import 'complaints_screen.dart'; // Ensure this is the correct import for complaints

class FeedbackHub extends StatefulWidget {
  final String username; // Add username as a field in FeedbackHub

  FeedbackHub({required this.username}); // Constructor to accept username

  @override
  _FeedbackHubState createState() => _FeedbackHubState();
}

class _FeedbackHubState extends State<FeedbackHub>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this); // 3 tabs
  }

  @override
  void dispose() {
    _tabController.dispose(); // Dispose of the controller to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback Hub'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Suggestions'),
            Tab(text: 'Enquiry'),
            Tab(text: 'Complaints'),
          ],
          indicatorColor: Colors.white,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        physics: NeverScrollableScrollPhysics(), // Disables swiping
        children: [
          SuggestionsScreen(
              username: widget.username), // Pass username to SuggestionsScreen
          EnquiryScreen(
              username: widget.username), // Pass username to EnquiryScreen
          ComplaintsScreen(
              username: widget.username), // Pass username to ComplaintsScreen
        ],
      ),
    );
  }
}
