# Reporte de calidad — dataset de eventos CASAS

_Generado por `build_table.py` · 2026-09-01 20:01_

## Resumen

- **319,229 eventos** · **80 residentes**
- Rango de fechas: 2011-06-15 → 2023-04-06
- Tiempo total etiquetado: 63,370 h (2,640 días-persona)
- Solapamientos entre eventos: 367 (0.1%)
- Eventos en días de cambio de hora (DST, informativo): 21,431

## Distribución por actividad canónica

| actividad     |   eventos |    % |   dur_mediana_min |   dur_p95_min |   horas_totales |
|:--------------|----------:|-----:|------------------:|--------------:|----------------:|
| aseo          |     55511 | 17.4 |               1.7 |          17.2 |            4123 |
| cocinar       |     40455 | 12.7 |               0.9 |          12.4 |            1971 |
| trabajo       |     32635 | 10.2 |               2.5 |          34.8 |            4285 |
| ver_tv        |     31955 | 10   |               5.9 |          65.6 |            8456 |
| bano          |     30146 |  9.4 |               1.5 |           7.2 |            1144 |
| dormir        |     24936 |  7.8 |              22.8 |         311.3 |           30894 |
| lavar_platos  |     19420 |  6.1 |               1.2 |          13.3 |            1007 |
| salir_casa    |     14375 |  4.5 |               0.4 |           5.5 |            2058 |
| beber         |     13161 |  4.1 |               1.2 |           6.8 |             448 |
| comer         |     12620 |  4   |               4.9 |          30.6 |            1874 |
| descansar     |     11160 |  3.5 |               5.7 |          53   |            2498 |
| entrar_casa   |     10212 |  3.2 |               0.2 |           1.3 |              81 |
| bano_nocturno |      6040 |  1.9 |               1.8 |          10.7 |             313 |
| medicacion    |      4467 |  1.4 |               1   |           4.6 |             115 |
| telefono      |      3747 |  1.2 |               3.5 |          18.8 |             376 |
| leer          |      3377 |  1.1 |              14   |          64.1 |            1122 |
| visitas       |      2349 |  0.7 |              22.2 |         185.4 |            2128 |
| otro          |      1594 |  0.5 |               5.1 |          52.9 |             350 |
| tareas_hogar  |      1069 |  0.3 |               0.5 |          57.2 |             125 |

## Duraciones sospechosas (posible ruido de anotación)

- Eventos < 5 s: 10,468 (3.3%)
- Eventos por encima del p99 de su actividad: 3,202
- Máximos por actividad (min): {'salir_casa': 1183.0, 'visitas': 1104.0, 'aseo': 1021.0, 'trabajo': 975.0, 'dormir': 885.0, 'otro': 463.0}

## Cobertura por residente

