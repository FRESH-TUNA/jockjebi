# 2019 Openhack 28조

> 대학생들을 위한 족보 공유 플랫폼 "`족제비`"

![gif](frontend/src/assets/2.gif)

## Dependency & Configuration

- Backend | Django
  - `$ pip install djangorestframework-jwt djangocors-headers pillow`
  - Postgresql setting
    - `$ brew install postgresql`
    - `$ sudo -u postgres psql`
    - `postgres-# create database openhack;`
    - `postgres-# create user openhackuser with password 'openhackuser';`
    - `postgres-# alter role openhackuser set client_encoding to 'utf-8';`
    - `postgres-# alter role openhackuser set timezone to 'Asia/Seoul';`
    - `postgres-# grant all privileges on database openhack to openhackuser;`
  - `$ python3 manage.py migrate`
  - `$ python3 manage.py runserver`
- Frontend | Vue.js
  - `$ cd frontend && npm install`
  - `$ npm run dev`
- Deploy
  - `$ pip install dj-database-url gunicorn whitenoise`
  - `$ pip freeze > requirements.txt`
  - requirements.txt마지막줄에 psycopg2==2.8.3 추가

## Jockjebi's function

- 회원가입 및 로그인 
  - 회원가입시 학교 입력
- 족보 업로드 
- 족보 검색 
  - 족보 상세페이지
    - 댓글입력
    - [ ] 별점 (미구현)
  - [ ] 검색필터 (미구현)
  - [ ] 족보 북마크 페이지

## Teammate

- 팀장 : 이용재 (충남대학교)
- 팀원
  - 김동원 (강원대학교)
  - 이주영 (숙명여자대학교)
  - 이지원 (아주대학교)
  - 도경회 (성균관대학교)

## 멘토님들에게 도움 받은 것

- OKKY 허광남 멘토님 : 웹개발 지식, git 문제 해결
- Zepl 진유림 멘토님 : Axios 디버깅
- PUBG 남세현 멘토님 : 클레이튼과 Django 연동 외 
- GROUND X 성기준 멘토님 : 클레이튼 디버깅
- 당근마켓 정창훈 멘토님 : npm 디버깅
- 국민대학교 이민석교수님 : 족보공유 플랫폼 아이템 첨삭

## Opensource를 사용한 것

- [vuebase](https://github.com/nasirouwagana/vuebase) : Vuetify UI 구성 참고 | fully opensource
  - openhack 기간 내에 아래와 issue로 질문 후 답변받음 - [[링크참조](https://github.com/nasirouwagana/vuebase)]
- Backend
  - Django : backend 서버 구성 | BSD Lisence
  - django-rest-api : REST API 서버 | BSD Lisence
  - pillow : 사진 가져오기위해 사용 | MIT-like
  - djangorestframework-jwt : 로그인 인증을 위해 | MIT Lisence
  - PostgreSQL : RDB 사용 | PostgreSQL Lisence
- Frontend
  - Vue.js : frontend 구성 | MIT Lisence
  - axios : REST API 통신 | MIT  Lisence
  - vuetify : 컴포넌트 레이아웃 구성 | MIT Lisence
  - vue-router : Vue 페이지 라우팅 | MIT LIsence
  - vue-slider-componenet : slider 추가 | MIT Lisence
  - vue-star-rating : star rating 기능 추가 | MIT Lisence
