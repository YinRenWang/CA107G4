--------------------------------------------------------------------------------------------------------
alter session set deferred_segment_creation=false;

DROP TABLE GoodsReport;
DROP SEQUENCE GoodsReport_seq;

DROP TABLE GoodsMessage;
DROP SEQUENCE GoodsMessage_seq;

DROP TABLE GoodsLike;

DROP TABLE GoodsDetails;

DROP TABLE GoodsOrder;
DROP SEQUENCE GoodsOrder_seq;

DROP TABLE Goods;
DROP SEQUENCE Goods_seq;

--

DROP TABLE WITHDRAWALRECORD;
DROP SEQUENCE WITHDRAWALRECORD_seq;

DROP TABLE FRIENDNEXUS;

DROP TABLE FriendChatHistory;

DROP TABLE JOINGROUP;

DROP TABLE SCORPIONCHATRECORD;
DROP SEQUENCE SCORPIONCHATRECORD_seq;

--

DROP TABLE LiveStream;
DROP SEQUENCE LiveStream_seq;

DROP TABLE CourseTransferComment;
DROP SEQUENCE CourseTransferComment_seq;

DROP TABLE CourseTransfer;
DROP SEQUENCE CourseTransfer_seq;

DROP TABLE CourseReservation;
DROP SEQUENCE CourseReservation_seq;

DROP TABLE Team;
DROP SEQUENCE Team_seq;

DROP TABLE Advertisement;                     
DROP SEQUENCE Advertisement_seq;

DROP TABLE MemberCoupon;       

DROP TABLE Coupon;                      

DROP TABLE CourseReport;                    
DROP SEQUENCE CourseReport_seq;

DROP TABLE CourseLike;                   

DROP TABLE CourseComment;                 
DROP SEQUENCE CourseComment_seq;

DROP TABLE InsCourseTime;
DROP SEQUENCE InsCourseTime_seq;

DROP TABLE InsCourse;                      
DROP SEQUENCE InsCourse_seq;

DROP TABLE Teacher;                      
DROP SEQUENCE Teacher_seq;           

DROP TABLE Member;                    

DROP TABLE Course;                           
DROP SEQUENCE Course_seq;

DROP TABLE CourseType;                 
DROP SEQUENCE CourseType_seq;             

DROP TABLE Administrator;             

--管理員--

CREATE TABLE Administrator (
admId            VARCHAR2(10) NOT NULL,
admPsw           VARCHAR2(10) NOT NULL,
admStatus        NUMBER(1) NOT NULL,
CONSTRAINT admId_PRIMARY_KEY PRIMARY KEY (admId));

COMMENT ON COLUMN Administrator.admStatus IS '0=在職,1=離職';

INSERT INTO Administrator VALUES ('root','root','0');
INSERT INTO Administrator VALUES ('founder','founder','1');

--課程大類--

CREATE TABLE CourseType (
courseTypeId              NUMBER(2) NOT NULL,
courseTypeName            VARCHAR2(20) NOT NULL,
CONSTRAINT CourseType_PRIMARY_KEY PRIMARY KEY (courseTypeId));
	 
CREATE SEQUENCE CourseType_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

INSERT INTO CourseType VALUES (CourseType_seq.NEXTVAL,'音樂');
INSERT INTO CourseType VALUES (CourseType_seq.NEXTVAL,'語言');
INSERT INTO CourseType VALUES (CourseType_seq.NEXTVAL,'運動');
INSERT INTO CourseType VALUES (CourseType_seq.NEXTVAL,'藝術');
INSERT INTO CourseType VALUES (CourseType_seq.NEXTVAL,'設計');
INSERT INTO CourseType VALUES (CourseType_seq.NEXTVAL,'人文');
INSERT INTO CourseType VALUES (CourseType_seq.NEXTVAL,'行銷');
INSERT INTO CourseType VALUES (CourseType_seq.NEXTVAL,'程式語言');
INSERT INTO CourseType VALUES (CourseType_seq.NEXTVAL,'投資理財');
INSERT INTO CourseType VALUES (CourseType_seq.NEXTVAL,'職場技能');
INSERT INTO CourseType VALUES (CourseType_seq.NEXTVAL,'手作');
INSERT INTO CourseType VALUES (CourseType_seq.NEXTVAL,'烹飪');

--課程種類--

CREATE TABLE Course (
courseId            VARCHAR2(4) NOT NULL,
courseTypeId        NUMBER(2) NOT NULL,
courseName          VARCHAR2(20) NOT NULL,


CONSTRAINT Course_courseId_FK FOREIGN KEY (courseTypeId) REFERENCES CourseType (courseTypeId),
CONSTRAINT Course_courseId_PK PRIMARY KEY (courseId));
 
CREATE SEQUENCE Course_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'01','貝斯');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'01','吉他');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'02','英文');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'02','中文');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'08','Java');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'08','Andriod');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'08','SQL');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'12','甜品');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'12','烘焙');


INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'01','鋼琴');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'01','小提琴');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'01','喇叭');


INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'02','日文');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'02','韓文');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'02','法文');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'02','泰文');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'02','越南文');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'02','印度文');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'02','義大利文');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'02','西班牙文');

INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'03','籃球');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'03','拳擊');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'03','跑步');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'03','體操');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'03','高爾夫球');

INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'04','芭雷舞');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'04','魔術表演');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'04','演戲');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'04','舞蹈');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'04','演說');

INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'05','網頁設計');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'05','應用設計');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'05','平面設計');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'05','室內設計');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'05','設計理論');

INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'06','文學');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'06','社會科學');


INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'08','C++');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'08','C');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'08','Ruby');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'08','Python');

INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'12','亞洲料理');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'12','蛋糕裝飾');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'12','烹調');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'12','法國料理');




--會員(做BLOB指令)--

