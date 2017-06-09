/*
SQLyog Enterprise Trial - MySQL GUI v7.11 
MySQL - 5.7.17-log : Database - dovasoft_usgfa
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`dovasoft_usgfa` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `dovasoft_usgfa`;

/*Table structure for table `bloodgroups` */

DROP TABLE IF EXISTS `bloodgroups`;

CREATE TABLE `bloodgroups` (
  `GroupName` varchar(50) DEFAULT NULL,
  `GroupId` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bloodgroups` */

insert  into `bloodgroups`(`GroupName`,`GroupId`) values ('A+','BG1'),('B+','BG2'),('AB+','BG3');

/*Table structure for table `contactus` */

DROP TABLE IF EXISTS `contactus`;

CREATE TABLE `contactus` (
  `contactId` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varbinary(50) DEFAULT NULL,
  `subject` varchar(250) DEFAULT NULL,
  `message` varchar(250) DEFAULT NULL,
  `updatedOn` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `contactus` */

insert  into `contactus`(`contactId`,`name`,`email`,`subject`,`message`,`updatedOn`) values ('dce5dad7be4d4a769828e739666623ac','a','aa','aaa','aaaa','09-05-2017'),('250d95dbf0e84d03bd6dcc815d38c1a0','b','bb','bbb','bbbb','09-05-2017'),('7c4804476673423abc52f6da336a95e4','medasani purushotham','medasanipurushotham@gmail.com','usgfa','about usgfa','10-05-2017'),('644086ad7db94b7baca5570cecc2fa27','medasani purushotham','medasanipurushotham@gmail.com','usgfa','about usgfa','10-05-2017'),('0a17e3727c2640a6995e7590eef3e914','medasani 123','medasanipurushotham@gmail.com','usgfa123','about usgfa123','10-05-2017'),('fd69c3f843cd4c45b65be71c42a9235f','medasani111','medasanipurushotham@gmail.com','usgfa111','about usgfa 111','10-05-2017');

/*Table structure for table `event` */

DROP TABLE IF EXISTS `event`;

CREATE TABLE `event` (
  `eventId` varchar(50) CHARACTER SET latin1 NOT NULL,
  `eventName` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `noOfDays` varchar(5) CHARACTER SET latin1 DEFAULT NULL,
  `timeFrom` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `timeEnd` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `address` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `place` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `mandal` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `district` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `state` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `landMark` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `pinCode` varchar(6) CHARACTER SET latin1 DEFAULT NULL,
  `moreInfo` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `updatedBy` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `updatedOn` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`eventId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `event` */

insert  into `event`(`eventId`,`eventName`,`noOfDays`,`timeFrom`,`timeEnd`,`address`,`place`,`mandal`,`district`,`state`,`landMark`,`pinCode`,`moreInfo`,`updatedBy`,`updatedOn`) values ('eeca7ce206664d839317bcc86fcde67e','event name','12','23/06/2017 12:00 AM','24/06/2017 12:00 AM','address','place','mandal','district','Telangana','land mark','121212','more info						','bf7163da4f3f4e69b3658742afa36447','09-06-2017');

/*Table structure for table `eventfile` */

DROP TABLE IF EXISTS `eventfile`;

CREATE TABLE `eventfile` (
  `eventId` varchar(50) DEFAULT NULL,
  `fileId` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `eventfile` */

insert  into `eventfile`(`eventId`,`fileId`) values ('eeca7ce206664d839317bcc86fcde67e','d6c64559-dcf5-480e-a644-a2d1cdb5c1a8');

/*Table structure for table `eventguest` */

DROP TABLE IF EXISTS `eventguest`;

CREATE TABLE `eventguest` (
  `eventId` varchar(50) DEFAULT NULL,
  `guestId` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `eventguest` */

insert  into `eventguest`(`eventId`,`guestId`) values ('eeca7ce206664d839317bcc86fcde67e','dbb2ae957188449ba5354470cbb1bc35');

/*Table structure for table `farm` */

DROP TABLE IF EXISTS `farm`;

CREATE TABLE `farm` (
  `farmId` varchar(50) DEFAULT NULL,
  `farmName` varchar(30) DEFAULT NULL,
  `farmPlace` varchar(30) DEFAULT NULL,
  `farmAddress` varchar(250) DEFAULT NULL,
  `farmMandal` varchar(30) DEFAULT NULL,
  `farmDistrict` varchar(30) DEFAULT NULL,
  `aboutFarm` varchar(250) DEFAULT NULL,
  `farmState` varchar(30) DEFAULT NULL,
  `farmPincode` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `farm` */

insert  into `farm`(`farmId`,`farmName`,`farmPlace`,`farmAddress`,`farmMandal`,`farmDistrict`,`aboutFarm`,`farmState`,`farmPincode`) values ('c86f7dcdd94f452baaa4e63fdaf4b4f8','farm name','farm place','farm address','mandal','district','about farm','Telangana','121212');

/*Table structure for table `farmfile` */

DROP TABLE IF EXISTS `farmfile`;

CREATE TABLE `farmfile` (
  `farmId` varchar(50) DEFAULT NULL,
  `fileId` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `farmfile` */

/*Table structure for table `guest` */

DROP TABLE IF EXISTS `guest`;

CREATE TABLE `guest` (
  `guestId` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `designation` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `guest` */

insert  into `guest`(`guestId`,`title`,`name`,`designation`) values ('dbb2ae957188449ba5354470cbb1bc35','Mr','medasani ','b tech');

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `memberId` varchar(50) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `firstName` varchar(30) DEFAULT NULL,
  `middleName` varchar(30) DEFAULT NULL,
  `lastName` varchar(30) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `email` varbinary(50) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `place` varchar(30) DEFAULT NULL,
  `mandal` varchar(30) DEFAULT NULL,
  `district` varchar(30) DEFAULT NULL,
  `state` varchar(30) DEFAULT NULL,
  `pincode` varchar(6) DEFAULT NULL,
  `profession` varchar(30) DEFAULT NULL,
  `updatedBy` varchar(50) DEFAULT NULL,
  `updatedOn` varchar(30) DEFAULT NULL,
  `haveFarm` varchar(10) DEFAULT NULL,
  `memberType` varchar(30) DEFAULT NULL,
  `amountPaid` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `member` */

insert  into `member`(`memberId`,`title`,`firstName`,`middleName`,`lastName`,`mobile`,`email`,`address`,`place`,`mandal`,`district`,`state`,`pincode`,`profession`,`updatedBy`,`updatedOn`,`haveFarm`,`memberType`,`amountPaid`,`password`) values ('bf7163da4f3f4e69b3658742afa36447','Mr','medsani','purushotham','last name','9986626618','medasanipurushotham@gmail.com','address','place','mandal','district','Telangana','121212','Doctor','','09-06-2017','yes','Admin','15,000.00','4633');

/*Table structure for table `memberfarm` */

DROP TABLE IF EXISTS `memberfarm`;

CREATE TABLE `memberfarm` (
  `memberId` varchar(50) DEFAULT NULL,
  `farmId` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `memberfarm` */

insert  into `memberfarm`(`memberId`,`farmId`) values ('bf7163da4f3f4e69b3658742afa36447','c86f7dcdd94f452baaa4e63fdaf4b4f8');

/*Table structure for table `memberfile` */

DROP TABLE IF EXISTS `memberfile`;

CREATE TABLE `memberfile` (
  `memberId` varchar(50) DEFAULT NULL,
  `fileId` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `memberfile` */

insert  into `memberfile`(`memberId`,`fileId`) values ('bf7163da4f3f4e69b3658742afa36447','95d8c095-9111-410f-a534-99f1445681e8');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `newsId` varchar(50) DEFAULT NULL,
  `newsTitle` varchar(30) DEFAULT NULL,
  `date` varchar(30) DEFAULT NULL,
  `paper` varchar(30) DEFAULT NULL,
  `link` varchar(30) DEFAULT NULL,
  `moreInfo` varchar(250) DEFAULT NULL,
  `updatedBy` varchar(50) DEFAULT NULL,
  `updatedOn` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `news` */

insert  into `news`(`newsId`,`newsTitle`,`date`,`paper`,`link`,`moreInfo`,`updatedBy`,`updatedOn`) values ('df4ff39d09054ebc9ff5c7bbf09a35bf','name Tilte','23/06/2017','paper','link','more info','bf7163da4f3f4e69b3658742afa36447','09-06-2017');

/*Table structure for table `newsfile` */

DROP TABLE IF EXISTS `newsfile`;

CREATE TABLE `newsfile` (
  `newsId` varchar(50) DEFAULT NULL,
  `fileId` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `newsfile` */

insert  into `newsfile`(`newsId`,`fileId`) values ('df4ff39d09054ebc9ff5c7bbf09a35bf','eee1ed04-3e36-4dab-87e2-42596f1e723c');

/*Table structure for table `program` */

DROP TABLE IF EXISTS `program`;

CREATE TABLE `program` (
  `programId` varchar(50) DEFAULT NULL,
  `programName` varchar(30) DEFAULT NULL,
  `duration` varchar(30) DEFAULT NULL,
  `dateAndTimeFrom` varchar(30) DEFAULT NULL,
  `dateAndTimeTo` varchar(30) DEFAULT NULL,
  `channel` varchar(30) DEFAULT NULL,
  `guest` varchar(30) DEFAULT NULL,
  `youtube` varchar(30) DEFAULT NULL,
  `moreInfo` varchar(250) DEFAULT NULL,
  `updatedBy` varchar(50) DEFAULT NULL,
  `updatedOn` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `program` */

insert  into `program`(`programId`,`programName`,`duration`,`dateAndTimeFrom`,`dateAndTimeTo`,`channel`,`guest`,`youtube`,`moreInfo`,`updatedBy`,`updatedOn`) values ('dbf2c19588a94578910131a56b4d832e','program Name','12','23/06/2017 12:00 AM','30/06/2017 12:00 AM','channel','guest','youtube','more info','bf7163da4f3f4e69b3658742afa36447','09-06-2017');

/*Table structure for table `programfile` */

DROP TABLE IF EXISTS `programfile`;

CREATE TABLE `programfile` (
  `programId` varchar(50) DEFAULT NULL,
  `fileId` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `programfile` */

insert  into `programfile`(`programId`,`fileId`) values ('dbf2c19588a94578910131a56b4d832e','b758edb4-efb6-448d-948d-bef4384a47ca');

/*Table structure for table `skillsets` */

DROP TABLE IF EXISTS `skillsets`;

CREATE TABLE `skillsets` (
  `SkillName` varchar(50) DEFAULT NULL,
  `SkillId` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `skillsets` */

insert  into `skillsets`(`SkillName`,`SkillId`) values ('java','SK1'),('.net','SK2'),('oracle','Sk3'),(NULL,NULL);

/*Table structure for table `stories` */

DROP TABLE IF EXISTS `stories`;

CREATE TABLE `stories` (
  `storiesId` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `profession` varchar(30) DEFAULT NULL,
  `farmName` varchar(30) DEFAULT NULL,
  `farmAddress` varchar(250) DEFAULT NULL,
  `place` varchar(30) DEFAULT NULL,
  `mandal` varchar(30) DEFAULT NULL,
  `district` varchar(30) DEFAULT NULL,
  `farmState` varchar(30) DEFAULT NULL,
  `farmPinCode` varchar(6) DEFAULT NULL,
  `aboutFarm` varchar(250) DEFAULT NULL,
  `updatedBy` varchar(50) DEFAULT NULL,
  `updatedOn` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `stories` */

insert  into `stories`(`storiesId`,`title`,`name`,`profession`,`farmName`,`farmAddress`,`place`,`mandal`,`district`,`farmState`,`farmPinCode`,`aboutFarm`,`updatedBy`,`updatedOn`) values ('76a9b620b3734a5982dc9caf493264f0','Mr','name','profession','farm name','farm address','farm place','mandal','district','Telangana','121212','about farm','bf7163da4f3f4e69b3658742afa36447','09-06-2017');

/*Table structure for table `storiesfile` */

DROP TABLE IF EXISTS `storiesfile`;

CREATE TABLE `storiesfile` (
  `storiesId` varchar(50) DEFAULT NULL,
  `fileId` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `storiesfile` */

insert  into `storiesfile`(`storiesId`,`fileId`) values ('76a9b620b3734a5982dc9caf493264f0','19526356-d468-4bde-a970-12c1e0fc3f40');

/*Table structure for table `uploadfile` */

DROP TABLE IF EXISTS `uploadfile`;

CREATE TABLE `uploadfile` (
  `fileId` varchar(50) DEFAULT NULL,
  `filePath` varchar(100) DEFAULT NULL,
  `showPublic` varchar(50) DEFAULT NULL,
  `updatedBy` varchar(50) DEFAULT NULL,
  `updatedOn` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `uploadfile` */

insert  into `uploadfile`(`fileId`,`filePath`,`showPublic`,`updatedBy`,`updatedOn`) values ('95d8c095-9111-410f-a534-99f1445681e8','images/uploads/95d8c095-9111-410f-a534-99f1445681e8.jpg','0',NULL,'09-06-2017'),('d6c64559-dcf5-480e-a644-a2d1cdb5c1a8','images/uploads/d6c64559-dcf5-480e-a644-a2d1cdb5c1a8.jpg','0',NULL,'09-06-2017'),('b758edb4-efb6-448d-948d-bef4384a47ca','images/uploads/b758edb4-efb6-448d-948d-bef4384a47ca.jpg','0',NULL,'09-06-2017'),('eee1ed04-3e36-4dab-87e2-42596f1e723c','images/uploads/eee1ed04-3e36-4dab-87e2-42596f1e723c.jpeg','0',NULL,'09-06-2017'),('19526356-d468-4bde-a970-12c1e0fc3f40','images/uploads/19526356-d468-4bde-a970-12c1e0fc3f40.jpg','0',NULL,'09-06-2017');

/*Table structure for table `userinfo` */

DROP TABLE IF EXISTS `userinfo`;

CREATE TABLE `userinfo` (
  `EmpId` varchar(50) DEFAULT NULL,
  `EmpName` varchar(50) DEFAULT NULL,
  `EmpGender` varchar(10) DEFAULT NULL,
  `EmpGroupId` varchar(50) DEFAULT NULL,
  `EmpAddress` varchar(250) DEFAULT NULL,
  `EmpPhotoPath` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `userinfo` */

/*Table structure for table `userskills` */

DROP TABLE IF EXISTS `userskills`;

CREATE TABLE `userskills` (
  `SkillId` varchar(50) DEFAULT NULL,
  `EmpId` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `userskills` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
