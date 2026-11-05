# Liquidación de la cosecha de una finca cafetera

Proyecto en Elixir para Programación III (Universidad del Quindío).

## Integrantes

- (agreguen aquí sus nombres — recuerden que también deben ir en un comentario al inicio de cada `.exs`)

## Requisitos

- Elixir 1.15 o superior, con Erlang/OTP 26 o superior (ver guía de instalación del curso).

## Cómo compilar y ejecutar

Desde la carpeta del proyecto:

```bash
elixirc parametros.exs util.exs datos.exs validacion.exs liquidacion.exs reportes.exs
elixir programa.exs
```

Cada vez que se modifique `datos.exs` (por ejemplo, el día de la sustentación, cuando el
docente reemplace este archivo por el suyo), hay que volver a compilarlo:

```bash
elixirc datos.exs
elixir programa.exs
```

Si se modifica cualquier otro módulo de apoyo (`parametros.exs`, `util.exs`,
`validacion.exs`, `liquidacion.exs`, `reportes.exs`), también hay que
recompilarlo con `elixirc` antes de volver a ejecutar `elixir programa.exs`.

## Estructura del proyecto

| Archivo             | Módulo        | Contenido                                                              |
| -------------------- | ------------- | ----------------------------------------------------------------------- |
| `parametros.exs`     | `Parametros`  | Constantes de negocio (tarifa, meta diaria, bonificación, etc.)         |
| `util.exs`           | `Util`        | Entrada/salida y formato de números (impuro)                            |
| `datos.exs`          | `Datos`       | Datos crudos: recolectores, lotes, pesajes (se reemplaza en la sustentación) |
| `validacion.exs`     | `Validacion`  | Reglas de validación de un pesaje y parseo de la línea de B.5 (puro)    |
| `liquidacion.exs`    | `Liquidacion` | Valor de pesaje, bonificación, descuento y liquidación (puro)           |
| `reportes.exs`       | `Reportes`    | Texto de los 8 reportes, `ranking/2` y combinación con otra finca (puro) |
| `programa.exs`       | `Programa`    | Orquesta todo; `main/0` es el punto de entrada (impuro)                 |

## Estado

- [x] Verificado contra los datos y la salida esperada del Anexo del enunciado (R1-R8,
      los tres casos de ejemplo de B.5 y el desprendible de R01 coinciden exactamente).
- [ ] **Pendiente:** reemplazar `datos.exs` por el dataset propio del grupo (mínimo 10
      recolectores con 4+ con alimentación, 4 lotes, pesajes en los 6 días, 80 pesajes
      válidos y al menos 2 pesajes inválidos por cada uno de los 5 motivos de rechazo).
- [ ] Pendiente: Parte A (diseño), Parte C (respuestas escritas) y Parte D (bitácora e
      IA) en el documento PDF de entrega.