CREATE TABLE Member (
memId        VarChar2(20) NOT NULL, 
memSkill     VarChar2(4) ,
memWantSkill VarChar2(4) ,
memPair	     VarChar2(20), 
memIdCard    VARCHAR2(10) NOT NULL UNIQUE,
memPsw       VARCHAR2(20) NOT NULL,
memPswHint   VARCHAR2(20) NOT NULL,
memName      VARCHAR2(20) NOT NULL,
memSex       NUMBER(1) NOT NULL, 
memImage     BLOB,
memEmail     VARCHAR2(50) NOT NULL,
memPhone     VARCHAR2(10) NOT NULL,
memBirth     DATE ,
memAdd       VARCHAR2(100) NOT NULL,
memText      CLOB ,
memBank      VARCHAR2(20) ,
memBalance   NUMBER(10) NOT NULL,
memBlock     NUMBER(10) NOT NULL,
memStatus    NUMBER(1) NOT NULL,


CONSTRAINT Member_memSkill_FK FOREIGN KEY (memSkill) REFERENCES Course (courseId),
CONSTRAINT Member_memWantSkill_FK FOREIGN KEY (memWantSkill) REFERENCES Course (courseId),
CONSTRAINT Member_memPair_FK FOREIGN KEY (memPair) REFERENCES Member (memId),
CONSTRAINT Member_memId_PK PRIMARY KEY (memId));

COMMENT ON COLUMN Member.memSex IS '0=男性,1=女性';
COMMENT ON COLUMN Member.memStatus IS '0=待驗證,1=已驗證';

INSERT INTO MEMBER VALUES ('weshare01', '0005', '0008', NULL, 'S143766692', 'a123456', '123456', '板橋金城武', '0', empty_blob(), 'n1036434@ntub.edu.tw', '0912344580', TO_DATE('1995-11-23', 'YYYY-MM-DD'), '桃園市中壢區中大路300號15樓', 'Java是簡單的', '004116004056492', '10000', '20000', '1');
INSERT INTO MEMBER VALUES ('weshare02', '0008', '0005', NULL,'Q252488683', 'b123456', '123456', '蓋兒加朵', '1', empty_blob(), 'yinren1123@gmail.com', '0954446347', TO_DATE('1985-04-30', 'YYYY-MM-DD'), '台北市信義區信義路四段415號6樓', '我是神力女超人', '00731350235011', '500', '0', '1');
INSERT INTO MEMBER VALUES ('weshare03', '0004', '0009', NULL,'B287381891', 'c123456', '123456', '艾瑪華森', '1', empty_blob(), 'EmmaWatson@gmail.com', '0958403685', TO_DATE('1989-06-15', 'YYYY-MM-DD'), '台北市松山區八德路四段520號', '你們這群麻瓜', '08545080687111', '0', '0', '1');
INSERT INTO MEMBER VALUES ('weshare04', '0006', '0005', NULL,'A167464958', 'd123456', '123456', '克里斯漢斯沃', '0', empty_blob(), 'ChrisHemsworth@gmail.com', '0978254078', TO_DATE('1987-07-12', 'YYYY-MM-DD'), '台北市大安區復興南路一段390號', '我是頭上有閃電', '80885744387461', '1000', '0', '1');
INSERT INTO MEMBER VALUES ('weshare05', '0001', '0004',NULL, 'A227604096', 'e123456', '123456', '艾蜜莉克拉克', '1', empty_blob(), 'EmiliaClarke@ntub.edu.tw', '0975475932', TO_DATE('1999-12-23', 'YYYY-MM-DD'), '台北市萬華區中華路一段152號3樓 2,3,15樓', 'Every one love me.', '00314637967473', '5000', '20000', '1');
INSERT INTO MEMBER VALUES ('weshare06', '0002', '0003',NULL,'A278318487', 'f123456', '123456', '史嘉蕾喬韓森', '1', empty_blob(), 'Scarlett@gmail.com', '0936472842', TO_DATE('1989-06-30', 'YYYY-MM-DD'), '桃園市中壢區元化路306號', '黑寡婦有著世界級的運動員水準能力，她能令身體做出許多高難度的複雜動作。她也是一名大師等級的武術高手，精通空手道、柔道、法式拳擊等各式武技。', '007467579675323', '10000', '0', '1');
INSERT INTO MEMBER VALUES ('david', '0006', '0042',NULL,'A110133151', 'david', 'dddddd', '大衛海鮮', '0', empty_blob(), 'david@gmail.com', '0970537583', TO_DATE('1995-05-23', 'YYYY-MM-DD'), '新北市汐止區新台五路一段162號', '宣告，取值，吃500', '0074634679675323', '100500', '0', '1');
--老師(做BLOB指令)--

CREATE TABLE Teacher (
teacherId       VARCHAR2(7) NOT NULL,
memId           VARCHAR2(20) NOT NULL, 
teacherStatus   NUMBER(1) NOT NULL,
teacherCity     VARCHAR2(100) NOT NULL,
teacherEDU      VARCHAR2(50) NOT NULL,
diplomaImg      BLOB,
teacherText     CLOB,

CONSTRAINT Teacher_memId_FK FOREIGN KEY (memId) REFERENCES Member (memId),
CONSTRAINT Teacher_teacherId_PK PRIMARY KEY (teacherId));

COMMENT ON COLUMN Teacher.teacherStatus IS '0=待審核,1=已審核,2=停權中';
 
CREATE SEQUENCE Teacher_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

INSERT INTO Teacher VALUES (('TC'||LPAD(to_char(Teacher_seq.NEXTVAL), 5, '0')),'weshare01','1','新北市板橋區','國立臺北商業大學資管系',empty_blob(),'我是超棒的老師');
INSERT INTO Teacher VALUES (('TC'||LPAD(to_char(Teacher_seq.NEXTVAL), 5, '0')),'weshare02','1','桃園市中壢區','國立中央大學‎資訊工程學系',empty_blob(),'我是超美的女超人');
INSERT INTO Teacher VALUES (('TC'||LPAD(to_char(Teacher_seq.NEXTVAL), 5, '0')),'david','1','新北市汐止區','Tibame桃園中壢資策會',empty_blob(),'感恩SeaFood讚嘆SeaFood');


--課程--