| hogar   |   eventos |   dias_span |   dias_con_datos |   cobertura_calendario_% |   actividades_distintas |   eventos_por_dia |
|:--------|----------:|------------:|-----------------:|-------------------------:|------------------------:|------------------:|
| hh113   |     23330 |         510 |              493 |                     96.7 |                      17 |              47.3 |
| hh115   |     18992 |         320 |              302 |                     94.4 |                      18 |              62.9 |
| ihs09   |     17210 |          66 |               64 |                     97   |                      14 |             268.9 |
| tm004   |     13669 |          62 |               62 |                    100   |                      16 |             220.5 |
| ihs08   |     12829 |          62 |               56 |                     90.3 |                      14 |             229.1 |
| tm002   |     10695 |         161 |              150 |                     93.2 |                      16 |              71.3 |
| hh117   |      9718 |         346 |              236 |                     68.2 |                      16 |              41.2 |
| ihs06   |      9678 |          62 |               62 |                    100   |                      13 |             156.1 |
| mn83    |      8633 |          65 |               65 |                    100   |                      16 |             132.8 |
| tm038   |      8626 |          32 |               32 |                    100   |                      13 |             269.6 |
| tm013   |      6212 |          61 |               61 |                    100   |                      10 |             101.8 |
| mva002  |      5634 |          62 |               62 |                    100   |                      12 |              90.9 |
| hh109   |      5086 |          61 |               61 |                    100   |                      17 |              83.4 |
| hh112   |      4934 |         108 |              100 |                     92.6 |                      17 |              49.3 |
| ihs07   |      4829 |          71 |               60 |                     84.5 |                      14 |              80.5 |
| rw104   |      4816 |          24 |               22 |                     91.7 |                      16 |             218.9 |
| ihs11   |      4802 |          53 |               44 |                     83   |                      14 |             109.1 |
| mva003  |      4700 |          61 |               55 |                     90.2 |                      11 |              85.5 |
| tm022   |      4605 |          32 |               32 |                    100   |                      15 |             143.9 |
| tm011   |      4335 |          61 |               61 |                    100   |                      17 |              71.1 |
| mn61    |      4322 |          32 |               32 |                    100   |                      15 |             135.1 |
| hh108   |      3976 |          61 |               58 |                     95.1 |                      17 |              68.6 |
| tm014   |      3957 |          62 |               62 |                    100   |                      15 |              63.8 |
| hh128   |      3908 |          61 |               61 |                    100   |                      17 |              64.1 |
| rw110   |      3874 |          31 |               31 |                    100   |                      17 |             125   |
| mva001  |      3514 |          31 |               31 |                    100   |                      13 |             113.4 |
| tm026   |      3436 |          32 |               32 |                    100   |                      14 |             107.4 |
| hh102   |      3414 |          62 |               58 |                     93.5 |                      17 |              58.9 |
| hh104   |      3351 |          61 |               61 |                    100   |                      14 |              54.9 |
| hh125   |      3233 |          61 |               59 |                     96.7 |                      17 |              54.8 |
| mn77    |      3176 |          32 |               32 |                    100   |                      14 |              99.2 |
| mva004  |      3147 |          61 |               61 |                    100   |                      11 |              51.6 |
| tm009   |      3115 |          61 |               59 |                     96.7 |                      10 |              52.8 |
| hh120   |      2929 |          64 |               64 |                    100   |                      17 |              45.8 |
| hh106   |      2898 |          62 |               55 |                     88.7 |                      16 |              52.7 |
| tm029   |      2865 |          32 |               32 |                    100   |                      16 |              89.5 |
| tm021   |      2841 |          32 |               32 |                    100   |                      15 |              88.8 |
| tm035   |      2715 |          31 |               31 |                    100   |                      14 |              87.6 |
| tm005   |      2702 |          31 |               31 |                    100   |                      16 |              87.2 |
| tm017   |      2647 |          32 |               32 |                    100   |                      16 |              82.7 |
| hh101   |      2645 |          60 |               60 |                    100   |                      17 |              44.1 |
| hh103   |      2567 |          58 |               58 |                    100   |                      16 |              44.3 |
| tm006   |      2559 |          30 |               30 |                    100   |                      17 |              85.3 |
| rw103   |      2389 |          30 |               28 |                     93.3 |                      15 |              85.3 |
| hh111   |      2344 |          61 |               58 |                     95.1 |                      17 |              40.4 |
| tm016   |      2333 |          32 |               32 |                    100   |                      15 |              72.9 |
| mn71    |      2321 |          30 |               30 |                    100   |                      14 |              77.4 |
| tm010   |      2284 |          61 |               61 |                    100   |                      14 |              37.4 |
| tm001   |      2251 |          61 |               59 |                     96.7 |                      16 |              38.2 |
| tm003   |      2187 |          71 |               71 |                    100   |                      14 |              30.8 |
| hh121   |      2176 |          10 |               10 |                    100   |                      16 |             217.6 |
| hh116   |      2123 |          62 |               61 |                     98.4 |                      17 |              34.8 |
| tm020   |      2118 |          29 |               29 |                    100   |                      15 |              73   |
| tm008   |      2001 |          30 |               30 |                    100   |                      16 |              66.7 |
| mn50    |      1982 |          16 |               16 |                    100   |                      13 |             123.9 |
| hh129   |      1929 |          31 |               30 |                     96.8 |                      17 |              64.3 |
| hh105   |      1860 |          61 |               39 |                     63.9 |                      15 |              47.7 |
| hh126   |      1852 |          37 |               37 |                    100   |                      17 |              50.1 |
| rw106   |      1816 |          26 |               26 |                    100   |                      15 |              69.8 |
| hh119   |      1725 |          31 |               31 |                    100   |                      17 |              55.6 |
| hh114   |      1692 |          31 |               31 |                    100   |                      17 |              54.6 |
| hh130   |      1607 |          30 |               30 |                    100   |                      16 |              53.6 |
| hh118   |      1604 |          31 |               31 |                    100   |                      15 |              51.7 |
| hh122   |      1590 |          30 |               28 |                     93.3 |                      17 |              56.8 |
| mn57    |      1567 |          27 |               27 |                    100   |                      12 |              58   |
| tm018   |      1545 |          32 |               32 |                    100   |                      14 |              48.3 |
| rw101   |      1528 |          30 |               30 |                    100   |                      16 |              50.9 |
| mn51    |      1431 |          31 |               30 |                     96.8 |                      14 |              47.7 |
| rw105   |      1426 |          27 |               24 |                     88.9 |                      17 |              59.4 |
| tm037   |      1402 |          32 |               31 |                     96.9 |                      14 |              45.2 |
| hh123   |      1390 |          31 |               31 |                    100   |                      17 |              44.8 |
| tm015   |      1384 |          31 |               31 |                    100   |                      12 |              44.6 |
| hh127   |      1378 |          27 |               27 |                    100   |                      14 |              51   |
| rw107   |      1315 |          31 |               31 |                    100   |                      16 |              42.4 |
| tm019   |      1314 |          31 |               31 |                    100   |                      15 |              42.4 |
| hh110   |      1277 |          31 |               27 |                     87.1 |                      17 |              47.3 |
| tm007   |      1257 |          30 |               28 |                     93.3 |                      16 |              44.9 |
| mn82    |       944 |          15 |               15 |                    100   |                      14 |              62.9 |
| hh107   |       590 |          31 |               30 |                     96.8 |                      13 |              19.7 |
| hh124   |       173 |          60 |               27 |                     45   |                      15 |               6.4 |

