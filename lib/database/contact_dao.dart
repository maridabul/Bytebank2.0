import 'package:bytebank2/models/contact.dart';
import 'package:sqflite/sqflite.dart';

import 'app_database.dart';

class ContactDao {
  static const String _contacts = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _accountNumber = 'account_number';

  static final String tableSql = 'CREATE TABLE $_contacts('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_accountNumber INTEGER)';

  Future<int> save(Contact contact) async {
    final Database db = await getDatabase();
    return toMap(contact, db);
  }

  Future<int> toMap(Contact contact, Database db) {
    final Map<String, dynamic> contactMap = Map();
    contactMap[_name] = contact.name;
    contactMap[_accountNumber] = contact.accountNumber;
    return db.insert(_contacts, contactMap);
  }

  Future<List<Contact>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_contacts);
    return toList(result);
  }

  List<Contact> toList(List<Map<String, dynamic>> result) {
    final List<Contact> contacts = List();
    for (Map<String, dynamic> row in result) {
      final Contact contact = Contact(
        row[_id],
        row[_name],
        row[_accountNumber],
      );
      contacts.add(contact);
    }
    return contacts;
  }
}