CREATE TABLE InsCourse (
inscId          VARCHAR2(7) NOT NULL,
teacherId       VARCHAR2(7) NOT NULL,
courseId        VARCHAR2(4) NOT NULL,
inscLoc         VARCHAR2(100) NOT NULL,
inscType        NUMBER(1) NOT NULL,
inscPeople      NUMBER(2),
inscLang        VARCHAR2(100) NOT NULL,
inscPrice       NUMBER(10) NOT NULL,
inscCourser     CLOB,
inscStatus      NUMBER(1) NOT NULL,


CONSTRAINT InsCourse_teacherId_FK FOREIGN KEY (teacherId) REFERENCES Teacher (teacherId),
CONSTRAINT InsCourse_courseId_FK FOREIGN KEY (courseId) REFERENCES Course (courseId),
CONSTRAINT InsCourse_inscId_PK PRIMARY KEY (inscId));

COMMENT ON COLUMN insCourse.inscType IS '0=個人課程,1=團體課程';
COMMENT ON COLUMN insCourse.inscStatus IS '0=上架,1=下架';
 
CREATE SEQUENCE InsCourse_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

Insert into INSCOURSE values (('IC'||LPAD(to_char(InsCourse_seq.NEXTVAL), 5, '0')),'TC00001','0005','桃園市中壢區','0',null,'中文','600','Java是簡單的，要什麼給什麼，萬物皆物件','0');
Insert into INSCOURSE values (('IC'||LPAD(to_char(InsCourse_seq.NEXTVAL), 5, '0')),'TC00002','0008','台北市信義區','1','4','英文','300','製作抹茶奶凍捲,學習重點 - 難度較高、舒芙蕾般軟嫩的蛋糕體學習 - 抹茶甘納許的製作 - 日式口味的紅豆奶油餡','0');
Insert into INSCOURSE values (('IC'||LPAD(to_char(InsCourse_seq.NEXTVAL), 5, '0')),'TC00003','0006','新北市汐止區','1','23','中文','500','來Tibame中壢資策會Android真的好簡單! A piece of cake','0');

--課程時間--

CREATE TABLE InsCourseTime (
inscTimeId      VARCHAR2(7) NOT NULL,
inscId          VARCHAR2(7) NOT NULL,
inscMFD 		DATE,
inscEXP         DATE,

CONSTRAINT InsCourseTime_InsCourse_FK FOREIGN KEY (inscId) REFERENCES InsCourse (inscId),
CONSTRAINT InsCourseTime_inscTimeId_PK PRIMARY KEY (inscTimeId));

CREATE SEQUENCE InsCourseTime_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00001',TO_DATE('2019-05-24 11:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 12:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00001',TO_DATE('2019-05-24 13:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 15:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00001',TO_DATE('2019-05-24 15:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 17:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00001',TO_DATE('2019-05-24 17:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 18:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00001',TO_DATE('2019-05-24 18:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 19:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00001',TO_DATE('2019-05-24 20:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 22:00', 'YYYY-MM-DD HH24:MI'));

Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00002',TO_DATE('2019-05-24 11:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 13:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00002',TO_DATE('2019-05-24 13:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 15:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00002',TO_DATE('2019-05-24 15:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 18:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00002',TO_DATE('2019-05-24 17:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 19:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00002',TO_DATE('2019-05-24 19:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 20:00', 'YYYY-MM-DD HH24:MI'));

Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00003',TO_DATE('2019-05-24 11:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 12:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00003',TO_DATE('2019-05-24 16:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 17:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00003',TO_DATE('2019-05-24 14:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 16:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00003',TO_DATE('2019-05-24 15:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-05-24 18:00', 'YYYY-MM-DD HH24:MI'));

--課程留言--

CREATE TABLE COURSECOMMENT (
ccID      VARCHAR2(7) NOT NULL,
memId     VARCHAR2(20) NOT NULL,
inscId    VARCHAR2(7) NOT NULL,
ccContent CLOB,

CONSTRAINT COURSECOMMENT_memId_FK FOREIGN KEY (memId) REFERENCES Member (memId),
CONSTRAINT COURSECOMMENT_inscId_FK FOREIGN KEY (inscId) REFERENCES InsCourse (inscId),
CONSTRAINT COURSECOMMENT_ccId_PK PRIMARY KEY (ccId));

CREATE SEQUENCE COURSECOMMENT_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

Insert into COURSECOMMENT values (('CC'||LPAD(to_char(COURSECOMMENT_seq.NEXTVAL), 5, '0')),'weshare02','IC00001','請問Java真的很簡單.....嗎?');
Insert into COURSECOMMENT values (('CC'||LPAD(to_char(COURSECOMMENT_seq.NEXTVAL), 5, '0')),'weshare02','IC00001','上課前我需要準備什麼嗎?');
Insert into COURSECOMMENT values (('CC'||LPAD(to_char(COURSECOMMENT_seq.NEXTVAL), 5, '0')),'weshare03','IC00002','我笨手笨腳的也可以上手嗎?!');


--課程收藏--

CREATE TABLE CourseLike (
memId    VarChar2(20) NOT NULL, 
inscId    VARCHAR2(7) NOT NULL,

CONSTRAINT Courseave_memId_FK FOREIGN KEY (memId) REFERENCES Member (memId),
CONSTRAINT Courseave_inscId_FK FOREIGN KEY (inscId) REFERENCES InsCourse (inscId),
PRIMARY KEY(memId, inscId));

INSERT INTO CourseLike VALUES ('weshare03', 'IC00001');
INSERT INTO CourseLike VALUES ('weshare03', 'IC00002');
INSERT INTO CourseLike VALUES ('weshare04', 'IC00001');
INSERT INTO CourseLike VALUES ('weshare01', 'IC00002');
INSERT INTO CourseLike VALUES ('weshare02', 'IC00001');

--課程檢舉--

CREATE TABLE CourseReport (
crID      VarChar2(7) NOT NULL, 
memId     VarChar2(20) NOT NULL, 
inscId    VarChar2(7) NOT NULL,
crContent CLOB,
crStatus  NUMBER(1) NOT NULL,

CONSTRAINT CourseReport_memId_FK FOREIGN KEY (memId) REFERENCES Member (memId),
CONSTRAINT CourseReport_inscId_FK FOREIGN KEY (inscId) REFERENCES InsCourse (inscId),
CONSTRAINT CourseReport_crID_PK PRIMARY KEY (crID));