## Timeline resampleado (10 min)

- Bins totales: 667,729
- Bins sin actividad etiquetada (`sin_dato`): 34.1%
- Distribución de bins por actividad gruesa:

| actividad_gruesa   |   proportion |
|:-------------------|-------------:|
| sin_dato           |         34.1 |
| dormir             |         28.9 |
| ocio_sentado       |         15.5 |
| aseo               |          7   |
| cocina             |          3.8 |
| comida             |          2.8 |
| descanso_sofa      |          2.7 |
| fuera_casa         |          2.3 |
| social             |          2.1 |
| otro               |          0.4 |
| bano_nocturno      |          0.4 |
| tareas_hogar       |          0.1 |

## Notas de método

- **Timestamps naive en hora local de pared**: es lo correcto para clustering de rutina (importa *a qué hora del día* la persona hace algo, no el instante UTC). Los días de cambio de hora (2 por año) quedan marcados en `dia_dst` a título informativo; no se corrigen.
- **Solapamientos**: CASAS permite tramos de actividad anidados/solapados (p. ej. `Relax` conteniendo `Watch_TV`). En la tabla *silver* se conservan como eventos separados (marcados en `solapa`). El *timeline gold* los resuelve por cobertura: la actividad con más segundos dentro del bin gana.
- **`sin_dato`**: los bins sin ninguna actividad etiquetada son tiempo real no anotado por CASAS (transiciones, ruido), no un error del ETL.
