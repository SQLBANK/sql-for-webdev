SELECT
  CASE
    WHEN  org.`주차장관리번호` IS  NULL THEN  'tmp_t8에만 존재'
    WHEN  t8.`주차장관리번호` IS  NULL THEN  'tmp_t8_org에만 존재'
    ELSE  '공통으로 존재'
  END AS  데이터존재여부,
  COALESCE(org.`주차장관리번호`, t8.`주차장관리번호`) AS  주차장관리번호,
  CASE
    WHEN  org.`주차장명` <> t8.`주차장명`  THEN CONCAT('주차장명: ', org.`주차장명`, ' -> ', t8.`주차장명`)
    ELSE  NULL
  END AS  주차장명_변경,
  CASE
    WHEN  org.`주차장구분` <> t8.`주차장구분`  THEN CONCAT('주차장구분: ', org.`주차장구분`, ' -> ', t8.`주차장구분`)
    ELSE  NULL
  END AS  주차장구분_변경,
  CASE
    WHEN  org.`주차장유형` <> t8.`주차장유형`  THEN CONCAT('주차장유형: ', org.`주차장유형`, ' -> ', t8.`주차장유형`)
    ELSE  NULL
  END AS  주차장유형_변경,
  CASE
    WHEN  org.`소재지도로명주소` <> t8.`소재지도로명주소`  THEN CONCAT('소재지도로명주소: ', org.`소재지도로명주소`, ' -> ', t8.`소재지도로명주소`)
    ELSE  NULL
  END AS  소재지도로명주소_변경,
  CASE
    WHEN  org.`소재지지번주소` <> t8.`소재지지번주소`  THEN CONCAT('소재지지번주소: ', org.`소재지지번주소`, ' -> ', t8.`소재지지번주소`)
    ELSE  NULL
  END AS  소재지지번주소_변경,
  CASE
    WHEN  org.`주차구획수` <> t8.`주차구획수`  THEN CONCAT('주차구획수: ', org.`주차구획수`, ' -> ', t8.`주차구획수`)
    ELSE  NULL
  END AS  주차구획수_변경,
  CASE
    WHEN  org.`급지구분` <> t8.`급지구분`  THEN CONCAT('급지구분: ', org.`급지구분`, ' -> ', t8.`급지구분`)
    ELSE  NULL
  END AS  급지구분_변경,
  CASE
    WHEN  org.`부제시행구분` <> t8.`부제시행구분`  THEN CONCAT('부제시행구분: ', org.`부제시행구분`, ' -> ', t8.`부제시행구분`)
    ELSE  NULL
  END AS  부제시행구분_변경,
  CASE
    WHEN  org.`운영요일` <> t8.`운영요일`  THEN CONCAT('운영요일: ', org.`운영요일`, ' -> ', t8.`운영요일`)
    ELSE  NULL
  END AS  운영요일_변경,
  CASE
    WHEN  org.`평일운영시작시각` <> t8.`평일운영시작시각`  THEN CONCAT('평일운영시작시각: ', org.`평일운영시작시각`, ' -> ', t8.`평일운영시작시각`)
    ELSE  NULL
  END AS  평일운영시작시각_변경,
  CASE
    WHEN  org.`평일운영종료시각` <> t8.`평일운영종료시각`  THEN CONCAT('평일운영종료시각: ', org.`평일운영종료시각`, ' -> ', t8.`평일운영종료시각`)
    ELSE  NULL
  END AS  평일운영종료시각_변경,
  CASE
    WHEN  org.`토요일운영시작시각` <> t8.`토요일운영시작시각`  THEN CONCAT('토요일운영시작시각: ', org.`토요일운영시작시각`, ' -> ', t8.`토요일운영시작시각`)
    ELSE  NULL
  END AS  토요일운영시작시각_변경,
  CASE
    WHEN  org.`토요일운영종료시각` <> t8.`토요일운영종료시각`  THEN CONCAT('토요일운영종료시각: ', org.`토요일운영종료시각`, ' -> ', t8.`토요일운영종료시각`)
    ELSE  NULL
  END AS  토요일운영종료시각_변경,
  CASE
    WHEN  org.`공휴일운영시작시각` <> t8.`공휴일운영시작시각`  THEN CONCAT('공휴일운영시작시각: ', org.`공휴일운영시작시각`, ' -> ', t8.`공휴일운영시작시각`)
    ELSE  NULL
  END AS  공휴일운영시작시각_변경,
  CASE
    WHEN  org.`공휴일운영종료시각` <> t8.`공휴일운영종료시각`  THEN CONCAT('공휴일운영종료시각: ', org.`공휴일운영종료시각`, ' -> ', t8.`공휴일운영종료시각`)
    ELSE  NULL
  END AS  공휴일운영종료시각_변경,
  CASE
    WHEN  org.`요금정보` <> t8.`요금정보`  THEN CONCAT('요금정보: ', org.`요금정보`, ' -> ', t8.`요금정보`)
    ELSE  NULL
  END AS  요금정보_변경,
  CASE
    WHEN  org.`주차기본시간` <> t8.`주차기본시간`  THEN CONCAT('주차기본시간: ', org.`주차기본시간`, ' -> ', t8.`주차기본시간`)
    ELSE  NULL
  END AS  주차기본시간_변경,
  CASE
    WHEN  org.`주차기본요금` <> t8.`주차기본요금`  THEN CONCAT('주차기본요금: ', org.`주차기본요금`, ' -> ', t8.`주차기본요금`)
    ELSE  NULL
  END AS  주차기본요금_변경,
  CASE
    WHEN  org.`추가단위시간` <> t8.`추가단위시간`  THEN CONCAT('추가단위시간: ', org.`추가단위시간`, ' -> ', t8.`추가단위시간`)
    ELSE  NULL
  END AS  추가단위시간_변경,
  CASE
    WHEN  org.`추가단위요금` <> t8.`추가단위요금`  THEN CONCAT('추가단위요금: ', org.`추가단위요금`, ' -> ', t8.`추가단위요금`)
    ELSE  NULL
  END AS  추가단위요금_변경,
  CASE
    WHEN  org.`1일주차권요금적용시간` <> t8.`1일주차권요금적용시간`  THEN CONCAT('1일주차권요금적용시간: ', org.`1일주차권요금적용시간`, ' -> ', t8.`1일주차권요금적용시간`)
    ELSE  NULL
  END AS  `1일주차권요금적용시간_변경`,
  CASE
    WHEN  org.`1일주차권요금` <> t8.`1일주차권요금`  THEN CONCAT('1일주차권요금: ', org.`1일주차권요금`, ' -> ', t8.`1일주차권요금`)
    ELSE  NULL
  END AS  `1일주차권요금_변경`,
  CASE
    WHEN  org.`월정기권요금` <> t8.`월정기권요금`  THEN CONCAT('월정기권요금: ', org.`월정기권요금`, ' -> ', t8.`월정기권요금`)
    ELSE  NULL
  END AS  월정기권요금_변경,
  CASE
    WHEN  org.`결제방법` <> t8.`결제방법`  THEN CONCAT('결제방법: ', org.`결제방법`, ' -> ', t8.`결제방법`)
    ELSE  NULL
  END AS  결제방법_변경,
  CASE
    WHEN  org.`특기사항` <> t8.`특기사항`  THEN CONCAT('특기사항: ', org.`특기사항`, ' -> ', t8.`특기사항`)
    ELSE  NULL
  END AS  특기사항_변경,
  CASE
    WHEN  org.`관리기관명` <> t8.`관리기관명`  THEN CONCAT('관리기관명: ', org.`관리기관명`, ' -> ', t8.`관리기관명`)
    ELSE  NULL
  END AS  관리기관명_변경,
  CASE
    WHEN  org.`전화번호` <> t8.`전화번호`  THEN CONCAT('전화번호: ', org.`전화번호`, ' -> ', t8.`전화번호`)
    ELSE  NULL
  END AS  전화번호_변경,
  CASE
    WHEN  org.`위도` <> t8.`위도`  THEN CONCAT('위도: ', org.`위도`, ' -> ', t8.`위도`)
    ELSE  NULL
  END AS  위도_변경,
  CASE
    WHEN  org.`경도` <> t8.`경도`  THEN CONCAT('경도: ', org.`경도`, ' -> ', t8.`경도`)
    ELSE  NULL
  END AS  경도_변경,
  CASE
    WHEN  org.`장애인전용주차구역보유여부` <> t8.`장애인전용주차구역보유여부`  THEN CONCAT('장애인전용주차구역보유여부: ', org.`장애인전용주차구역보유여부`, ' -> ', t8.`장애인전용주차구역보유여부`)
    ELSE  NULL
  END AS  장애인전용주차구역보유여부_변경,
  CASE
    WHEN  org.`데이터기준일자` <> t8.`데이터기준일자`  THEN CONCAT('데이터기준일자: ', org.`데이터기준일자`, ' -> ', t8.`데이터기준일자`)
    ELSE  NULL
  END AS  데이터기준일자_변경
