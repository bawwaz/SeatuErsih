import 'package:flutter/material.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Navigate to settings page
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildNotificationItem(
            title: '1 no money, recharge your card or add another card',
            description:
                'We were unable to debit funds from your card. You may not have enough...',
            time: '14:00',
            isNew: true,
          ),
          _buildNotificationItem(
            title: 'Cancellation of service',
            description:
                'Unfortunately the service cannot be performed on September 15 at 15:06...',
            time: '14:00',
          ),
          _buildNotificationDateLabel('12-th of September'),
          _buildNotificationItem(
            title: 'Have time to pick up the discount',
            description:
                'A Qoffer with an 80% discount is available in the "Branch" barbershop...',
            time: '14:00',
            isNew: true,
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem({
    required String title,
    required String description,
    required String time,
    bool isNew = false,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isNew)
            Icon(
              Icons.circle,
              color: Colors.green,
              size: 10.0,
            ),
          SizedBox(width: isNew ? 8.0 : 0.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 16.0),
          Text(
            time,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationDateLabel(String date) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(bottom: 16.0),
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Text(
          date,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}