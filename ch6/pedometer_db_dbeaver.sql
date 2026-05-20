-- pedometer.competitions definition

CREATE TABLE `competitions` (
  `competition_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '각 경쟁을 고유하게 식별',
  `competition_name` varchar(100) NOT NULL COMMENT '경쟁 이름',
  `start_time` datetime NOT NULL COMMENT '경쟁 시작 시간',
  `end_time` datetime NOT NULL COMMENT '경쟁 종료 시간',
  `type` enum('region','global','friend','other') DEFAULT NULL COMMENT '경쟁 유형',
  PRIMARY KEY (`competition_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 COMMENT='실시간 경쟁 정보';


-- pedometer.training_plans definition

CREATE TABLE `training_plans` (
  `plan_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '각 훈련 계획을 고유하게 식별',
  `plan_name` varchar(100) NOT NULL COMMENT '계획 이름',
  `description` text DEFAULT NULL COMMENT '계획 설명',
  `duration_days` int(11) DEFAULT NULL COMMENT '계획 기간(일 수)',
  `type` enum('beginner','interval','everyday','custom') DEFAULT NULL COMMENT '계획 유형',
  PRIMARY KEY (`plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 COMMENT='사전 정의된 훈련 프로그램 정보';


-- pedometer.users definition

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '각 사용자를 고유하게 식별하는 번호',
  `username` varchar(50) NOT NULL COMMENT '로그인에 사용되는 고유 이름',
  `email` varchar(100) NOT NULL COMMENT '계정 확인 및 알림에 사용되는 이메일 주소',
  `password_hash` varchar(255) NOT NULL COMMENT '비밀번호의 해시된 형태, 보안 유지',
  `name` varchar(100) DEFAULT NULL COMMENT '사용자의 전체 이름 또는 표시 이름',
  `age` int(11) DEFAULT NULL COMMENT '사용자의 나이, 피트니스 추천에 사용',
  `weight` decimal(5,2) DEFAULT NULL COMMENT '현재 체중, 칼로리 계산에 필수',
  `height` decimal(5,2) DEFAULT NULL COMMENT '키, BMI 계산 및 운동 추적에 사용',
  `gender` enum('M','F','O') DEFAULT NULL COMMENT '성별, 피트니스 조언에 영향',
  `registration_date` datetime DEFAULT current_timestamp() COMMENT '계정 생성 날짜, 분석 및 알림에 사용',
  `last_login` datetime DEFAULT NULL COMMENT '마지막 로그인 시간, 활동 추적에 사용',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 COMMENT='사용자 정보';


-- pedometer.competition_participants definition

CREATE TABLE `competition_participants` (
  `participant_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '각 참가자를 고유하게 식별',
  `competition_id` int(11) NOT NULL COMMENT 'Competitions 테이블의 competition_id를 참조',
  `user_id` int(11) NOT NULL COMMENT 'Users 테이블의 user_id를 참조',
  `join_time` datetime DEFAULT current_timestamp() COMMENT '참가 시간',
  `finish_time` datetime DEFAULT NULL COMMENT '완주 시간(선택적)',
  `distance` decimal(10,2) DEFAULT NULL COMMENT '경쟁 중 이동 거리',
  `time_taken` int(11) DEFAULT NULL COMMENT '완주에 걸린 시간(초 단위)',
  `rank` int(11) DEFAULT NULL COMMENT '사용자의 순위',
  PRIMARY KEY (`participant_id`),
  UNIQUE KEY `competition_id` (`competition_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `competition_participants_ibfk_1` FOREIGN KEY (`competition_id`) REFERENCES `competitions` (`competition_id`),
  CONSTRAINT `competition_participants_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 COMMENT='경쟁 참가자 및 결과 정보';


-- pedometer.friends definition

CREATE TABLE `friends` (
  `friendship_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '각 친구 관계를 고유하게 식별',
  `user_id1` int(11) NOT NULL COMMENT '첫 번째 사용자의 user_id',
  `user_id2` int(11) NOT NULL COMMENT '두 번째 사용자의 user_id',
  `status` enum('pending','accepted') DEFAULT NULL COMMENT '친구 요청 상태',
  `since_date` datetime DEFAULT current_timestamp() COMMENT '관계 생성 날짜',
  PRIMARY KEY (`friendship_id`),
  UNIQUE KEY `user_id1` (`user_id1`,`user_id2`),
  KEY `user_id2` (`user_id2`),
  CONSTRAINT `friends_ibfk_1` FOREIGN KEY (`user_id1`) REFERENCES `users` (`user_id`),
  CONSTRAINT `friends_ibfk_2` FOREIGN KEY (`user_id2`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 COMMENT='사용자 간 소셜 연결 정보';


-- pedometer.goals definition

CREATE TABLE `goals` (
  `goal_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '각 목표를 고유하게 식별',
  `user_id` int(11) NOT NULL COMMENT 'Users 테이블의 user_id를 참조',
  `goal_type` enum('daily_steps','weekly_distance','monthly_calories','other') DEFAULT NULL COMMENT '목표 유형',
  `target_value` decimal(10,2) DEFAULT NULL COMMENT '목표 값',
  `start_date` date DEFAULT NULL COMMENT '목표 시작 날짜',
  `end_date` date DEFAULT NULL COMMENT '목표 종료 날짜(선택적)',
  `achieved` tinyint(1) DEFAULT 0 COMMENT '목표 달성 여부',
  PRIMARY KEY (`goal_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `goals_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 COMMENT='사용자 정의 목표 정보';


-- pedometer.step_tracking definition

CREATE TABLE `step_tracking` (
  `tracking_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '각 레코드를 고유하게 식별',
  `user_id` int(11) NOT NULL COMMENT 'Users 테이블의 user_id를 참조',
  `date` date NOT NULL COMMENT '데이터가 기록된 날짜',
  `total_steps` int(11) DEFAULT NULL COMMENT '해당 날짜의 총 걸음 수',
  `active_minutes` int(11) DEFAULT NULL COMMENT '활동적인 시간(분 단위)',
  `calories_burned` decimal(6,2) DEFAULT NULL COMMENT '소모된 칼로리량',
  PRIMARY KEY (`tracking_id`),
  UNIQUE KEY `user_id` (`user_id`,`date`),
  CONSTRAINT `step_tracking_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 COMMENT='운동 및 관련 메트릭 정보';


-- pedometer.user_plans definition

CREATE TABLE `user_plans` (
  `user_plan_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '사용자-계획 조합 식별',
  `user_id` int(11) NOT NULL COMMENT 'Users 테이블의 user_id를 참조',
  `plan_id` int(11) NOT NULL COMMENT 'Training_Plans 테이블의 plan_id를 참조',
  `start_date` date NOT NULL COMMENT '계획 시작 날짜',
  `status` enum('in_progress','completed','abandoned') DEFAULT NULL COMMENT '계획 상태',
  PRIMARY KEY (`user_plan_id`),
  KEY `user_id` (`user_id`),
  KEY `plan_id` (`plan_id`),
  CONSTRAINT `user_plans_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_plans_ibfk_2` FOREIGN KEY (`plan_id`) REFERENCES `training_plans` (`plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 COMMENT='사용자 정의 훈련 계획 정보';


-- pedometer.workouts definition

CREATE TABLE `workouts` (
  `workout_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '각 운동 세션을 고유하게 식별하는 자동 증가식 키',
  `user_id` int(11) NOT NULL COMMENT 'Users 테이블의 user_id를 참조하는 외래 키',
  `start_time` datetime NOT NULL COMMENT '운동 시작 시간',
  `end_time` datetime DEFAULT NULL COMMENT '운동 종료 시간',
  `type` enum('running','walking','hiking','stair_climbing','other') DEFAULT NULL COMMENT '활동 유형, 사용자가 수행한 활동을 구분',
  `distance` decimal(10,2) DEFAULT NULL COMMENT '운동 거리, 소수점 두 자리까지 표현',
  `duration` int(11) DEFAULT NULL COMMENT '운동 지속 시간(초 단위)',
  `average_speed` decimal(5,2) DEFAULT NULL COMMENT '평균 속도, 소수점 두 자리까지 표현',
  `calories_burned` decimal(6,2) DEFAULT NULL COMMENT '소모된 칼로리량, 소수점 두 자리까지 표현',
  `plan_id` int(11) DEFAULT NULL COMMENT '관련 훈련 계획 ID, Training_Plans 테이블 참조',
  `plan_day` int(11) DEFAULT NULL COMMENT '훈련 계획의 해당 일자',
  PRIMARY KEY (`workout_id`),
  KEY `user_id` (`user_id`),
  KEY `plan_id` (`plan_id`),
  CONSTRAINT `workouts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `workouts_ibfk_2` FOREIGN KEY (`plan_id`) REFERENCES `training_plans` (`plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 COMMENT='운동 실적';