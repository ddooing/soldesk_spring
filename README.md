# db 쿼리문


CREATE SEQUENCE user_id_seq START WITH 1 INCREMENT BY 1 MINVALUE 0;    -- user_table 테이블 시퀀스
CREATE TABLE user_table (
    user_id NUMBER primary key,  
    id varchar2(255),
    name varchar2(255),
    password varchar2(255),           
    nickname varchar2(255),
    birth date,
    gender varchar2(255),       --성별
    email varchar2(255),
    point number default 0,               -- 사용자 실제 보유 포인트
    telephone varchar2(255),
    exp number default 0,
    create_date date,
    modify_date date,
    state NUMBER(1)     -- 상태값 1:일반 2:탈퇴 3:관리자 
);

INSERT INTO user_table (user_id, id, name, password, nickname, birth, gender, email, point, telephone, exp, create_date, modify_date, state)
VALUES (user_id_seq.nextval, 'qwer', '일반인', 'qwer', '일반인11', DATE '1999-06-02', '남성', 'example@example.com', 5000, '010-1234-5678', 0, SYSDATE, null, 1);

INSERT INTO user_table (user_id, id, name, password, nickname, birth, gender, email, point, telephone, exp, create_date, modify_date, state)
VALUES (user_id_seq.nextval, 'asdf', '관리자', 'asdf', '관리자11', DATE '1999-06-02', '남성', 'example@example.com', 9000, '010-1234-5678', 900, SYSDATE, null, 3);

--북마크 테이블
CREATE SEQUENCE bookmark_id_seq START WITH 1 INCREMENT BY 1 MINVALUE 0;
CREATE TABLE bookmark(
    bookmark_id NUMBER primary key,
    user_id NUMBER,                         -- user_table pk 외래키
    exhibition_id NUMBER,                  -- exhibition pk 외래키
    FOREIGN KEY (user_id) REFERENCES user_table(user_id),
    FOREIGN KEY (exhibition_id) REFERENCES exhibition(exhibition_id)
);

CREATE SEQUENCE FILE_id_seq START WITH 1 INCREMENT BY 1 MINVALUE 0;    -- FILE 테이블 시퀀스
CREATE TABLE file_table (
    file_id NUMBER primary key,
    name varchar2(255),                     -- name+type느낌 soldesk.png 까지 저장
    path varchar2(255),
    file_date date
);

insert into file_table (file_id, name, path, file_date) values (FILE_id_seq.nextval, 'poster1.png', '../img/main_poster/', sysdate); 
insert into file_table (file_id, name, path, file_date) values (FILE_id_seq.nextval, 'exhibition_detail_img.jpg', '../img/detail_poster/', sysdate);

insert into file_table (file_id, name, path, file_date) values (FILE_id_seq.nextval, 'poster2.png', '../img/main_poster/', sysdate); 
insert into file_table (file_id, name, path, file_date) values (FILE_id_seq.nextval, 'exhibition_detail_img.jpg', '../img/detail_poster/', sysdate);

insert into file_table (file_id, name, path, file_date) values (FILE_id_seq.nextval, 'poster3.png','../img/main_poster/', sysdate); 
insert into file_table (file_id, name, path, file_date) values (FILE_id_seq.nextval, 'exhibition_detail_img.jpg', '../img/detail_poster/', sysdate);

insert into file_table (file_id, name, path, file_date) values (FILE_id_seq.nextval, 'poster4.png', '../img/main_poster/', sysdate); 
insert into file_table (file_id, name, path, file_date) values (FILE_id_seq.nextval, 'exhibition_detail_img.jpg', '../img/detail_poster/', sysdate);

CREATE SEQUENCE exhibition_id_seq START WITH 1 INCREMENT BY 1 MINVALUE 0;    -- 전시회 테이블 시퀀스
CREATE TABLE exhibition (
    exhibition_id NUMBER primary key,
    title varchar2(255),
    regdate date,              -- 등록일
    author varchar2(255),
    price NUMBER,               -- 가격
    exhibition_start date,          -- 전시 시작일
    exhibition_end date,            -- 전시 종료일
    open varchar2(255),     
    holiday varchar2(255),      -- 쉬는날
    ticket_cnt NUMBER default 0,   -- 인기 카테고리 사용시 필요
    address varchar2(255),
    place varchar2(255),
    site varchar2(1000),        -- 사이트
    views NUMBER default 0,               -- 조회수
    latitude NUMBER,                   -- 위도 x
    longitude NUMBER,                   -- 경도 y
    state NUMBER(1),             -- 상태값 전시예정 : 2 현재 전시중 : 1 지난 전시 : 0     ????????????????????????
    main_poster_file_id number,
    detail_poster_file_id number,
    FOREIGN KEY (main_poster_file_id) REFERENCES file_table(file_id),
    FOREIGN KEY (detail_poster_file_id) REFERENCES file_table(file_id)
);

