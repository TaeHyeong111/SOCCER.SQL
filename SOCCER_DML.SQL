--012

--013
SELECT 
    P.PLAYER_NAME 선수명, 
    P.POSITION 포지션, 
    T.TEAM_NAME 팀명, 
    S.STADIUM_NAME 스타디움, 
    K.SCHE_DATE 스케줄날짜
FROM PLAYER P 
    JOIN TEAM T
        ON P.TEAM_ID = T.TEAM_ID
    JOIN STADIUM S
        ON T.STADIUM_ID = S.STADIUM_ID
    JOIN SCHEDULE K
        ON S.STADIUM_ID = K.STADIUM_ID
WHERE
    K.SCHE_DATE LIKE '20120317'
    AND T.TEAM_NAME LIKE '스틸러스'
    AND P.POSITION LIKE 'GK' 
    ORDER BY P.PLAYER_NAME
;

--014
SELECT 
    S.STADIUM_NAME AS 스타디움, 
    K.SCHE_DATE AS 경기날짜, 
    K.HOMETEAM_ID AS 홈팀, 
    K.AWAYTEAM_ID AS 원정팀, 
    K.HOME_SCORE AS "홈팀 점수", 
    K.AWAY_SCORE AS "원정팀 점수"
FROM
    SCHEDULE K
    JOIN STADIUM S
        ON K.STADIUM_ID LIKE S.STADIUM_ID
    JOIN TEAM T
        ON T.STADIUM_ID LIKE S.STADIUM_ID
WHERE 
    K.HOME_SCORE - K.AWAY_SCORE >= 3 
;


--014
SELECT
S.STADIUM_NAME 스타디움,
K.SCHE_DATE 경기날짜,
HT.REGION_NAME||' '||HT.TEAM_NAME 홈팀,
AT.REGION_NAME||' '||AT.TEAM_NAME 원정팀,
K.HOME_SCORE "홈팀 점수",
K.AWAY_SCORE "원정팀 점수"
FROM
SCHEDULE K
JOIN STADIUM S
    ON K.STADIUM_ID LIKE S.STADIUM_ID
    JOIN TEAM HT
    ON K.HOMETEAM_ID LIKE HT.TEAM_ID
    JOIN TEAM AT
    ON K.AWAYTEAM_ID LIKE AT.TEAM_ID
    WHERE 
    K.HOME_SCORE >= K.AWAY_SCORE +3
    ORDER BY K.SCHE_DATE
    ;
    SELECT STADIUM_ID FROM STADIUM
    WHERE STADIUM_ID LIKE 'D03';
    

    
    
SELECT TEAM_ID,HOMETEAM_ID 
FROM TEAM T
JOIN SCHEDULE S
ON T.TEAM_ID LIKE S.HOMETEAM_ID
ORDER BY TEAM_ID;
SELECT HOMETEAM_ID FROM SCHEDULE
ORDER BY HOMETEAM_ID;
    
 --016
 SELECT 
    T.TEAM_NAME 팀명,
    P.PLAYER_NAME 선수명,
    P.POSITION 포지션,
    P.BACK_NO 백넘버,
    P.HEIGHT 키
FROM PLAYER P
    JOIN TEAM T
        ON P.TEAM_ID LIKE T.TEAM_ID
WHERE 
    T.TEAM_ID IN ( (X) , (Y) )
;

SELECT T.TEAM_ID 
FROM TEAM T
WHERE T.TEAM_NAME LIKE '드래곤즈'
; 

SELECT 
    S.STADIUM_NAME AS 스타디움,
    K.SCHE_DATE AS 경기날짜,
    T.HOMETEAM_NAME,
    T.E_TEAM_NAME,
    K.HOME_SCORE,
    K.AWAY_SCORE
FROM STADIUM S
    JOIN SCHEDULE K
        ON S.STADIUM_ID LIKE K.STADIUM_ID
    JOIN TEAM T
        ON T.TEAM_NAME LIKE K.HOMETEAM_ID
    JOIN TEAM T1
        ON T1.E_TEAM_NAME LIKE K.AWAYTEAM_ID
WHERE K.HOME_SCORE - K.AWAY_SCORE >= 3
;
        

---018 
-- 최호진 선수의 소속팀과 포지션, 백넘버는 무엇입니까
SELECT
    P.PLAYER_NAME,
    P.BACK_NO 백넘버,
    T.TEAM_NAME 팀이름,
    P.POSITION 포지션
FROM PLAYER P, TEAM T
WHERE P.PLAYER_NAME LIKE '최호진'
AND P.TEAM_ID LIKE T.TEAM_ID
;
---019 대전시티즌의 MF 평균키는 얼마입니까



SELECT ROUND(AVG(P.HEIGHT),2)
FROM 
PLAYER P
JOIN TEAM T
ON P.TEAM_ID LIKE T.TEAM_ID
WHERE T.TEAM_NAME LIKE '시티즌'
AND POSITION LIKE 'MF'
;

--020
--2012년 월별 경기수를 구하시오
SELECT COUNT(SCHE_DATE)
FROM SCHEDULE
WHERE SCHE_DATE LIKE '201205%';

--round(AVG(weight/(height*height)*10000),2) BMI비만지수