import 'package:coding_challenge/models/contact.dart';

final contacts = <String>[
  "Adi Shamir",
  "Alan Kay",
  "Andrew Yao",
  "Barbara Liskov",
  "Kristen Nygaard",
  "Leonard Adleman",
  "Leslie Lamport",
  "Ole-John Dahl",
  "Peter Naur",
  "Robert E. Kahn",
  "Ronald L. Rivest",
  "Vinton F. Cerf",
];

List<Contact> getContactList() {
  return contacts
      .map((contact) => Contact(name: contact, group: contact[0]))
      .toList();
}