# Datasets — PFI "Monitoreo de adultos mayores" (Ellero · Ferrario)

Datasets utilizados en el Proyecto Final de Ingeniería (UADE, 2026) para desarrollar,
calibrar y evaluar el sistema de monitoreo de adultos mayores en el hogar con una
cámara única: detección de caídas, reconocimiento de actividades e inmovilidad, y
aprendizaje de la rutina diaria (línea base de comportamiento).

- **Código fuente del sistema:** <https://github.com/Lucasellero/PFI_Ellero_Ferrario_Backend>
  (repositorio privado; acceso por invitación).
- **Este repositorio** contiene las **anotaciones y datos tabulares** que usamos o
  generamos, en el mismo formato en que los consume el sistema.
- **Los videos** están en la sección
  [**Releases**](https://github.com/Lucasellero/PFI_Ellero_Ferrario_Datasets/releases/tag/v1.0)
  de este repositorio (ver "Descarga de los videos").

## Descarga de los videos

| Archivo | Contenido | Tamaño | Dónde |
|---|---|---|---|
| `GMDCSA-24.zip` | 229 videos (subset `fall1`–`fall4` + dataset oficial completo) + anotaciones | 1,46 GB | [Release v1.0](https://github.com/Lucasellero/PFI_Ellero_Ferrario_Datasets/releases/tag/v1.0) |
| `CAUCAFall.zip` | 100 videos `.avi` + etiquetas por frame (formato YOLO) + `Fall.csv` | 0,14 GB | [Release v1.0](https://github.com/Lucasellero/PFI_Ellero_Ferrario_Datasets/releases/tag/v1.0) |
| `URFD.zip` | 70 videos (`cam0`) + metadata oficial + `Fall.csv` | 0,10 GB | [Release v1.0](https://github.com/Lucasellero/PFI_Ellero_Ferrario_Datasets/releases/tag/v1.0) |
| `ToyotaSmarthome_actividades.zip` | 3.124 clips de actividades cotidianas (31 clases) | 2,36 GB | Enlace privado, enviado por correo |
| `ToyotaSmarthome_evaluacion_caidas.zip` | 39 clips cortos + 4 videos largos sin recortar | 0,35 GB | Enlace privado, enviado por correo |

Toyota Smarthome se comparte por un enlace privado porque su licencia no permite la
redistribución pública; para otros usos, el acceso se solicita en
<https://project.inria.fr/toyotasmarthome/>. CAUCAFall se distribuye sin los frames
extraídos en PNG que trae el original (7,6 GB), que son los mismos frames del video.
El Multiple Cameras Fall Dataset no se incluye porque no se usó en la evaluación final.

## Resumen

| # | Dataset | Tipo | Volumen usado | Uso en el proyecto | Licencia |
|---|---|---|---|---|---|
| 1 | **CASAS Smart Home** (WSU) | Eventos de sensores ambientales (CSV) | 81 hogares, 26,3 M eventos crudos → **319.229 actividades** etiquetadas | Línea base de rutinas y detección de desvíos | CC BY 4.0 |
| 2 | **GMDCSA-24** | Video RGB | 81 caídas + 79 actividades cotidianas (ADL), 4 actores | Calibración y evaluación de la detección de caídas | CC BY 4.0 |
| 3 | **CAUCAFall** | Video RGB | 100 clips (10 sujetos × 10 acciones: 5 caídas, 5 no-caídas) | Evaluación de caídas en entorno no controlado | CC BY 4.0 |
| 4 | **UR Fall Detection (URFD)** | Video RGB (cam0) | 70 clips (30 caídas + 40 ADL "casi caída") | Negativos difíciles: sentarse, agacharse, acostarse | CC BY-NC-SA 4.0 |
| 5 | **Toyota Smarthome** (Inria / Toyota Motor Europe) | Video RGB + esqueleto | 3.124 clips de actividades + 4 videos largos sin recortar (~1,4 h) | Entrenamiento de actividades (CLIP + esqueleto GRU); control de falsos positivos de caída en video doméstico continuo | Uso académico, con solicitud de acceso; **no redistribuible** |
| 6 | **Multiple Cameras Fall Dataset** (Auvinet et al., U. de Montréal) | Video RGB, 8 cámaras | 24 escenas | Explorado; quedó **fuera de la evaluación final** (inconsistencias de FPS y frames corruptos) | Uso académico |

## Estructura del repositorio

```
casas/
  casas_events.parquet          319.229 actividades etiquetadas (1 fila = 1 tramo de actividad)
  casas_timeline_10min.parquet  flujo de actividad a intervalos de 10 min (667.729 filas)
  _manifest.json                resumen del ETL por hogar (eventos, descartes, calidad)
  _quality_report.md            reporte de calidad de datos
caidas/
  GMDCSA-24/fall1..fall4/Fall.csv          ground truth (segundo de inicio/fin de cada caída)
  GMDCSA-24/official/Actor N/{Fall,ADL}.csv  anotaciones oficiales del dataset completo
  CAUCAFall/Fall.csv                        derivado de las etiquetas por frame del dataset
  URFD/Fall.csv, URFD/_meta/*.csv           derivado de las etiquetas oficiales por frame
  ToyotaSmarthome/Fall.csv                  clips cortos de actividades marcados como no-caída
  ToyotaSmarthome_FP/Fall.csv               4 videos largos sin caídas (control de falsos positivos)
  Kaggle/kaggle_data.csv                    frames de inicio/fin por cámara (no usado en la evaluación final)
```

### Formato de `caidas/*/Fall.csv`

Un archivo por dataset, una fila por clip:

```
File Name,Length (seconds),Time of Recording,Attire,Description, Classes
fall-01-cam0.mp4,5.33,,,URFD (UR Fall Detection Dataset) - fall-01,NoFall[0 to 2.73]; Fall[2.73 to 5.33]
```

La columna `Classes` indica los tramos de tiempo (en segundos) con y sin caída. Este
archivo es el ground truth con el que se evaluó el detector: el sistema no lo tiene
disponible cuando funciona en producción.

### Formato de `casas/casas_events.parquet`

Se lee con `pandas.read_parquet(...)`.

| Columna | Descripción |
|---|---|
| `hogar` / `video_id` | Identificador del hogar (cada hogar representa a un residente) |
| `actividad` | Actividad canónica (19 clases: `dormir`, `cocinar`, `comer`, `beber`, `medicacion`, `ver_tv`, `bano`, `salir_casa`, …) |
| `actividad_gruesa` | Agrupación en categorías más amplias |
| `etiqueta_original` | Etiqueta tal como viene en CASAS |
| `inicio`, `fin`, `duracion_s`, `duracion_min` | Intervalo de la actividad (hora local) |
| `hora`, `minuto_del_dia`, `dia_semana`, `fecha`, `franja`, `fin_de_semana` | Variables derivadas para el clustering por horario |
| `solapa`, `dia_dst` | Indicadores de calidad (actividad solapada, día con cambio de horario) |

Se derivó del archivo `labeled_data.zip` de CASAS con el ETL del repositorio de código
(`dataset_events/etl.py` y `build_table.py`): emparejado de etiquetas `begin`/`end`,
descarte de tramos corruptos (duración ≤ 0 o mayor a 20 h), estandarización de 56
etiquetas originales a 19 clases y exclusión de etiquetas que no corresponden al
residente (por ejemplo, ingreso de personal). El detalle está en `_quality_report.md` y
`_manifest.json`.

> Nota: la columna `actividad_gruesa` persistida corresponde a una versión anterior del
> mapeo de categorías. El módulo de línea base no la usa: recalcula las categorías al
> cargar los datos.

## Fuentes, licencias y citas

**1. CASAS Smart Home Datasets**: Washington State University.
<http://casas.wsu.edu/datasets/> · Zenodo DOI [10.5281/zenodo.15708568](https://doi.org/10.5281/zenodo.15708568) · CC BY 4.0.
> Cook, D. J., Crandall, A. S., Thomas, B. L., & Krishnan, N. C. (2013). CASAS: A Smart Home in a Box. *Computer*, 46(7), 62–69. https://doi.org/10.1109/MC.2012.328

**2. GMDCSA-24**: Zenodo DOI [10.5281/zenodo.11216408](https://zenodo.org/records/11216408) · CC BY 4.0.
> Alam, E., Sufian, A., Dutta, P., Leo, M., & Hameed, I. A. (2024). GMDCSA-24: A Dataset for Human Fall Detection in Videos. *Data in Brief*, 57, 110892. https://doi.org/10.1016/j.dib.2024.110892

**3. CAUCAFall**: CC BY 4.0 (descarga indicada en el artículo).
> Eraso Guerrero, J. C., Muñoz España, E., Muñoz Añasco, M., & Pinto Lopera, J. E. (2022). Dataset for Human Fall Recognition in an Uncontrolled Environment. *Data in Brief*, 45, 108610. https://doi.org/10.1016/j.dib.2022.108610

**4. UR Fall Detection Dataset**: Universidad de Rzeszów. <https://fenix.ur.edu.pl/~mkepski/ds/uf.html> · CC BY-NC-SA 4.0 (uso académico).
> Kwolek, B., & Kepski, M. (2014). Human Fall Detection on Embedded Platform Using Depth Maps and Wireless Accelerometer. *Computer Methods and Programs in Biomedicine*, 117(3), 489–501. https://doi.org/10.1016/j.cmpb.2014.09.005

**5. Toyota Smarthome**: Inria / Toyota Motor Europe. <https://project.inria.fr/toyotasmarthome/> · Acceso por solicitud, uso académico, no redistribuible públicamente. Los videos que usamos se comparten solo por enlace privado, para la evaluación del proyecto.
> Das, S., Dai, R., Koperski, M., Minciullo, L., Garattoni, L., Bremond, F., & Francesca, G. (2019). Toyota Smarthome: Real-World Activities of Daily Living. *ICCV 2019*. https://doi.org/10.1109/ICCV.2019.00092

**6. Multiple Cameras Fall Dataset**: Université de Montréal (también disponible como espejo en Kaggle).
> Auvinet, E., Multon, F., Saint-Arnaud, A., Rousseau, J., & Meunier, J. (2011). Fall Detection With Multiple Cameras: An Occlusion-Resistant Method Based on 3-D Silhouette Vertical Distribution. *IEEE Transactions on Information Technology in Biomedicine*, 15(2), 290–300. https://doi.org/10.1109/TITB.2010.2087385

## Datos propios

Los videos grabados durante la prueba en el hogar contienen imágenes de personas
reales y **no se publican**, de acuerdo con la Ley 25.326 de Protección de Datos
Personales.

---
Lucas Ellero · Ferrario — Proyecto Final de Ingeniería, UADE, 2026.
