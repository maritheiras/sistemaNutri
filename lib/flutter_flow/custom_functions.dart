import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

double porcProteina(List<AlimentoStruct> listaAlimento) {
  double totalProteina = 0;
  double totalGeral = 0;

  for (var alimento in listaAlimento) {
    totalProteina += alimento.totalProteina;
    totalGeral += alimento.totalProteina +
        alimento.totalCaloria +
        alimento.totalCarboidrato;
  }

  if (totalGeral == 0) {
    return 0;
  }

  return double.parse(((totalProteina / totalGeral) * 100).toStringAsFixed(0));
}

double porcCaloria(List<AlimentoStruct> listaAlimento) {
  double totalCaloria = 0;
  double totalGeral = 0;

  for (var alimento in listaAlimento) {
    totalCaloria += alimento.totalCaloria;
    totalGeral += alimento.totalProteina +
        alimento.totalCaloria +
        alimento.totalCarboidrato;
  }

  if (totalGeral == 0) {
    return 0;
  }

  return double.parse(((totalCaloria / totalGeral) * 100).toStringAsFixed(0));
}

double porcCarboidrato(List<AlimentoStruct> listaAlimento) {
  double totalCarboidrato = 0;
  double totalGeral = 0;

  for (var alimento in listaAlimento) {
    totalCarboidrato += alimento.totalCarboidrato;
    totalGeral += alimento.totalProteina +
        alimento.totalCaloria +
        alimento.totalCarboidrato;
  }

  if (totalGeral == 0) {
    return 0;
  }

  return double.parse(
      ((totalCarboidrato / totalGeral) * 100).toStringAsFixed(0));
}

double somaProteina(List<AlimentoStruct> listaAlimento) {
  double totalProteina = 0;

  for (var alimento in listaAlimento) {
    totalProteina += alimento.totalProteina;
  }

  return double.parse(totalProteina.toStringAsFixed(2));
}

double porcTotalCaloria(List<RefeicoesRecord> listaRefeicoes) {
  double somaTotalProteina = 0;
  double somaTotalCaloria = 0;
  double somaTotalCarboidrato = 0;

  // Itera sobre a lista de refeições para somar os valores
  for (var refeicao in listaRefeicoes) {
    for (var alimento in refeicao.listaAlimento) {
      somaTotalProteina += alimento.totalProteina;
      somaTotalCaloria += alimento.totalCaloria;
      somaTotalCarboidrato += alimento.totalCarboidrato;
    }
  }

  // Soma geral de todos os nutrientes
  double somaTotalGeral =
      somaTotalProteina + somaTotalCaloria + somaTotalCarboidrato;

  // Evita divisão por zero
  if (somaTotalGeral == 0) {
    return 0; // Se não há valores, retorna 0%
  }

  // Calcula e retorna a porcentagem de calorias
  return double.parse(
      ((somaTotalCaloria / somaTotalGeral) * 100).toStringAsFixed(0));
}

double porcTotalCarboidrato(List<RefeicoesRecord> listaRefeicoes) {
  double somaTotalProteina = 0;
  double somaTotalCaloria = 0;
  double somaTotalCarboidrato = 0;

  // Itera sobre a lista de refeições para somar os valores
  for (var refeicao in listaRefeicoes) {
    for (var alimento in refeicao.listaAlimento) {
      somaTotalProteina += alimento.totalProteina;
      somaTotalCaloria += alimento.totalCaloria;
      somaTotalCarboidrato += alimento.totalCarboidrato;
    }
  }

  // Soma geral de todos os nutrientes
  double somaTotalGeral =
      somaTotalProteina + somaTotalCaloria + somaTotalCarboidrato;

  // Evita divisão por zero
  if (somaTotalGeral == 0) {
    return 0; // Se não há valores, retorna 0%
  }

  // Calcula e retorna a porcentagem de carboidratos
  return double.parse(
      ((somaTotalCarboidrato / somaTotalGeral) * 100).toStringAsFixed(0));
}

double porcTotalProteina(List<RefeicoesRecord> listaRefeicoes) {
  double somaTotalProteina = 0;
  double somaTotalCaloria = 0;
  double somaTotalCarboidrato = 0;

  // Itera sobre a lista de refeições para somar os valores
  for (var refeicao in listaRefeicoes) {
    for (var alimento in refeicao.listaAlimento) {
      somaTotalProteina += alimento.totalProteina;
      somaTotalCaloria += alimento.totalCaloria;
      somaTotalCarboidrato += alimento.totalCarboidrato;
    }
  }

  // Soma geral de todos os nutrientes
  double somaTotalGeral =
      somaTotalProteina + somaTotalCaloria + somaTotalCarboidrato;

  // Evita divisão por zero
  if (somaTotalGeral == 0) {
    return 0; // Se não há valores, retorna 0%
  }

  // Calcula e retorna a porcentagem de proteínas
  return double.parse(
      ((somaTotalProteina / somaTotalGeral) * 100).toStringAsFixed(0));
}

double somaCaloria(List<AlimentoStruct> listaAlimento) {
  double totalCaloria = 0;

  for (var alimento in listaAlimento) {
    totalCaloria += alimento.totalCaloria;
  }

  return double.parse(totalCaloria.toStringAsFixed(2));
}

double somaCarboidrato(List<AlimentoStruct> listaAlimento) {
  double totalCarboidrato = 0;

  for (var alimento in listaAlimento) {
    totalCarboidrato += alimento.totalCarboidrato;
  }

  return double.parse(totalCarboidrato.toStringAsFixed(2));
}

double somarTotalProteina(List<RefeicoesRecord> listaRefeicoes) {
  double somaTotalProteina = 0;

  for (var refeicao in listaRefeicoes) {
    for (var alimento in refeicao.listaAlimento) {
      somaTotalProteina += alimento.totalProteina;
    }
  }

  return double.parse(somaTotalProteina.toStringAsFixed(2));
}

double somarTotalCarboidrato(List<RefeicoesRecord> listaRefeicoes) {
  double somaTotalCarboidrato = 0;

  for (var refeicao in listaRefeicoes) {
    for (var alimento in refeicao.listaAlimento) {
      somaTotalCarboidrato += alimento.totalCarboidrato;
    }
  }

  return double.parse(somaTotalCarboidrato.toStringAsFixed(2));
}

double somarTotalCaloria(List<RefeicoesRecord> listaRefeicoes) {
  double somaTotalCaloria = 0;

  for (var refeicao in listaRefeicoes) {
    for (var alimento in refeicao.listaAlimento) {
      somaTotalCaloria += alimento.totalCaloria;
    }
  }

  return double.parse(somaTotalCaloria.toStringAsFixed(2));
}
