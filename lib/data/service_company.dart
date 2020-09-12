// Class which stores the service of the company.

class ServiceCompany {
  String _id;

  // Name of the company
  String _name;

  // Info of service that company provide.
  String _info;

  // Time of opening - closing.
  String _availabilityFrom;
  String _availabilityTo;

  // The Name of category.
  String _categoryName;

  ServiceCompany(this._id, this._name, this._info, this._availabilityFrom,
      this._availabilityTo, this._categoryName);

  String get categoryId => _categoryName;

  String get availabilityTo => _availabilityTo;

  String get availabilityFrom => _availabilityFrom;

  String get info => _info;

  String get name => _name;

  String get id => _id;
}
