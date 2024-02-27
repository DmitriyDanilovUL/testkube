#uvicorn main:app --port=8000 --reload
#gunicorn -w 1 --bind 0.0.0.0:8000 main:app

gunicorn main:app \
  --workers=1 \
  --bind="0.0.0.0:8000" \
  --timeout=180 \
