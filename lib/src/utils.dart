/// Check if value type is simple and single
bool isSingleType(dynamic value) =>
    value is int || value is double || value is String || value is bool;