COMMENT ON COLUMN CourseReport.crStatus IS '0=待處理,1=通過,2=不通過';

CREATE SEQUENCE CourseReport_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

INSERT INTO CourseReport VALUES (('CR'||LPAD(to_char(CourseReport_seq.NEXTVAL), 5, '0')),'weshare03','IC00001','Java是傳記憶體位址','2');
INSERT INTO CourseReport VALUES (('CR'||LPAD(to_char(CourseReport_seq.NEXTVAL), 5, '0')),'weshare04','IC00002','老師根本就不是神力女超人騙人的!!!','0');
INSERT INTO CourseReport VALUES (('CR'||LPAD(to_char(CourseReport_seq.NEXTVAL), 5, '0')),'weshare04','IC00002','老師根本就沒有神力啊','1');

--折價券資訊--

CREATE TABLE Coupon (
couponId            VARCHAR2(20) NOT NULL,
couponName          VARCHAR2(100) NOT NULL,
couponDollar        NUMBER(10) NOT NULL,
couponBalance       NUMBER(10) NOT NULL,
couponMFD           Date,
couponEXP           Date,
couponStatus        NUMBER(1) NOT NULL,

CONSTRAINT Coupon_PRIMARY_KEY PRIMARY KEY (couponId));

COMMENT ON COLUMN Coupon.couponStatus IS '0=未上架,1=已上架';

INSERT INTO Coupon VALUES ('FIRSTORDER500','首張訂單折扣500','500','1000',TO_DATE('2019-04-01 ', 'YYYY-MM-DD'),TO_DATE('2019-04-20 ', 'YYYY-MM-DD'),'1');
INSERT INTO Coupon VALUES ('HAPPY10OFFYA','訂單滿1000元享9折優惠','500','1000',TO_DATE('2019-04-02 ', 'YYYY-MM-DD'),TO_DATE('2019-04-22 ', 'YYYY-MM-DD'),'1');

--會員折價券--

CREATE TABLE MemberCoupon (
couponId VARCHAR2(20) NOT NULL, 
memId    VARCHAR2(20) NOT NULL,
mcStatus NUMBER(1) NOT NULL,

CONSTRAINT MemberCoupon_couponId_FK FOREIGN KEY (couponId) REFERENCES Coupon (couponId),
CONSTRAINT MemberCoupon_memId_FK FOREIGN KEY (memId) REFERENCES Member (memId),
PRIMARY KEY(couponId, memId));

COMMENT ON COLUMN MemberCoupon.mcStatus IS '0=未使用,1=已使用';

INSERT INTO MemberCoupon VALUES ('FIRSTORDER500','weshare01','1');
INSERT INTO MemberCoupon VALUES ('HAPPY10OFFYA','weshare01','0');
INSERT INTO MemberCoupon VALUES ('FIRSTORDER500','weshare02','0');
INSERT INTO MemberCoupon VALUES ('HAPPY10OFFYA','weshare02','0');
INSERT INTO MemberCoupon VALUES ('FIRSTORDER500','weshare03','1');
INSERT INTO MemberCoupon VALUES ('FIRSTORDER500','weshare04','0');

--廣告--

CREATE TABLE Advertisement (
adId    	 VarChar2(7) NOT NULL ,
inscId   	 VarChar(7) NOT NULL ,
adStatus 	 NUMBER(1) NOT NULL,
adMFD 		 Date,
adEXP        Date,
adImg        BLOB,

CONSTRAINT Advertisement_inscId_FK FOREIGN KEY (inscId) REFERENCES InsCourse (inscId),
CONSTRAINT Advertisement_ADID_PK PRIMARY KEY (ADID));

COMMENT ON COLUMN Advertisement.adStatus IS '0=未上架,1=已上架';

CREATE SEQUENCE Advertisement_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

INSERT INTO Advertisement VALUES (('AD'||LPAD(to_char(Advertisement_seq.NEXTVAL), 5, '0')),'IC00001','1',TO_DATE('2019-03-22 12:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-03-25 12:00', 'YYYY-MM-DD HH24:MI'),empty_blob());
INSERT INTO Advertisement VALUES (('AD'||LPAD(to_char(Advertisement_seq.NEXTVAL), 5, '0')),'IC00002','1',TO_DATE('2019-03-22 12:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-03-25 12:00', 'YYYY-MM-DD HH24:MI'),empty_blob());

--揪團--

CREATE TABLE Team (
teamId    VarChar2(7) NOT NULL ,
leaderId  VARCHAR2(20) NOT NULL, 
inscId    VARCHAR2(7) NOT NULL ,
teamMFD   DATE ,
teamEXP   DATE ,
teamStatus NUMBER(1),

CONSTRAINT  Team_leaderId_FK FOREIGN KEY (leaderId) REFERENCES MEMBER (memId),
CONSTRAINT  Team_inscId_FK   FOREIGN KEY (inscId)   REFERENCES INSCOURSE (inscId),
CONSTRAINT  Team_PK PRIMARY KEY (teamId));
COMMENT ON COLUMN Team.teamStatus IS '0=待成團 1=已成團';

