# Best Cars Dealership – Full Stack Developer Capstone

Responsive web application for **Best Cars**, a national car retailer in the US.
Users can browse dealer branches, filter them by state, read dealer reviews
(with sentiment analysis) and submit their own reviews.

## Architecture
| Service | Tech | Port |
|---|---|---|
| Web app + REST proxy + admin | Django, React (built into Django), SQLite | 8000 |
| Dealer / review data API | Express.js + MongoDB (Mongoose) | 3030 |
| Sentiment analyzer microservice | Flask + NLTK VADER | 5050 |

Deployment: Docker, Kubernetes (`server/deployment.yaml`), IBM Cloud Code Engine.
CI: GitHub Actions lint workflow (`.github/workflows/main.yml`).

## Run locally
```bash
# 1. Mongo + Express API (port 3030)
cd server/database && docker build . -t nodeapp && docker-compose up -d

# 2. Sentiment analyzer (port 5050)
cd server/djangoapp/microservices && pip install -r requirements.txt && python app.py

# 3. React frontend + Django (port 8000)
cd server/frontend && npm install && npm run build
cd .. && pip install -r requirements.txt
python manage.py makemigrations && python manage.py migrate
python manage.py createsuperuser   # e.g. root
python manage.py runserver
```
Open http://localhost:8000 and http://localhost:8000/admin.

## Main endpoints (Django)
`/djangoapp/login`, `/logout`, `/register`, `/get_cars`, `/get_dealers`,
`/get_dealers/<state>`, `/dealer/<id>`, `/reviews/dealer/<id>`, `/add_review`
