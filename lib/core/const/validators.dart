String? validatedEmail(String? email) {
  RegExp regex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  if (email!.isEmpty) {
    return 'El campo de email no puede estar vacío.';
  } else if (!regex.hasMatch(email)) {
    return 'Ingresa un email válido.';
  }
  return null;
}

String? validatedPhone(String? phone) {
  RegExp phoneRegex = RegExp(r'^\d{10}$');
  if (phone!.isEmpty) {
    return 'El campo de número de teléfono no puede estar vacío.';
  } else if (!phoneRegex.hasMatch(phone)) {
    return 'Ingresa un número de teléfono válido (10 dígitos).';
  }
  return null;
}

String? validatedPassword(String? password) {
  if (password == null || password.isEmpty) {
    return 'La contraseña no puede estar vacía.';
  } else if (password.length < 8) {
    return 'La contraseña debe tener al menos 8 caracteres.';
  } else if (!password.contains(RegExp(r'[A-Z]'))) {
    return 'La contraseña debe contener al menos una letra mayúscula.';
  } else if (!password.contains(RegExp(r'[0-9]'))) {
    return 'La contraseña debe contener al menos un carácter numérico.';
  }
  return null;
}

String? validateNumericString(String? input) {
  if (input == null || input.isEmpty) {
    return 'Este campo no puede estar vacío.';
  } else if (!RegExp(r'^[0-9]+$').hasMatch(input)) {
    return 'Ingresa solo números.';
  }
  return null;
}

String? validateAlphabeticText(String? input) {
  if (input == null || input.isEmpty) {
    return 'Este campo no puede estar vacío.';
  } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(input)) {
    return 'Ingresa solo letras, sin caracteres especiales ni números.';
  }
  return null;
}

String? validateNotEmpty(String? input) {
  if (input == null || input.isEmpty) {
    return 'Este campo no puede estar vacío.';
  }
  return null;
}

String? validateEqualPassword(String? value, String password) {
  if (value != password) {
    return 'Las contraseñas no coinciden';
  }
  return null;
}