INSERT INTO exhibition (exhibition_id, title, regdate, author, price, exhibition_start, exhibition_end, open, holiday, ticket_cnt, address, place, site, views, latitude, longitude, state, main_poster_file_id, detail_poster_file_id)
VALUES (exhibition_id_seq.NEXTVAL, '파리에서 온 그림자', SYSDATE, '클로드 모네', 15000, TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-03-31', 'YYYY-MM-DD'), '09:00 - 18:00', '없음', 30, '서울시 강남구', '강남 갤러리', 'http://museumA.com', 90, 37.5172, 127.0473, 1, 1, 2);

INSERT INTO exhibition (exhibition_id, title, regdate, author, price, exhibition_start, exhibition_end, open, holiday, ticket_cnt, address, place, site, views, latitude, longitude, state, main_poster_file_id, detail_poster_file_id)
VALUES (exhibition_id_seq.NEXTVAL, '꽃의 속삭임', SYSDATE, '이하늘', 5000, TO_DATE('2024-01-12', 'YYYY-MM-DD'), TO_DATE('2024-02-28', 'YYYY-MM-DD'), '10:00 - 18:00', '월요일', 50, '서울시 종로구', '갤러리 A', 'http://galleryA.com', 50, 37.5726, 126.9768, 1, 3, 4);

INSERT INTO exhibition (exhibition_id, title, regdate, author, price, exhibition_start, exhibition_end, open, holiday, ticket_cnt, address, place, site, views, latitude, longitude, state, main_poster_file_id, detail_poster_file_id)
VALUES (exhibition_id_seq.NEXTVAL, '도시의 빛과 그림자', SYSDATE, '박서준', 8000, TO_DATE('2024-03-01', 'YYYY-MM-DD'), TO_DATE('2024-03-31', 'YYYY-MM-DD'), '11:00 - 19:00', '화요일', 40, '서울시 서초구', '갤러리 B', 'http://galleryB.com', 20, 37.4834, 127.0321, 1, 5, 6);

INSERT INTO exhibition (exhibition_id, title, regdate, author, price, exhibition_start, exhibition_end, open, holiday, ticket_cnt, address, place, site, views, latitude, longitude, state, main_poster_file_id, detail_poster_file_id)
VALUES (exhibition_id_seq.NEXTVAL, '추상의 꿈', SYSDATE, '김유정', 10000, TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-04-30', 'YYYY-MM-DD'), '09:30 - 17:30', '수요일', 60, '서울시 마포구', '갤러리 C', 'http://galleryC.com', 70, 37.5536, 126.9214, 1, 7, 8);

INSERT INTO exhibition (exhibition_id, title, regdate, author, price, exhibition_start, exhibition_end, open, holiday, ticket_cnt, address, place, site, views, latitude, longitude, state, main_poster_file_id, detail_poster_file_id)
VALUES (exhibition_id_seq.NEXTVAL, '시간의 회전목마', SYSDATE, '조민수', 12000, TO_DATE('2024-01-02', 'YYYY-MM-DD'), TO_DATE('2024-05-31', 'YYYY-MM-DD'), '10:00 - 18:00', '목요일', 70, '서울시 강동구', '갤러리 D', 'http://galleryD.com', 30, 37.5505, 127.1446, 1, 1, 2);

INSERT INTO exhibition (exhibition_id, title, regdate, author, price, exhibition_start, exhibition_end, open, holiday, ticket_cnt, address, place, site, views, latitude, longitude, state, main_poster_file_id, detail_poster_file_id)
VALUES (exhibition_id_seq.NEXTVAL, '자연 속으로의 여행', SYSDATE, '윤미래', 15000, TO_DATE('2024-01-05', 'YYYY-MM-DD'), TO_DATE('2024-06-30', 'YYYY-MM-DD'), '11:00 - 19:00', '금요일', 80, '서울시 송파구', '갤러리 E', 'http://galleryE.com', 10, 37.5024, 127.0975, 1, 3, 4);

INSERT INTO exhibition (exhibition_id, title, regdate, author, price, exhibition_start, exhibition_end, open, holiday, ticket_cnt, address, place, site, views, latitude, longitude, state, main_poster_file_id, detail_poster_file_id)
VALUES (exhibition_id_seq.NEXTVAL, '감성의 파도', SYSDATE, '한지민', 18000, TO_DATE('2024-01-09', 'YYYY-MM-DD'), TO_DATE('2024-07-31', 'YYYY-MM-DD'), '10:00 - 18:00', '토요일', 90, '서울시 강서구', '갤러리 F', 'http://galleryF.com', 80, 37.5660, 126.8649, 1, 5, 6);

INSERT INTO exhibition (exhibition_id, title, regdate, author, price, exhibition_start, exhibition_end, open, holiday, ticket_cnt, address, place, site, views, latitude, longitude, state, main_poster_file_id, detail_poster_file_id)
VALUES (exhibition_id_seq.NEXTVAL, '도시의 속삭임', SYSDATE, '정우성', 20000, TO_DATE('2024-02-01', 'YYYY-MM-DD'), TO_DATE('2024-08-31', 'YYYY-MM-DD'), '09:00 - 17:00', '일요일', 100, '서울시 관악구', '갤러리 G', 'http://galleryG.com', 100, 37.4783, 126.9513, 1, 7, 8);

INSERT INTO exhibition (exhibition_id, title, regdate, author, price, exhibition_start, exhibition_end, open, holiday, ticket_cnt, address, place, site, views, latitude, longitude, state, main_poster_file_id, detail_poster_file_id)
VALUES (exhibition_id_seq.NEXTVAL, '모던 아트의 재해석', SYSDATE, '이병헌', 22000, TO_DATE('2024-02-10', 'YYYY-MM-DD'), TO_DATE('2024-09-30', 'YYYY-MM-DD'), '10:30 - 18:30', '월요일', 110, '서울시 중구', '갤러리 H', 'http://galleryH.com', 50, 37.5635, 126.9975, 1, 1, 2);

INSERT INTO exhibition (exhibition_id, title, regdate, author, price, exhibition_start, exhibition_end, open, holiday, ticket_cnt, address, place, site, views, latitude, longitude, state, main_poster_file_id, detail_poster_file_id)
VALUES (exhibition_id_seq.NEXTVAL, '순간의 아름다움', SYSDATE, '김태희', 24000, TO_DATE('2024-02-12', 'YYYY-MM-DD'), TO_DATE('2024-10-31', 'YYYY-MM-DD'), '11:00 - 19:00', '화요일', 120, '서울시 동작구', '갤러리 I', 'http://galleryI.com', 30, 37.5123, 126.9393, 1, 3, 4);

INSERT INTO exhibition (exhibition_id, title, regdate, author, price, exhibition_start, exhibition_end, open, holiday, ticket_cnt, address, place, site, views, latitude, longitude, state, main_poster_file_id, detail_poster_file_id)
VALUES (exhibition_id_seq.NEXTVAL, '추억의 색감', SYSDATE, '송중기', 26000, TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-11-30', 'YYYY-MM-DD'), '10:00 - 18:00', '수요일', 130, '서울시 강북구', '갤러리 J', 'http://galleryJ.com', 20, 37.6396, 127.0258, 1, 5, 6);

INSERT INTO exhibition (exhibition_id, title, regdate, author, price, exhibition_start, exhibition_end, open, holiday, ticket_cnt, address, place, site, views, latitude, longitude, state, main_poster_file_id, detail_poster_file_id)
VALUES (exhibition_id_seq.NEXTVAL, '꿈의 향기', SYSDATE, '이지은', 0, TO_DATE('2024-03-15', 'YYYY-MM-DD'), TO_DATE('2024-04-30', 'YYYY-MM-DD'), '11:00 - 19:00', '월요일', 80, '부산시 해운대구', '아트센터 B', 'http://artcenterB.com', 15, 35.1631, 129.1639, 1, 1, 2);

INSERT INTO exhibition (exhibition_id, title, regdate, author, price, exhibition_start, exhibition_end, open, holiday, ticket_cnt, address, place, site, views, latitude, longitude, state, main_poster_file_id, detail_poster_file_id)
VALUES (exhibition_id_seq.NEXTVAL, '꿈을 꾸다', SYSDATE, '이하늘', 0, TO_DATE('2024-03-15', 'YYYY-MM-DD'), TO_DATE('2024-04-30', 'YYYY-MM-DD'), '12:00 - 20:00', '목요일', 30, '인천시 서구', '아트센터 c', 'http://artcenterc.com', 55, 35.1631, 129.1639, 1, 3, 4);

INSERT INTO exhibition (exhibition_id, title, regdate, author, price, exhibition_start, exhibition_end, open, holiday, ticket_cnt, address, place, site, views, latitude, longitude, state, main_poster_file_id, detail_poster_file_id)
VALUES (exhibition_id_seq.NEXTVAL, '꽃의 향연', SYSDATE, '김현아', 3000, TO_DATE('2024-02-03', 'YYYY-MM-DD'), TO_DATE('2024-04-30', 'YYYY-MM-DD'), '10:00 - 20:00', '목요일', 30, '대전시 유성구', '아트센터 d', 'http://artcenterd.com', 85, 35.1631, 129.1639, 1, 5, 6);

CREATE SEQUENCE board_id_seq START WITH 1 INCREMENT BY 1 MINVALUE 0;    -- board 테이블 시퀀스
CREATE TABLE board (
    board_id NUMBER primary key,
    user_id NUMBER,            
    title varchar2(255),
    create_date date,
    views number,               -- 조회수
    contents CLOB,              -- 내용(에디터값 저장)
    update_date date,           -- 수정일
    state number(1),            -- 상태값 0 : 삭제 ,1 : 정상
    FOREIGN KEY (user_id) REFERENCES user_table(user_id)
);

CREATE TABLE grade(             -- 등급 테이블
    grade varchar2(255),
    start_exp NUMBER,
    end_exp NUMBER
);

INSERT INTO grade (grade, start_exp, end_exp) VALUES ('level1', 0, 301);                -- 등급 테이블 임시 나눔
INSERT INTO grade (grade, start_exp, end_exp) VALUES ('level2', 301, 801);
INSERT INTO grade (grade, start_exp) VALUES ('level3', 800);

CREATE SEQUENCE point_id_seq START WITH 1 INCREMENT BY 1 MINVALUE 0;    -- 포인트 테이블 시퀀스
CREATE TABLE point_detail(
    point_id NUMBER primary key,
    user_id NUMBER,
    point NUMBER,
    point_state_code NUMBER(1),                   -- 사용 OR 적립 EX) 1:+ , 2:-
    point_type_code NUMBER(1),                    -- 사용 OR 적립 위치? 1:예매 2:소감문작성 3:공개여부
    regdate date,
    FOREIGN KEY (user_id) REFERENCES user_table(user_id)
);

-- 임시 orderid값 주기위한 시퀀스생성
CREATE SEQUENCE reserve_order_id_seq START WITH 1 INCREMENT BY 1 MINVALUE 0;

CREATE SEQUENCE reserve_id_seq START WITH 1 INCREMENT BY 1 MINVALUE 0;    -- 예매 테이블 시퀀스
CREATE TABLE reserve(
    reserve_id NUMBER primary key,
    user_id NUMBER,
    exhibition_id NUMBER,
    reserve_date date,          -- 예매날짜 date 컬럼이름으로 사용 불가
    total_price NUMBER,     -- 전체가격
    point_deduction NUMBER,       -- 포인트 사용
    payment NUMBER,        -- 포인트 제외 결제금액      cash_use + point_use = total_price
    ticket_count NUMBER,             -- 티켓 수량
    reserve_time timestamp, -- 시간저장
    state NUMBER(1),        -- 상태값  1:예매정상 2:예매취소 3: 관람완료?
    pay_state NUMBER(1), -- 결제 상태  0: 결제 실패 1: 결제 성공
    pay_approval_state NUMBER(1), -- 결제 승인 상태  0:결제 승인 실패 1: 결제 승인 성공
    order_id varchar2(1000),  -- 결제번호
    paymentkey varchar2(255), -- 결제키?
    FOREIGN KEY (user_id) REFERENCES user_table(user_id),
    FOREIGN KEY (exhibition_id) REFERENCES exhibition(exhibition_id)
);

CREATE SEQUENCE QnA_id_seq START WITH 1 INCREMENT BY 1 MINVALUE 0;    -- Q&A 테이블 시퀀스
CREATE TABLE QnA (
    QnA_id NUMBER primary key,
    user_id NUMBER,
    title varchar2(255),
    regdate date,
    contents CLOB,
    reply CLOB,
    state NUMBER(1),        -- 상태값 0 : 답변전 1: 답변완료
    FOREIGN KEY (user_id) REFERENCES user_table(user_id)
);

CREATE SEQUENCE review_id_seq START WITH 1 INCREMENT BY 1 MINVALUE 0;    -- 소감문 테이블 시퀀스
CREATE TABLE review(
    review_id NUMBER primary key,
    reserve_id NUMBER,
    contents varchar2(1000),
    rating NUMBER,                    -- 별점
    expose NUMBER(1),                     -- 공개여부 0:안보이게(N) 1: 보이게(Y)
    regdate date,                       -- 예매날짜
    modify_date date,                   -- 수정날짜
    create_date date,                   -- 작성날짜
    FOREIGN KEY (reserve_id) REFERENCES reserve(reserve_id)
);

-- 모든 테이블 제거(조심!)
BEGIN
   FOR t IN (SELECT table_name FROM user_tables)
   LOOP
      EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS';
   END LOOP;
END;
/

-- 모든 시퀀스 제거(조심!)
BEGIN
   FOR s IN (SELECT sequence_name FROM user_sequences)
   LOOP
      EXECUTE IMMEDIATE 'DROP SEQUENCE ' || s.sequence_name;
   END LOOP;
END;
/ 


