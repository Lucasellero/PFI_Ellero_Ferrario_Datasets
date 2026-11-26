# Datasets del PFI: Monitoreo de adultos mayores

Acá están los datasets que usamos en nuestro Proyecto Final de Ingeniería (UADE, 2026).
El proyecto es un sistema que monitorea a un adulto mayor en su casa con una sola
cámara: detecta caídas, reconoce actividades y periodos de inmovilidad, y aprende su
rutina diaria para avisar cuando algo cambia.

El resto del proyecto:

- Backend (detección, línea base y API): [PFI_Ellero_Ferrario_Backend](https://github.com/Lucasellero/PFI_Ellero_Ferrario_Backend)
- App móvil: [PFI_Ellero_Ferrario_Frontend](https://github.com/Lucasellero/PFI_Ellero_Ferrario_Frontend)
- Informe (LaTeX): [PFI_Ellero_Ferrario](https://github.com/Lucasellero/PFI_Ellero_Ferrario)

## Qué usamos

| Dataset | Qué es | Cuánto usamos | Para qué lo usamos | Licencia |
|---|---|---|---|---|
| CASAS Smart Home | Registros de sensores de movimiento y puertas en casas reales | 81 hogares, 319.229 actividades | Aprender la rutina diaria y detectar cambios | CC BY 4.0 |
| GMDCSA-24 | Videos de caídas y actividades cotidianas | 229 videos | Calibrar y evaluar la detección de caídas | CC BY 4.0 |
| CAUCAFall | Videos de caídas en entornos no controlados | 100 videos | Evaluar la detección de caídas | CC BY 4.0 |
| UR Fall Detection (URFD) | Videos de caídas y de movimientos parecidos (sentarse, agacharse, acostarse) | 70 videos | Que el sistema no confunda esos movimientos con una caída | CC BY-NC-SA 4.0 |
| Toyota Smarthome | Videos de actividades cotidianas en una casa | 3.124 clips + 4 videos largos (~1,4 h) | Entrenar el reconocimiento de actividades y medir falsas alarmas en video continuo | Uso académico, no se puede redistribuir |
| Multiple Cameras Fall Dataset | Videos de caídas con 8 cámaras | 24 escenas | Lo probamos pero lo dejamos afuera de la evaluación final (problemas de FPS y frames dañados) | Uso académico |

## Cómo está organizado

```
caidas/
  GMDCSA-24/           videos + Fall.csv
  CAUCAFall/           videos .avi + Fall.csv + etiquetas_por_frame.zip
  URFD/                videos + Fall.csv + metadata original (_meta/)
  ToyotaSmarthome/     Fall.csv (los videos van por link aparte, ver abajo)
  ToyotaSmarthome_FP/  Fall.csv (ídem)
  Kaggle/              kaggle_data.csv (Multiple Cameras, sin videos)
casas/
  casas_events.parquet          una fila por actividad
  casas_timeline_10min.parquet  la actividad de cada casa en bloques de 10 minutos
  _manifest.json                resumen por hogar
  _quality_report.md            reporte de calidad de los datos
```

Para bajar todo de una vez: botón **Code → Download ZIP**.

Los videos de Toyota Smarthome no están en el repo porque su licencia no permite
publicarlos. Están en esta carpeta de Google Drive, para la evaluación del proyecto:
<https://drive.google.com/drive/folders/1ckW1OigrIgHPknQhuLv20tp_4vnCflpX?usp=sharing>.
Para otros usos se piden en <https://project.inria.fr/toyotasmarthome/>.

De CAUCAFall no subimos los frames sueltos en PNG que trae el original (7,6 GB), porque
son los mismos frames que ya están en los videos.

## Los archivos Fall.csv

Cada carpeta de caídas tiene un `Fall.csv` con una fila por video, que dice en qué
segundos hay caída y en cuáles no:

```
File Name,Length (seconds),Time of Recording,Attire,Description, Classes
fall-01-cam0.mp4,5.33,,,URFD (UR Fall Detection Dataset) - fall-01,NoFall[0 to 2.73]; Fall[2.73 to 5.33]
```

Con estos archivos medimos qué tan bien detecta caídas el sistema. Algunos venían con
el dataset y otros los armamos nosotros a partir de las etiquetas originales (CAUCAFall
y URFD traen etiquetas por frame). Los de Toyota Smarthome marcan todos los videos como
"sin caída", porque los usamos para contar falsas alarmas.

## Los datos de CASAS

Partimos del archivo `labeled_data.zip` de CASAS, que trae millones de eventos de
sensores, y lo procesamos para quedarnos con las actividades de cada persona
(dormir, cocinar, comer, tomar la medicación, ver tele, ir al baño, salir de casa, etc.).
En el camino descartamos registros incompletos o con duraciones imposibles y unificamos
las 56 etiquetas originales en 19. Se lee con `pandas.read_parquet(...)`.

Columnas principales de `casas_events.parquet`:

| Columna | Qué tiene |
|---|---|
| `hogar` | La casa (cada casa es una persona) |
| `actividad` | La actividad, en nuestras 19 categorías |
| `etiqueta_original` | La etiqueta tal como venía en CASAS |
| `inicio`, `fin`, `duracion_min` | Cuándo empezó, cuándo terminó y cuánto duró |
| `hora`, `dia_semana`, `franja`, `fin_de_semana` | Datos de horario para agrupar la rutina |

La columna `actividad_gruesa` quedó de una versión anterior de las categorías; el
sistema no la usa.

## Datos propios

Los videos que grabamos en la prueba en el hogar muestran a personas reales, así que no
los publicamos (Ley 25.326 de Protección de Datos Personales).

## Fuentes y citas

**CASAS Smart Home.** Washington State University. <http://casas.wsu.edu/datasets/> ·
DOI [10.5281/zenodo.15708568](https://doi.org/10.5281/zenodo.15708568)
Cook, D. J., Crandall, A. S., Thomas, B. L., & Krishnan, N. C. (2013). CASAS: A Smart Home in a Box. *Computer*, 46(7), 62–69. https://doi.org/10.1109/MC.2012.328

**GMDCSA-24.** <https://zenodo.org/records/11216408>
Alam, E., Sufian, A., Dutta, P., Leo, M., & Hameed, I. A. (2024). GMDCSA-24: A Dataset for Human Fall Detection in Videos. *Data in Brief*, 57, 110892. https://doi.org/10.1016/j.dib.2024.110892

**CAUCAFall.**
Eraso Guerrero, J. C., Muñoz España, E., Muñoz Añasco, M., & Pinto Lopera, J. E. (2022). Dataset for Human Fall Recognition in an Uncontrolled Environment. *Data in Brief*, 45, 108610. https://doi.org/10.1016/j.dib.2022.108610

**UR Fall Detection Dataset.** Universidad de Rzeszów. <https://fenix.ur.edu.pl/~mkepski/ds/uf.html>
Kwolek, B., & Kepski, M. (2014). Human Fall Detection on Embedded Platform Using Depth Maps and Wireless Accelerometer. *Computer Methods and Programs in Biomedicine*, 117(3), 489–501. https://doi.org/10.1016/j.cmpb.2014.09.005

**Toyota Smarthome.** Inria y Toyota Motor Europe. <https://project.inria.fr/toyotasmarthome/>
Das, S., Dai, R., Koperski, M., Minciullo, L., Garattoni, L., Bremond, F., & Francesca, G. (2019). Toyota Smarthome: Real-World Activities of Daily Living. *ICCV 2019*. https://doi.org/10.1109/ICCV.2019.00092

**Multiple Cameras Fall Dataset.** Université de Montréal.
Auvinet, E., Multon, F., Saint-Arnaud, A., Rousseau, J., & Meunier, J. (2011). Fall Detection With Multiple Cameras: An Occlusion-Resistant Method Based on 3-D Silhouette Vertical Distribution. *IEEE Transactions on Information Technology in Biomedicine*, 15(2), 290–300. https://doi.org/10.1109/TITB.2010.2087385

---

Lucas Ellero y Ferrario, Proyecto Final de Ingeniería, UADE, 2026.
