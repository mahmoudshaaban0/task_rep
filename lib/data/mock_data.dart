import '../models/guest_model.dart';

/// Mock data for the guest book
class MockData {
  /// Get a list of mock guests
  static List<Guest> getMockGuests() {
    return [
      Guest(
        id: '1',
        fullName: 'Lia Thomas',
        email: 'lia.thomas516@reddit.com',
        phoneNumber: '+1 212-456-7890',
        avatarInitials: 'LT',
        averageSpend: 0.00,
        averageTip: 0.00,
        totalVisits: 0,
        totalOrders: 0,
        pointsEarned: 0,
        pointsRedeemed: 0,
        pointsAvailable: 0.00,
        lastVisit: '--/--',
        allergies: [],
        upcomingVisit: false,
        canceledBookings: 0,
        noShows: 0,
        notes: [],
        preferences: {},
      ),
      Guest(
        id: '2',
        fullName: 'Bergnaum',
        email: 'cleanahills@gmail.com',
        phoneNumber: '+1 212-450-7890',
        avatarInitials: 'B',
      ),
      Guest(
        id: '3',
        fullName: 'Wunderlich',
        email: 'wunder@gmail.com',
        phoneNumber: '+1 212-456-7890',
        avatarInitials: 'W',
      ),
      Guest(
        id: '4',
        fullName: 'Arjun Gerhold',
        email: 'alaskanm@dog.com',
        phoneNumber: '+1 122-456-7890',
        avatarInitials: 'AG',
      ),
      Guest(
        id: '5',
        fullName: 'Simeon Wilderman',
        email: 'simeon@user.com',
        phoneNumber: '+1 287-456-7890',
        avatarInitials: 'SW',
      ),
      Guest(
        id: '6',
        fullName: 'Eden Kautzer',
        email: 'edenka@user.com',
        phoneNumber: '+1 212-456-7090',
        avatarInitials: 'EK',
      ),
      Guest(
        id: '7',
        fullName: 'Gino Yost',
        email: 'gyost@test.com',
        phoneNumber: '+1 222-456-7890',
        avatarInitials: 'GY',
      ),
      Guest(
        id: '8',
        fullName: 'Ayden Veum',
        email: 'aydenv@gmail.com',
        phoneNumber: '+1 212-856-7890',
        avatarInitials: 'AV',
      ),
    ];
  }

  /// Get sample reviews for a guest
  static List<Map<String, dynamic>> getSampleReviews() {
    return [
      {
        'platform': 'Google',
        'rating': 4.5,
        'comment': 'The food was absolutely delicious and served with great presentation. The staff were friendly and attentive.',
        'date': '2023-06-15',
      },
      {
        'platform': 'Yelp',
        'rating': 4.0,
        'comment': 'The service was prompt and attentive, making our evening enjoyable. Highly recommend this gem.',
        'date': '2023-07-22',
      },
      {
        'platform': 'Foursquare',
        'rating': 5.0,
        'comment': 'I highly recommend trying their Japan Chicken. It was bursting with flavor.',
        'date': '2023-08-05',
      },
    ];
  }
}