CREATE SEQUENCE Team_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;
Insert INTO TEAM VALUES (('TM'||LPAD(to_char(Team_seq.NEXTVAL), 5, '0')),'weshare01','IC00002',TO_DATE('2019-04-22 14:49:42', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2019-05-23 14:49:42', 'YYYY-MM-DD HH24:MI:SS'),1);

--課程預約訂單--

CREATE TABLE CourseReservation (
crvId          VarChar2(7) NOT NULL,         
teacherId      VarChar2(7) NOT NULL,  
memId          VarChar2(20) NOT NULL,
inscId         VarChar2(7) NOT NULL,  
teamId         VarChar2(7) ,  
crvStatus      NUMBER(1) NOT NULL, 
classStatus    NUMBER(1) NOT NULL, 
tranStatus     NUMBER(1) NOT NULL, 
crvMFD         DATE, 
crvEXP         DATE,
crvLoc         VARCHAR2(50) NOT NULL, 
crvTotalTime   NUMBER(10) NOT NULL, 
crvTotalPrice  NUMBER(10) NOT NULL, 
crvScore       FLOAT(20) , 
crvRate        CLOB, 

CONSTRAINT CourseReservation_teacherId_FK FOREIGN KEY (teacherId) REFERENCES Teacher (teacherId),
CONSTRAINT CourseReservation_memID_FK FOREIGN KEY (memId) REFERENCES Member (memId),
CONSTRAINT CourseReservation_inscID_FK FOREIGN KEY (INSCID) REFERENCES InsCourse(INSCID),
CONSTRAINT CourseReservation_teamId_FK FOREIGN KEY (teamId) REFERENCES Team(teamId),
CONSTRAINT CourseReservation_crvId_PK PRIMARY KEY (crvId));

COMMENT ON COLUMN CourseReservation.crvStatus IS '0=訂單取消,1=訂單正常';
COMMENT ON COLUMN CourseReservation.classStatus IS '0=未上課,1=已上課';
COMMENT ON COLUMN CourseReservation.tranStatus IS '0=未轉讓,1=待轉讓,2=已轉讓';

CREATE SEQUENCE CourseReservation_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

Insert into CourseReservation values ('CR'||LPAD(to_char(CourseReservation_seq.NEXTVAL),5,'0'),'TC00001','weshare04','IC00001',null,'1','1','2',TO_DATE('2019-03-22 14:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-03-22 16:00', 'YYYY-MM-DD HH24:MI'),'台北市大安區','2','600',5,'Java真的是簡單的!!');
Insert into CourseReservation values ('CR'||LPAD(to_char(CourseReservation_seq.NEXTVAL),5,'0'),'TC00001','weshare05','IC00001',null,'1','1','0',TO_DATE('2019-03-22 14:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-03-22 16:00', 'YYYY-MM-DD HH24:MI'),'台北市萬華區','2','600',4.5,'建立我正確的Java人生觀!!');
Insert into CourseReservation values ('CR'||LPAD(to_char(CourseReservation_seq.NEXTVAL),5,'0'),'TC00001','weshare06','IC00001',null,'1','1','0',TO_DATE('2019-03-22 14:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-03-22 16:00', 'YYYY-MM-DD HH24:MI'),'桃園市中壢區','2','600',4.0,'老師跟金城武一樣帥!!');
Insert into CourseReservation values ('CR'||LPAD(to_char(CourseReservation_seq.NEXTVAL),5,'0'),'TC00002','weshare01','IC00002',null,'1','1','2',TO_DATE('2019-03-22 14:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-03-22 16:00', 'YYYY-MM-DD HH24:MI'),'桃園市中壢區','2','600',4,'老師比甜點還要甜>/<');
Insert into CourseReservation values ('CR'||LPAD(to_char(CourseReservation_seq.NEXTVAL),5,'0'),'TC00002','weshare03','IC00002',null,'1','1','0',TO_DATE('2019-03-22 14:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-03-22 16:00', 'YYYY-MM-DD HH24:MI'),'台北市松山區','2','600',4,'So Sweet!!');

--課程轉讓--

CREATE TABLE CourseTransfer (
ctId       VarChar2(7) NOT NULL,
ctBuyer    VarChar2(20),
oldCrvId   VarChar2(7) NOT NULL,
newCrvId   VarChar2(7),
ctDate     Date,
ctPrice    NUMBER(10) NOT NULL,

CONSTRAINT CourseTransfer_ctBuyer_FK FOREIGN KEY (ctBuyer) REFERENCES Member (memId),
CONSTRAINT CourseTransfer_oldCrvId_FK FOREIGN KEY (oldCrvId) REFERENCES CourseReservation(CrvId),
CONSTRAINT CourseTransfer_newCrvId_FK FOREIGN KEY (newCrvId) REFERENCES CourseReservation(CrvId),
CONSTRAINT CourseTransfer_ctId_PK PRIMARY KEY (ctId));

CREATE SEQUENCE CourseTransfer_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

INSERT INTO CourseTransfer VALUES ('CT'||LPAD(to_char(CourseTransfer_seq.NEXTVAL),5,'0'),'weshare02','CR00001','CR00002',TO_DATE('2019-03-22 144942', 'YYYY-MM-DD HH24MISS'),'200');

--課程轉讓留言--

CREATE TABLE CourseTransferComment (
ctcId       VARCHAR2(7) NOT NULL,
ctId        VARCHAR2(7) NOT NULL,
memId       VARCHAR2(20) NOT NULL,
ctcContent  CLOB,

CONSTRAINT CourseTransferComment_memId_FK FOREIGN KEY(memId) REFERENCES Member (memId),
CONSTRAINT CourseTransferComment_ctId_FK FOREIGN KEY(ctId) REFERENCES CourseTransfer (ctId),
CONSTRAINT CourseTransferComment_ctcId_PK PRIMARY KEY(ctcId));

CREATE SEQUENCE CourseTransferComment_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

INSERT INTO CourseTransferComment VALUES ('CM'||LPAD(to_char(CourseTransferComment_seq.NEXTVAL),5,'0'),'CT00001','weshare01','請問還有議價空間嗎');
INSERT INTO CourseTransferComment VALUES ('CM'||LPAD(to_char(CourseTransferComment_seq.NEXTVAL),5,'0'),'CT00001','weshare02','可以再便宜一點ㄇ?我是學生');

--直播課程--
CREATE TABLE LiveStream(
lsId       VARCHAR2(7) NOT NULL,
teacherId  VARCHAR2(7) NOT NULL,
lsDate     Date,
lsViewNum  Number(20) NOT NULL,
lsContent  BLOB,

CONSTRAINT LiveStream_teacherId_FK FOREIGN KEY(teacherId)REFERENCES Teacher (TeacherId),
CONSTRAINT LiveStream_lsId_PK PRIMARY KEY(lsId));

CREATE SEQUENCE LiveStream_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;


INSERT INTO LiveStream VALUES('LV'||LPAD(to_char(LiveStream_seq.NEXTVAL),5,'0'),'TC00001',TO_DATE('2019-03-22 14:49:42', 'YYYY-MM-DD HH24:MI:SS'),'5180',null);
INSERT INTO LiveStream VALUES('LV'||LPAD(to_char(LiveStream_seq.NEXTVAL),5,'0'),'TC00002',TO_DATE('2019-03-22 14:49:42', 'YYYY-MM-DD HH24:MI:SS'),'7642',null);
INSERT INTO LiveStream VALUES('LV'||LPAD(to_char(LiveStream_seq.NEXTVAL),5,'0'),'TC00003',TO_DATE('2019-05-23 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),'245205',null);


--交易紀錄--

CREATE TABLE WITHDRAWALRECORD (	
WRNUM   VARCHAR2(7), 
MEMID  VARCHAR2(20), 
WRMONEY NUMBER, 
WRTIME  DATE,

CONSTRAINT WITHDRAWALRECORD_PK PRIMARY KEY (WRNUM),
CONSTRAINT WITHDRAWALRECORD_MEMID_FK FOREIGN KEY(MEMID)REFERENCES MEMBER(MEMID) );

CREATE SEQUENCE WITHDRAWALRECORD_SEQ  
INCREMENT BY 1				   
START WITH 1				  
NOMAXVALUE					   
NOCYCLE                       
NOCACHE;                       
Insert Into WITHDRAWALRECORD values (('WI'||LPAD(to_char(WITHDRAWALRECORD_seq.NEXTVAL), 5, '0')),'weshare01','1000',to_date('25-3月-19','DD-MON-RR'));
Insert Into WITHDRAWALRECORD values (('WI'||LPAD(to_char(WITHDRAWALRECORD_seq.NEXTVAL), 5, '0')),'weshare02','5000',to_date('26-5月-19','DD-MON-RR'));
Insert Into WITHDRAWALRECORD values (('WI'||LPAD(to_char(WITHDRAWALRECORD_seq.NEXTVAL), 5, '0')),'weshare03','15000',to_date('26-5月-19','DD-MON-RR'));
--好友關係--

CREATE TABLE FRIENDNEXUS ( 
MEMID VARCHAR2(20 BYTE) NOT NULL,         
FRIENDACC VARCHAR2(20 BYTE) NOT NULL, 
FRIENDSTATUS Number(1),
    
CONSTRAINT FRIENDNEXUS_PK PRIMARY KEY (MEMID , FRIENDACC ),
CONSTRAINT FRIENDNEXUS_FRIENDACC_FK FOREIGN KEY(MEMID )REFERENCES MEMBER(MEMID ),
CONSTRAINT FRIENDNEXUS_MEMID_FK FOREIGN KEY(MEMID)REFERENCES MEMBER(MEMID));
COMMENT ON COLUMN FRIENDNEXUS.FRIENDSTATUS IS '0=申請中 1=已成為好友';
Insert into FRIENDNEXUS values ('weshare01','weshare02',1);
Insert into FRIENDNEXUS values ('weshare02','weshare03',1);
Insert into FRIENDNEXUS values ('weshare03','weshare04',1);

--好友聊天紀錄--

CREATE TABLE FriendChatHistory ( 
FRIENDACC VARCHAR2(20 BYTE) NOT NULL, --好友帳號--
MEMID     VARCHAR2(20 BYTE) NOT NULL, --會員帳號--
CHATRECORD     CLOB ,            --聊天內容--
CONSTRAINT FriendChatHistory_PK PRIMARY KEY (FRIENDACC , MEMID ),
CONSTRAINT FRIENDCHATHISTORY_MEMID_FK FOREIGN KEY(MEMID)REFERENCES MEMBER(MEMID),
CONSTRAINT FriendChatHistory_accNo_FK FOREIGN KEY(MEMID)REFERENCES MEMBER(MEMID ));

Insert into FRIENDCHATHISTORY values ('weshare02','weshare01','null');
Insert into FRIENDCHATHISTORY values ('weshare02','weshare03','null');
Insert into FRIENDCHATHISTORY values ('weshare03','weshare04','null');

--參加揪團--

CREATE TABLE "JOINGROUP" (	
MEMID VARCHAR2(20)  NOT NULL,           --會員帳號--
teamId  VARCHAR2(7) NOT NULL,           --揪團帳號--
CONSTRAINT JOINGROUP_PK PRIMARY KEY (MEMID , teamId ),
CONSTRAINT JOINGROUP_teamId_FK FOREIGN KEY(MEMID , teamId )REFERENCES JOINGROUP(MEMID , teamId ),
CONSTRAINT JOINGROUP_MEMID_FK FOREIGN KEY(MEMID)REFERENCES MEMBER(MEMID));

Insert into JOINGROUP values ('weshare01','TM00001');
Insert into JOINGROUP values ('weshare03','TM00001');

--揪團聊天紀錄--


CREATE TABLE "SCORPIONCHATRECORD" (	
teamcNo VarChar2(7) NOT NULL,   
teamId VarChar2(7) NOT NULL,       
GROCHATRECORD CLOB,  
CONSTRAINT SCORPIONCHATRECORD_teamId_FK FOREIGN KEY (teamId) REFERENCES Team(teamId),
CONSTRAINT SCORPIONCHATRECORD_PK PRIMARY KEY (teamcNo));

CREATE SEQUENCE SCORPIONCHATRECORD_SEQ   
INCREMENT BY 1				   
START WITH 1				   
NOMAXVALUE					   
NOCYCLE                        
NOCACHE;  



--教材商品--
CREATE TABLE Goods ( 

goodId VarChar2(7) NOT NULL, 
teacherId VarChar2(7) NOT NULL,
goodName VarChar2(20) NOT NULL,
goodPrice Number(10) NOT NULL,
goodInfo CLOB,
goodImg BLOB,
goodStatus Number(1),

CONSTRAINT Goods_goodId_PK PRIMARY KEY (goodId),
CONSTRAINT Goods_teacherId_FK FOREIGN KEY (teacherId) REFERENCES teacher (teacherId)

);

COMMENT ON COLUMN Goods.goodStatus IS '0=下架,1=上架';

CREATE SEQUENCE Goods_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;
-------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Goods VALUES (('GD'||LPAD(to_char(Goods_seq.NEXTVAL), 5, '0')),'TC00001','Java深入淺出','550','本書是根據學習理論所設計的、讓你可以從學習程式語言的基本開始一直到包括執行緒、網路、與分散式程式等項目。最重要的，你會學會如何像個物件導向開發 者一般的思考。',NULL,'1');
INSERT INTO Goods VALUES (('GD'||LPAD(to_char(Goods_seq.NEXTVAL), 5, '0')),'TC00002','AJax深入淺出','600','本書不只是一本書，更是一段互動式 Web 應用程式編程的完整學習體驗。本書專為你的大腦量身打造，內容涵蓋 JavaScript、XHTML、DOM、以及其他擴展及革新 Web 應用程式所需的一切。',NULL,'1');
INSERT INTO Goods VALUES (('GD'||LPAD(to_char(Goods_seq.NEXTVAL), 5, '0')),'TC00001','Oracle程式設計','700','資料庫程式的設計與開發是軟體發展人員不可缺少的工作技能。本書將充分介紹Oracle PL/SQL語言的應用技術，帶領您解決資料庫開發中所遇到的各種問題。',NULL,'1');
INSERT INTO Goods VALUES (('GD'||LPAD(to_char(Goods_seq.NEXTVAL), 5, '0')),'TC00001','HTML深入淺出','450','在本書中將學會建立網站的真正秘密，視覺元素豐富的格式設計又能幫助大腦運作。使用最新的腦神經學、認知科學與學習理論的研究，本書將把 HTML 與 CSS 載入你的大腦，而且保證記憶深刻。 ',NULL,'1');
INSERT INTO Goods VALUES (('GD'||LPAD(to_char(Goods_seq.NEXTVAL), 5, '0')),'TC00001','Servlet深入淺出','800','本書不只提供你必須謹記在心的豐富資訊；更將這些寶貴的知識直接烙印在你的大腦裡。藉由大量幫助你快速且深入學習的機制，你將與Servelets和JSP進行最有效率的互動。',NULL,'1');
INSERT INTO Goods VALUES (('GD'||LPAD(to_char(Goods_seq.NEXTVAL), 5, '0')),'TC00001','jQuery深入淺出','750','本書編寫的目的，市場上JQuery的書籍全部都只寫了基礎的使用，並沒有利用JQuery 開發一套完整的demo 案例，造成新手入門難、熟手不願意看的局面。 本書打破了傳統編寫手法，全部採用真實案例講解，並且保證所有源代碼均能正常運行。',NULL,'0');
INSERT INTO Goods VALUES (('GD'||LPAD(to_char(Goods_seq.NEXTVAL), 5, '0')),'TC00002','JavaScript大補帖','350','本書教導你如何為你的網站增添更多趣味性、吸引力、互動性、與操作便利性。透過書本所探討的程式設計理論，結合實際案例的說明，你將理解各熱門網站是如何運用JavaScript和jQuery技術增添網站的魅力。',NULL,'1');
INSERT INTO Goods VALUES (('GD'||LPAD(to_char(Goods_seq.NEXTVAL), 5, '0')),'TC00001','Android深入淺出','200','本書會逐一介紹 Andorid 各組成元件的程式撰寫方法, 包括使用介面、事件處理、多活動 Android 應用程式, 然後帶到資料儲存與檔案交換、資料庫、廣播接收器等。最後使用數十個熱門範例來說明 Android 應用程式的實作技巧。 ',NULL,'1');
INSERT INTO Goods VALUES (('GD'||LPAD(to_char(Goods_seq.NEXTVAL), 5, '0')),'TC00002','RWD網頁設計','300','本書中從認識響應式網頁與Bootstrap開始，詳解網站開發流程、響應式網頁設計思維、SEO設定，以及網頁設計趨勢，導入視覺設計與網頁製作兩個不同領域的專業知識，用實例製作出響應式網頁，以具備實務的設計技能。',NULL,'0');
-------------------------------------------------------------------------------------------------------------------------------------------
--教材商品訂單--
CREATE TABLE GoodsOrder ( 

goodOrderId VarChar2(7) NOT NULL, 
memId VarChar2(20) NOT NULL,
goodTotalPrice Number(10) NOT NULL,
goodDate Date,
buyerName VarChar2(20) NOT NULL,
buyerAddress VarChar2(60) NOT NULL,
buyerPhone VARCHAR2(10) NOT NULL,
goodOrdStatus Number(1),

CONSTRAINT GoodsOrder_goodOrderId_PK PRIMARY KEY (goodOrderId),
CONSTRAINT GoodsOrder_memId_FK FOREIGN KEY (memId) REFERENCES Member (memId)

);

COMMENT ON COLUMN GoodsOrder.goodOrdStatus IS '0=訂單取消, 1=未出貨, 2=出貨中, 3=訂單完成';

CREATE SEQUENCE GoodsOrder_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;
------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO GoodsOrder VALUES (('GO'||LPAD(to_char(GoodsOrder_seq.NEXTVAL), 5, '0')),'weshare01','3200',TO_DATE('1955-09-09','YYYY-MM-DD'),'米其林','台北市大安區羅斯福路四段1號','0928199890','1');
INSERT INTO GoodsOrder VALUES (('GO'||LPAD(to_char(GoodsOrder_seq.NEXTVAL), 5, '0')),'weshare02','1850',TO_DATE('1991-08-03','YYYY-MM-DD'),'傑尼龜','新竹市東區大學路1001號','0936167890','1');
INSERT INTO GoodsOrder VALUES (('GO'||LPAD(to_char(GoodsOrder_seq.NEXTVAL), 5, '0')),'weshare03','2450',TO_DATE('1970-01-01','YYYY-MM-DD'),'皮卡丘','台南市東區大學路1號','0916167550','1');
INSERT INTO GoodsOrder VALUES (('GO'||LPAD(to_char(GoodsOrder_seq.NEXTVAL), 5, '0')),'weshare04','900',TO_DATE('1911-02-21','YYYY-MM-DD'),'唐老鴨','新竹市東區光復路二段101號','0956115810','0');
INSERT INTO GoodsOrder VALUES (('GO'||LPAD(to_char(GoodsOrder_seq.NEXTVAL), 5, '0')),'weshare01','1450',TO_DATE('1955-07-29','YYYY-MM-DD'),'高飛','桃園市中壢區中大路300號','0966199890','1');
INSERT INTO GoodsOrder VALUES (('GO'||LPAD(to_char(GoodsOrder_seq.NEXTVAL), 5, '0')),'weshare03','900',TO_DATE('1911-02-21','YYYY-MM-DD'),'彭于晏','新北市板橋區四川路二段58號','0926955810','0');
------------------------------------------------------------------------------------------------------------------------------------------------------------------
--教材商品訂單明細 --

CREATE TABLE GoodsDetails ( 

goodOrderId VarChar2(7) NOT NULL, 
goodId VarChar2(7) NOT NULL,
goodAmount Number(10) NOT NULL,
goodScore Float(20),
goodRate CLOB,

CONSTRAINT GoodsDetails_goodOrderId_FK FOREIGN KEY (goodOrderId) REFERENCES GoodsOrder (goodOrderId),
CONSTRAINT GoodsDetails_goodId_FK FOREIGN KEY (goodId) REFERENCES Goods (goodId),
PRIMARY KEY(goodOrderId, goodId)
);

COMMENT ON COLUMN GoodsDetails.goodScore IS '0~5分(間距0.5分)';
--------------------------------------------------------------------------
INSERT INTO GoodsDetails VALUES ('GO00001','GD00003','25','4.5',null);
INSERT INTO GoodsDetails VALUES ('GO00001','GD00002','17','3.0',null);
INSERT INTO GoodsDetails VALUES ('GO00002','GD00006','33','ß4.5',null);
INSERT INTO GoodsDetails VALUES ('GO00003','GD00004','10','4.0',null);
INSERT INTO GoodsDetails VALUES ('GO00004','GD00001','6','3.0',null);
INSERT INTO GoodsDetails VALUES ('GO00004','GD00007','29','3.0',null);
-----------------------------------------------------------------------------
--教材商品收藏 --

CREATE TABLE GoodsLike( 
goodId VarChar2(7) NOT NULL, 
memId VarChar2(20) NOT NULL,

CONSTRAINT GoodsLike_goodId_FK FOREIGN KEY (goodId) REFERENCES Goods (goodId),
CONSTRAINT GoodsLike_memId_FK FOREIGN KEY (memId) REFERENCES Member  (memId),
PRIMARY KEY(goodId, memId)
);

INSERT INTO GoodsLike VALUES ('GD00003','weshare01');
INSERT INTO GoodsLike VALUES ('GD00002','weshare02');
INSERT INTO GoodsLike VALUES ('GD00005','weshare04');
INSERT INTO GoodsLike VALUES ('GD00003','weshare02');

--教材留言--

CREATE TABLE GoodsMessage 
(
    goodsMessageID VarChar2(7) NOT NULL, 
    goodId VarChar2(7) NOT NULL, 
    memId VARCHAR2(20) NOT NULL, 
    messageContent CLOB,
    CONSTRAINT GoodsMessage_PK PRIMARY KEY (goodsMessageID ),
    CONSTRAINT GoodsMessage_goodId_FK FOREIGN KEY(goodId)REFERENCES Goods(goodId),
    CONSTRAINT GoodsMessage_MEMID_FK FOREIGN KEY(MEMID)REFERENCES MEMBER(MEMID)
);

CREATE SEQUENCE GoodsMessage_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

INSERT INTO GoodsMessage VALUES (('GM'||LPAD(to_char(GoodsMessage_seq.NEXTVAL), 5, '0')),'GD00001','weshare01','null');
INSERT INTO GoodsMessage VALUES (('GM'||LPAD(to_char(GoodsMessage_seq.NEXTVAL), 5, '0')),'GD00003','weshare01','null');
INSERT INTO GoodsMessage VALUES (('GM'||LPAD(to_char(GoodsMessage_seq.NEXTVAL), 5, '0')),'GD00002','weshare03','null');
INSERT INTO GoodsMessage VALUES (('GM'||LPAD(to_char(GoodsMessage_seq.NEXTVAL), 5, '0')),'GD00005','weshare04','null');

--教材商品檢舉--

CREATE TABLE GoodsReport 
(
  goodReportID VARCHAR2(7) NOT NULL , 
  MEMID VARCHAR2(20) NOT NULL , 
  goodId VarChar2(7) NOT NULL , 
  goodReportContent CLOB , 
  goodReportStatus NUMBER , 
  CONSTRAINT GoodsReport_PK PRIMARY KEY (goodReportID ),
  CONSTRAINT GoodsReport_MEMID_FK FOREIGN KEY(MEMID)REFERENCES MEMBER(MEMID),
  CONSTRAINT GoodsReport_goodId_FK FOREIGN KEY(goodId)REFERENCES Goods(goodId)
);
COMMENT ON COLUMN GoodsReport.goodReportStatus IS '0=待處理 , 1=通過, 2=不通過';

CREATE SEQUENCE GoodsReport_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

INSERT INTO GoodsReport VALUES (('GR'||LPAD(to_char(GoodsReport_seq.NEXTVAL), 5, '0')),'weshare01','GD00001','null','0');
INSERT INTO GoodsReport VALUES (('GR'||LPAD(to_char(GoodsReport_seq.NEXTVAL), 5, '0')),'weshare02','GD00003','null','1');
INSERT INTO GoodsReport VALUES (('GR'||LPAD(to_char(GoodsReport_seq.NEXTVAL), 5, '0')),'weshare03','GD00003','null','1');
INSERT INTO GoodsReport VALUES (('GR'||LPAD(to_char(GoodsReport_seq.NEXTVAL), 5, '0')),'weshare02','GD00002','null','2');

commit;