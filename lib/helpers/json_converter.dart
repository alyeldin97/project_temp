import 'dart:developer';

import 'package:pluralize/pluralize.dart';

jsonToDartConvertor(
    {required jsonObject, required String className, bool withToJson = false}) {
  String finalResult = "";
  List<Map> objects = [jsonObject];
  List<String> classNames = [className];
  Set<String> jsonKeys = {};
  String separator =
      "\n\n//****************************************************\n\n";

  String nullCheckGenerator(type) {
    if (type == "int" || type == "double") {
      return ".ifNullReturn(0)";
    } else if (type == "bool") {
      return ".ifNullReturn(false)";
    } else if (type == "String") {
      return ".ifNullOrEmptyReturn(\"\")";
    } else if (type == "List") {
      return ".ifNullOrEmptyReturn([])";
    } else {
      return ".ifNullReturn({})";
    }
  }

  String convertKeyToClassName(key) {
    return key[0].toUpperCase() + key.substring(1);
  }

  String singlurize(String name) {
    return Pluralize().singular(name);
  }

  String pluralize(String name) {
    return Pluralize().plural(name);
  }

  String semiClassConvertor(json, name) {
    String finalResult =
        "class ${singlurize(convertKeyToClassName(name)).convertToCamelCase()}Entity{";
    String fromJson =
        "factory ${name}Entity.fromJson(Map<String, dynamic> json) => ${name}Entity(\n";
    String toJson = "$separator Map<String, dynamic> toMap() => {";
    String toModel =
        "$separator ${name}Model toModel(){ \n\n return ${name}Model( \n";

    String type;
    String constructor = "\n${name}Entity({\n";
    json.forEach((String key, value) {
      jsonKeys.add(key);
      key = key.convertToCamelCase();
      type = value.runtimeType.toString();
      key = singlurize(key);

      if (type == 'String' ||
          type == 'int' ||
          type == 'bool' ||
          type == 'double') {
        finalResult += "\n $type $key;";
        fromJson +=
            "$key:(json[JsonKeys.$key] as $type?)${nullCheckGenerator(type)},\n";
        toJson += "JsonKeys.$key : $key,\n";
        constructor += "required this.$key,\n";
        toModel += "$key:$key,\n";
      } else if (value is List) {
        type = value[0].runtimeType.toString();

        if (type == 'String' ||
            type == 'int' ||
            type == 'bool' ||
            type == 'double') {
          finalResult += "\n List<$type> ${pluralize(key)};";
          constructor += "required this.${pluralize(key)}";
          toModel +=
              "${pluralize(key)}:${pluralize(key)}.map(($key) => $key.toModel()).toList(),\n";
          fromJson +=
              "${pluralize(key)}: List<$type>.from((json[JsonKeys.${pluralize(key)}] as List? )${nullCheckGenerator("List")}.map((${key}Map) => ${singlurize(key).convertToCamelCase().capitalize()}Entity.fromJson(${key}map))),\n";
          toJson +=
              "JsonKeys.${pluralize(key)}:List<$type>.from(${pluralize(key)}.map(($key) => $key)),";
        } else {
          finalResult +=
              "\n List<${convertKeyToClassName(key)}Entity> ${pluralize(key)};";
          constructor += "required this.${pluralize(key)},\n";
          fromJson +=
              "${pluralize(key)}: List<${convertKeyToClassName(key)}Entity>.from((json[JsonKeys.${pluralize(key)}] as List?)${nullCheckGenerator("List")}.map((${key}Map) => ${singlurize(key).convertToCamelCase().capitalize()}Entity.fromJson(${key}Map))),\n";
          toJson +=
              "JsonKeys.${pluralize(key)}:List<dynamic>.from(${pluralize(key)}.map(($key) => $key.toMap())),";
          toModel +=
              "${pluralize(key)}:${pluralize(key)}.map(($key) => $key.toModel()).toList(),\n";
        }

        // value.forEach((value) {});
      } else if (value is Map) {
        finalResult += "\n ${convertKeyToClassName(key)}Entity ${key}; \n";
        fromJson +=
            "$key:${convertKeyToClassName(key)}Entity.fromJson(json[JsonKeys.$key]),\n";
        toJson += "JsonKeys.$key : ${key}.toMap(),\n";

        constructor += "required this.$key,\n";
        toModel += "$key:$key,\n";

        // finalResult += "} class ${convertKeyToClassName(key)}{";
        // finalResult += "}\n";

        // finalResult +=
        // semiClassConvertor(value, convertKeyToClassName(key)) + "}\n";
      }
    });
    // finalResult += "}\n";
    finalResult +=
        "$constructor \n});\n //}\n //! UNCOMMENT THE LINE ABOVE THEN COPY INTO MODEL FILE  \n $separator";
    finalResult += "$fromJson);\n";
    finalResult += withToJson ? "$toJson };\n" : "";
    finalResult += "$toModel );}\n";
    return finalResult;
  }

  objectMapper(value, String name) {
    if (value is Map) {
      value.forEach((key, value) {
        if (value is List) {
          objectMapper(value[0], key);
        }
      });
      objects.add(value);
      classNames
          .add(singlurize(convertKeyToClassName(name)).convertToCamelCase());
    } else if (value is List) {
      objectMapper(value[0], name);
    } else {
      return;
    }
  }

  jsonObject.forEach((String key, value) {
    objectMapper(value, key);
  });

  int counter = 0;
  objects.forEach((object) {
    finalResult +=
        semiClassConvertor(object, "${classNames[counter++]}") + '}\n';
  });

  finalResult += "\n\n\n\n\n";
  jsonKeys.forEach((key) {
    finalResult += "static const ${key.convertToCamelCase()} = '$key';\n";
  });
  log(finalResult);
}

extension ConvertToCamelCase on String {
  String convertToCamelCase() {
    List indecies = [];
    String start = this;
    String end = '';
    for (int i = 0; i < length; i++) {
      if (start[i] == "_") {
        indecies.add(i);
      }
    }
    start = start.replaceAll('_', '');

    for (int i = 0; i < length - indecies.length; i++) {
      if (indecies.contains(i)) {
        end += start[i].toUpperCase();
        start[i].toUpperCase();
      } else {
        end += start[i];
      }
    }

    return end;
  }
}

extension Capitalize on String {
  String capitalize() {
    return this[0].toUpperCase() + substring(1);
  }
}
