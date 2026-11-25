#!/bin/bash
# Descarga los videos cam0 del UR Fall Detection Dataset (fenix.ur.edu.pl).
# Solo la columna "Video" (RGB cam0) - no depth/sync/acelerometro, no hacen falta.
set -e
BASE="https://fenix.ur.edu.pl/~mkepski/ds/data"
OUT="${1:-$(dirname "$0")}"
mkdir -p "$OUT"

for i in $(seq -w 1 30); do
  url="$BASE/fall-$i-cam0.mp4"
  out="$OUT/fall-$i-cam0.mp4"
  [ -f "$out" ] && continue
  echo "Descargando fall-$i..."
  curl -sL "$url" -o "$out"
done

for i in $(seq -w 1 40); do
  url="$BASE/adl-$i-cam0.mp4"
  out="$OUT/adl-$i-cam0.mp4"
  [ -f "$out" ] && continue
  echo "Descargando adl-$i..."
  curl -sL "$url" -o "$out"
done

echo "Listo: $(ls "$OUT"/*.mp4 | wc -l) videos en $OUT"
