import 'package:flutter/material.dart';

import '../../../../data/models/user_model.dart';
import 'user_actions.dart';

Widget userListItem(UserModel user) {
  return ListTile(
    onTap: () {},
    title: Text(user.name ?? '-'),
    subtitle: Text('${user.email ?? '-'} | ${user.gender ?? '-'}'),
    trailing: userActions(user),
  );
}
