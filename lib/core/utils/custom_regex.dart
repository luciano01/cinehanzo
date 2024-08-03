RegExp hasLowerCase = RegExp(r'[a-z]');
RegExp hasUpperCase = RegExp(r'[A-Z]');
RegExp hasNumber = RegExp(r'\d');
RegExp isValidLengthAndNoSpecialChars = RegExp(r'^[A-Za-z\d]{8,}$');

RegExp notStartOrEndWithDot = RegExp(r'^(?!\.)(.*?)(?<!\.)$');
RegExp noSpaces = RegExp(r'^\S+$');
RegExp noSpecialChars = RegExp(r'^[^\s<:>*]+$');
RegExp validFormat = RegExp(r'^[\w.-]+@[\w-]+\.[\w.]{2,}$');
