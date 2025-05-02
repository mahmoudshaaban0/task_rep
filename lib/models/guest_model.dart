/// Model class for guest information
class Guest {
  final String id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String? avatarUrl;
  final String? avatarInitials;
  final double? averageSpend;
  final double? averageTip;
  final int? totalVisits;
  final int? totalOrders;
  final int? pointsEarned;
  final int? pointsRedeemed;
  final double? pointsAvailable;
  final String? lastVisit;
  final List<String>? allergies;
  final bool? upcomingVisit;
  final int? canceledBookings;
  final int? noShows;
  final List<String>? notes;
  final Map<String, dynamic>? preferences;
  final List<Map<String, dynamic>>? reviews;

  Guest({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    this.avatarUrl,
    this.avatarInitials,
    this.averageSpend,
    this.averageTip,
    this.totalVisits,
    this.totalOrders,
    this.pointsEarned,
    this.pointsRedeemed,
    this.pointsAvailable,
    this.lastVisit,
    this.allergies,
    this.upcomingVisit,
    this.canceledBookings,
    this.noShows,
    this.notes,
    this.preferences,
    this.reviews,
  });

  /// Create a Guest from a Map object (for JSON parsing)
  factory Guest.fromJson(Map<String, dynamic> json) {
    return Guest(
      id: json['id'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      avatarUrl: json['avatarUrl'] as String?,
      avatarInitials: json['avatarInitials'] as String?,
      averageSpend: json['averageSpend'] as double?,
      averageTip: json['averageTip'] as double?,
      totalVisits: json['totalVisits'] as int?,
      totalOrders: json['totalOrders'] as int?,
      pointsEarned: json['pointsEarned'] as int?,
      pointsRedeemed: json['pointsRedeemed'] as int?,
      pointsAvailable: json['pointsAvailable'] as double?,
      lastVisit: json['lastVisit'] as String?,
      allergies: json['allergies'] != null ? List<String>.from(json['allergies']) : null,
      upcomingVisit: json['upcomingVisit'] as bool?,
      canceledBookings: json['canceledBookings'] as int?,
      noShows: json['noShows'] as int?,
      notes: json['notes'] != null ? List<String>.from(json['notes']) : null,
      preferences: json['preferences'] as Map<String, dynamic>?,
      reviews: json['reviews'] != null ? List<Map<String, dynamic>>.from(json['reviews']) : null,
    );
  }

  /// Convert Guest to a Map object (for JSON encoding)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'avatarUrl': avatarUrl,
      'avatarInitials': avatarInitials,
      'averageSpend': averageSpend,
      'averageTip': averageTip,
      'totalVisits': totalVisits,
      'totalOrders': totalOrders,
      'pointsEarned': pointsEarned,
      'pointsRedeemed': pointsRedeemed,
      'pointsAvailable': pointsAvailable,
      'lastVisit': lastVisit,
      'allergies': allergies,
      'upcomingVisit': upcomingVisit,
      'canceledBookings': canceledBookings,
      'noShows': noShows,
      'notes': notes,
      'preferences': preferences,
      'reviews': reviews,
    };
  }
}
