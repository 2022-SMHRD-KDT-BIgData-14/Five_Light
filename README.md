## [TEAM] Five_Light (실전 Project)
![image](https://user-images.githubusercontent.com/106286554/200266576-158eecf9-38a9-4ec4-873a-bd7d9a573aa2.png)

## 1. 서비스 소개
![서비스 로고_ Five_Light _배경O](https://user-images.githubusercontent.com/106286554/200258314-a1f7084a-3781-45fe-991b-5c679073f101.png)
+ 서비스 이름 : 당근 P.T(당신 근처의 Personal Training)
+ 서비스 목표 : Media Pipe 기반 동작 분석을 활용한 기구 운동 자세 교정 서비스

## 2. 프로젝트 기간
+ 2022.09.05. (Mon.) ~ 2022.10.17. (Mon.) [43 Days]

## 3. 주요 기능
+ DNN 모델 및 Media Pipe 활용 : 신체 랜드마크 좌표 알고리즘(모델 학습)과 실시간 각도 인식 알고리즘의 비교를 통한 자세 인식 및 분석

    ![image](https://user-images.githubusercontent.com/106286554/200265971-fd48bbbf-7b6e-4eb8-8599-b367ba2fe9ca.png)![image](https://user-images.githubusercontent.com/106286554/200266237-38f672bc-ba8f-4928-9720-05e93f6a9c42.png)

+ Feedback 기능 : 사용자가 화면 안내(UP, DOWN)에 따라 운동을 5회 진행하면 실시간 분석을 통해 분석 결과를 Feedback 해주는 기능

    ![Five_Light_2](https://user-images.githubusercontent.com/106286554/200262696-62068979-7b28-4bdf-9078-9790a658094f.jpg)

+ Challenge 기능 :  운동 자세 정확도를 기반으로 순위를 정하고 이에 따른 사용자 간 경쟁심리를 자극 >> Ranking Table을 통해 확인

    ![Five_Light_3](https://user-images.githubusercontent.com/106286554/200262941-fd6ce8c0-c453-4310-8539-6d53463c6380.jpg)

+ 관리자 기능 : 회원 몸무게 관리 및 회원별 운동 선호도 파악

    ![Five_Light_5](https://user-images.githubusercontent.com/106286554/200262530-b249ccf7-238d-480e-a948-6abf2a6cd03a.jpg)

## 4. 개발 환경
<div>
    <h3>사용 언어<h3>
    <img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=Java&logoColor=white">
    <img src="https://img.shields.io/badge/python-3776AB?style=for-the-badge&logo=python&logoColor=white">
    <img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white">
    <img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white">
    <img src="https://img.shields.io/badge/java script-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black">
    <img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white">    
    <h3>개발 Tool<h3>
    <img src="https://img.shields.io/badge/spring boot-6DB33F?style=for-the-badge&logo=springboot&logoColor=white">
    <img src="https://img.shields.io/badge/boot strap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white">
    <img src="https://img.shields.io/badge/Visual Studio Code-007ACC?style=for-the-badge&logo=visualstudiocode&logoColor=white">
    <img src="https://img.shields.io/badge/jupyter-F37626?style=for-the-badge&logo=jupyter&logoColor=white">
    <img src="https://img.shields.io/badge/openCV-5C3EE8?style=for-the-badge&logo=opencv&logoColor=white">
    <h3>DB<h3>
    <img src="https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white">
    <h3>서버 환경<h3>
    <img src="https://img.shields.io/badge/apache tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white">
    <img src="https://img.shields.io/badge/flask-000000?style=for-the-badge&logo=flask&logoColor=white">
    <h3>협업 도구<h3>
    <img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white">
</div>

## 5. 시스템 아키텍처
![image](https://user-images.githubusercontent.com/106286554/200280810-ac6e7768-7421-4667-8969-8690ed670bd0.png)

## 6. 기능 흐름
+ Use Case Diagram

    ![image](https://user-images.githubusercontent.com/106286554/200279996-e454923c-c685-4472-8bdf-4558efff0fcc.png)
    
+ Service Flow

    ![image](https://user-images.githubusercontent.com/106286554/200282804-b744c910-b9cc-4146-9eed-90cc59656076.png)

+ E-R Diagram

    ![image](https://user-images.githubusercontent.com/106286554/200282692-be76a366-c9f8-41ce-aa94-37a1ef464a5b.png)

## 7. 서비스 화면
+ Index View

    ![Five_Light_7](https://user-images.githubusercontent.com/106286554/200286564-0fce908c-6b38-4fbe-9017-854ec3f6dcf6.jpg)
    
+ User Main View

    ![Five_Light](https://user-images.githubusercontent.com/106286554/200286837-25597a29-d787-4483-80b0-bb4f950f47c4.jpg)

+ Feedback Detail

    ![Five_Light_2](https://user-images.githubusercontent.com/106286554/200287504-76938318-61eb-4cd3-94b9-d0861387eb51.jpg)
    
+ Training(FeedBack 기능)

    ![Five_Light_4](https://user-images.githubusercontent.com/106286554/200287744-d547e0ae-af93-4664-ba5c-3a2f87a30592.jpg)


+ Challenge(Challenge 기능)

    ![Five_Light_8](https://user-images.githubusercontent.com/106286554/200287754-3e11345d-5884-43e4-818c-72fd21416861.jpg)

+ Manager Main View

    ![Five_Light_6](https://user-images.githubusercontent.com/106286554/200287943-d69eeb1c-2d56-480b-af7c-ce19bcee95fc.jpg)

+ Manager View(User Detail)

    ![Five_Light_5](https://user-images.githubusercontent.com/106286554/200288119-f359bf42-7ad2-4385-a275-bdd5e2830831.jpg)
    
## 8. 팀원 역할
<table>   
    <tr>
        <td align="center" height=100; width=200;><strong>오경락</strong></td>
        <td align="center" width=200;><strong>백성연</strong></td>
        <td align="center" width=200;><strong>공석준</strong></td>
        <td align="center" width=200;><strong>기아성</strong></td>
        <td align="center" width=200;><strong>최지훈</strong></td>
    </tr>    
    <tr>
        <td>
            <b>프로젝트 총괄</b><br><br>
            <b>기능 개발</b><br>
            <span>>> AJAX 구현</span><br><br>
            <b>DB 설계/구축 및 관리</b>  
        </td>
        <td>
            <b>기능 개발</b><br>
            <span>>> Web 연결</span><br>
            <span>>> Flask 서버 구현</span><br>
            <span>>> Kakao API 활용</span><br><br>
            <b>DB 설계/구축</b>
        </td>
        <td>
            <b>데이터 분석</b><br>
            <span>>> 데이터 수집</span><br>
            <span>>> 데이터 전처리</span><br><br>
            <b>OpenCV 기능</b><br><br>
            <b>DB 설계/구축</b>
        </td>
        <td>
            <b>딥러닝 모델 선정</b><br>
            <span>>> 모델 학습</span><br>
            <span>>> 모델 비교 및 검토</span><br><br>
            <b>데이터 분석</b><br>
            <span>>> 데이터 수집</span><br>
            <span>>> 데이터 전처리</span>
        </td>
        <td>
            <b>UI/UX</b><br>
            <span>>> 화면 설계</span><br>
            <span>>> 화면 디자인</span><br>
            <span>>> 화면 구현</span>
        </td>
    </tr>    
    <tr>
        <td align="center"><a href="https://github.com/CrackKR" target='_blank'>github(오경락)</a></td>
        <td align="center"><a href="https://github.com/BaekSeongYeon" target='_blank'>github(백성연)</a></td>
        <td align="center"><a href="https://github.com/junrefer" target='_blank'>github(공석준)</a></td>
        <td align="center"><a href="https://github.com/kiaseung" target='_blank'>github(기아성)</a></td>
        <td align="center"><a href="https://github.com/ChoiJH0323" target='_blank'>github(최지훈)</a></td>
    </tr>
</table>

## 9. 트러블 슈팅
+ LSTM(시계열 예측 모델)

    ![image](https://user-images.githubusercontent.com/106286554/200304278-5557d23a-20ac-4d54-b975-87fe0a7b4b4c.png)
    
+ DNN(분류형 모델)

    ![image](https://user-images.githubusercontent.com/106286554/200304417-770ca45d-bc32-40d4-8ca2-2bfc3ea21b6f.png)
    
>> 초기 모델로 LSTM을 선정하여 모델 학습을 진행하였는데 Accuracy가 0.36으로 낮게 측정되었다.<br>
   Parameter 및 Layer(층)을 수정해가며 Accuracy를 높여보려고 했으나,<br>
   예측 모델은 지금의 프로젝트를 진행하는데 있어 맞지 않음을 알 수 있었다.<br>
   때문에 예측 모델에서 분류 모델(DNN)으로 변경하여 학습을 진행했고 DNN 모델을 학습한 결과, Accuracy를 0.79까지 높일 수 있었다.
