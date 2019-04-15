--WeShare SQL 指令表 2019/04/11--版本4 會員銀行帳號 CAN NULL 
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

--管理員ok--

CREATE TABLE Administrator (
admId            VARCHAR2(10) NOT NULL,
admPsw           VARCHAR2(10) NOT NULL,
admStatus        NUMBER(1) NOT NULL,
CONSTRAINT admId_PRIMARY_KEY PRIMARY KEY (admId));

COMMENT ON COLUMN Administrator.admStatus IS '0=在職,1=離職';

INSERT INTO Administrator VALUES ('root','root','0');
INSERT INTO Administrator VALUES ('founder','founder','1');

--課程大類ok--

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

--課程種類ok--

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
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'03','吉他');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'02','英文');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'02','中文');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'08','Java');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'08','Andriod');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'08','SQL');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'12','甜品');
INSERT INTO Course VALUES (LPAD(Course_seq.NEXTVAL,4,'0'),'12','烘焙');

--會員ok(做BLOB指令)--

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

INSERT INTO MEMBER VALUES ('weshare01', '0005', '0008', NULL, 'S143766692', '123456', '123456', 'AKA Ren', '0', empty_blob(), 'n1036434@ntub.edu.tw', '0912344580', TO_DATE('1995-11-23', 'YYYY-MM-DD'), '桃園市中壢區中大路300號 2,3,15樓', 'Java是簡單的', '004116004056492', '35000', '20000', '1');
INSERT INTO MEMBER VALUES ('weshare02', '0008', '0005', NULL,'Q252488683', '123456', '123456', '蓋兒·加朵', '1', empty_blob(), 'yinren1123@gmail.com', '0954446347', TO_DATE('1985-04-30', 'YYYY-MM-DD'), '台北市信義區信義路四段415號6樓', '我是神力女超人', '00731350235011', '80000', '0', '1');
INSERT INTO MEMBER VALUES ('weshare03', '0004', '0009', NULL,'B287381891', '123456', '123456', '艾瑪·華森', '1', empty_blob(), 'EmmaWatson@gmail.com', '0958403685', TO_DATE('1989-06-15', 'YYYY-MM-DD'), '台北市松山區八德路四段520號', '你們這群麻瓜', '08545080687111', '60000', '0', '1');
INSERT INTO MEMBER VALUES ('weshare04', '0006', '0005', NULL,'A167464958', '123456', '123456', '哈利·波特', '0', empty_blob(), 'HarryPotter@gmail.com', '0978254078', TO_DATE('1987-07-12', 'YYYY-MM-DD'), '台北市大安區復興南路一段390號', '我是頭上有閃電', '80885744387461', '20000', '0', '1');

--老師ok(做BLOB指令)--