FROM `tmp_t8_org`  org
INNER JOIN `tmp_t8`  t8 
  ON org.`주차장관리번호`  = t8.`주차장관리번호` 
  AND  org.`주차장명` = t8.`주차장명`  
  AND  org.`소재지도로명주소` = t8.`소재지도로명주소`  
  AND  org.`소재지지번주소` = t8.`소재지지번주소`
WHERE org.`주차장구분`  <> t8.`주차장구분`
OR org.`주차장유형`  <> t8.`주차장유형`
OR org.`급지구분`  <> t8.`급지구분`
OR org.`요금정보`  <> t8.`요금정보`
OR org.`운영요일`  <> t8.`운영요일`
OR org.`평일운영시작시각`  <> t8.`평일운영시작시각`
OR org.`평일운영종료시각`  <> t8.`평일운영종료시각`
OR org.`토요일운영시작시각`  <> t8.`토요일운영시작시각`
OR org.`토요일운영종료시각`  <> t8.`토요일운영종료시각`
OR org.`공휴일운영시작시각`  <> t8.`공휴일운영시작시각`
OR org.`공휴일운영종료시각`  <> t8.`공휴일운영종료시각`
OR org.`주차기본시간`  <> t8.`주차기본시간`
OR org.`주차기본요금`  <> t8.`주차기본요금`
OR org.`추가단위시간`  <> t8.`추가단위시간`
OR org.`추가단위요금`  <> t8.`추가단위요금`
OR org.`1일주차권요금적용시간`  <> t8.`1일주차권요금적용시간`
OR org.`1일주차권요금`  <> t8.`1일주차권요금`
OR org.`월정기권요금`  <> t8.`월정기권요금`
OR org.`결제방법`  <> t8.`결제방법`
OR org.`특기사항`  <> t8.`특기사항`
OR org.`관리기관명`  <> t8.`관리기관명`
OR org.`전화번호`  <> t8.`전화번호`
OR org.`위도`  <> t8.`위도`
OR org.`경도`  <> t8.`경도`
OR org.`장애인전용주차구역보유여부`  <> t8.`장애인전용주차구역보유여부`
OR org.`데이터기준일자`  <> t8.`데이터기준일자`
;