CREATE TABLE Teacher (
teacherId       VARCHAR2(7) NOT NULL,
memId           VARCHAR2(20) NOT NULL, 
teacherStatus   NUMBER(1) NOT NULL,
teacherCity     VARCHAR2(100) NOT NULL,
teacherEDU      VARCHAR2(50) NOT NULL,
idCardImg       BLOB,
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

INSERT INTO Teacher VALUES (('TC'||LPAD(to_char(Teacher_seq.NEXTVAL), 5, '0')),'weshare01','1','新北市板橋區','國立臺北商業大學資管系',empty_blob(),empty_blob(),'我是超棒的老師');
INSERT INTO Teacher VALUES (('TC'||LPAD(to_char(Teacher_seq.NEXTVAL), 5, '0')),'weshare02','1','桃園市中壢區','國立中央大學‎資訊工程學系',empty_blob(),empty_blob(),'我是超美的女超人');

--課程ok--

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
Insert into INSCOURSE values (('IC'||LPAD(to_char(InsCourse_seq.NEXTVAL), 5, '0')),'TC00002','0008','台北市信義區','1','4','英文','500','製作抹茶奶凍捲,學習重點 - 難度較高、舒芙蕾般軟嫩的蛋糕體學習 - 抹茶甘納許的製作 - 日式口味的紅豆奶油餡','0');

--課程時間ok--

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

Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00001',TO_DATE('2019-04-20 11:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-04-20 12:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00001',TO_DATE('2019-04-20 13:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-04-20 15:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00001',TO_DATE('2019-04-20 15:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-04-20 17:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00001',TO_DATE('2019-04-20 17:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-04-20 18:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00002',TO_DATE('2019-04-22 11:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-04-22 13:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00002',TO_DATE('2019-04-22 13:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-04-22 15:00', 'YYYY-MM-DD HH24:MI'));
Insert into InsCourseTime values (('TT'||LPAD(to_char(InsCourseTime_seq.NEXTVAL), 5, '0')),'IC00002',TO_DATE('2019-04-22 15:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-04-22 18:00', 'YYYY-MM-DD HH24:MI'));




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


--課程收藏ok--

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

--折價券資訊ok--

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

--會員折價券ok--

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

--廣告ok--

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

--揪團(等奕哥版)--

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
Insert INTO TEAM VALUES (('TM'||LPAD(to_char(Team_seq.NEXTVAL), 5, '0')),'weshare01','IC00001',TO_DATE('2019-03-22 14:49:42', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2019-03-23 14:49:42', 'YYYY-MM-DD HH24:MI:SS'),1);
Insert INTO TEAM VALUES (('TM'||LPAD(to_char(Team_seq.NEXTVAL), 5, '0')),'weshare02','IC00002',TO_DATE('2019-04-22 14:49:42', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2019-05-23 14:49:42', 'YYYY-MM-DD HH24:MI:SS'),1);
Insert INTO TEAM VALUES (('TM'||LPAD(to_char(Team_seq.NEXTVAL), 5, '0')),'weshare03','IC00001',TO_DATE('2019-04-25 14:49:42', 'YYYY-MM-DD HH24:MI:SS'),TO_DATE('2019-05-26 14:49:42', 'YYYY-MM-DD HH24:MI:SS'),1);

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

Insert into CourseReservation values ('CR'||LPAD(to_char(CourseReservation_seq.NEXTVAL),5,'0'),'TC00001','weshare03','IC00001',null,'1','0','2',TO_DATE('2019-03-22 14:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-03-22 16:00', 'YYYY-MM-DD HH24:MI'),'台北市信義區','2','600',null,null);
Insert into CourseReservation values ('CR'||LPAD(to_char(CourseReservation_seq.NEXTVAL),5,'0'),'TC00001','weshare04','IC00001',null,'1','0','0',TO_DATE('2019-03-22 14:00', 'YYYY-MM-DD HH24:MI'),TO_DATE('2019-03-22 16:00', 'YYYY-MM-DD HH24:MI'),'台北市信義區','2','600',null,null);

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

INSERT INTO LiveStream VALUES('LV'||LPAD(to_char(LiveStream_seq.NEXTVAL),5,'0'),'TC00001',TO_DATE('2019-03-22 14:49:42', 'YYYY-MM-DD HH24:MI:SS'),'1000',empty_blob());

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
Insert into JOINGROUP values ('weshare02','TM00002');
Insert into JOINGROUP values ('weshare03','TM00003');
Insert into JOINGROUP values ('weshare04','TM00004');

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

Insert into SCORPIONCHATRECORD values (('SC'||LPAD(to_char(SCORPIONCHATRECORD_SEQ.NEXTVAL), 5, '0')),'TM00001',null);
Insert into SCORPIONCHATRECORD values (('SC'||LPAD(to_char(SCORPIONCHATRECORD_seq.NEXTVAL), 5, '0')),'TM00002',null);
Insert into SCORPIONCHATRECORD values (('SC'||LPAD(to_char(SCORPIONCHATRECORD_seq.NEXTVAL), 5, '0')),'TM00003',null);

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

INSERT INTO Goods VALUES (('GD'||LPAD(to_char(Goods_seq.NEXTVAL), 5, '0')),'TC00001','吳永志','8888',NULL,NULL,'1');
INSERT INTO Goods VALUES (('GD'||LPAD(to_char(Goods_seq.NEXTVAL), 5, '0')),'TC00002','David吳','6666',NULL,NULL,'1');
INSERT INTO Goods VALUES (('GD'||LPAD(to_char(Goods_seq.NEXTVAL), 5, '0')),'TC00002','SeaFood','7777',NULL,NULL,'1');
INSERT INTO Goods VALUES (('GD'||LPAD(to_char(Goods_seq.NEXTVAL), 5, '0')),'TC00002','大衛海鮮','9999',NULL,NULL,'1');
INSERT INTO Goods VALUES (('GD'||LPAD(to_char(Goods_seq.NEXTVAL), 5, '0')),'TC00001','Peter吳','5555',NULL,NULL,'1');

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

INSERT INTO GoodsOrder VALUES (('GO'||LPAD(to_char(GoodsOrder_seq.NEXTVAL), 5, '0')),'weshare01','3078',TO_DATE('1955-09-09','YYYY-MM-DD'),'米其林','新北市板橋區','0966199890','1');
INSERT INTO GoodsOrder VALUES (('GO'||LPAD(to_char(GoodsOrder_seq.NEXTVAL), 5, '0')),'weshare02','9999',TO_DATE('1991-08-03','YYYY-MM-DD'),'游宗叡','新北市瑞芳區','0936167890','1');
INSERT INTO GoodsOrder VALUES (('GO'||LPAD(to_char(GoodsOrder_seq.NEXTVAL), 5, '0')),'weshare03','1314',TO_DATE('1970-01-01','YYYY-MM-DD'),'皮卡丘','新北市鶯歌區','0916167550','0');
INSERT INTO GoodsOrder VALUES (('GO'||LPAD(to_char(GoodsOrder_seq.NEXTVAL), 5, '0')),'weshare04','5828',TO_DATE('1911-02-21','YYYY-MM-DD'),'唐老鴨','新北市三峽區','0956115810','0');

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

INSERT INTO GoodsDetails VALUES ('GO00001','GD00003','99','4',null);
INSERT INTO GoodsDetails VALUES ('GO00002','GD00002','21','5',null);
INSERT INTO GoodsDetails VALUES ('GO00003','GD00005','33','4.6',null);
INSERT INTO GoodsDetails VALUES ('GO00004','GD00001','6','3.8',null);

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


COMMIT;