
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------

-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `gerenciarfila` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `gerenciarfila` ;

-- -----------------------------------------------------
-- Table `servicedesk`.`FILA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gerenciarfila`.`SENHA` (
  `ID_SENHA` INT NOT NULL AUTO_INCREMENT,
  `senha` int(40) not null,
  `datahoraInicio` DATETIME NULL,
  `datahoraFim` DATETIME,  
  PRIMARY KEY (`ID_SENHA`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `servicedesk`.`CHAMADO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gerenciarfila`.`SERVICO` (
  `ID_SERVICO` INT NOT NULL AUTO_INCREMENT,
  `TIPO` VARCHAR (80) NOT Null,
  `STATUS` VARCHAR(100) NOT NULL,
  `DESCRICSO` VARCHAR(10) NOT NULL,
  `ID_SENHA`int,
   PRIMARY KEY (`ID_SERVICO`),
  INDEX `fk_SERVICO_SENHA_idx` (`ID_SENHA` ASC),
  CONSTRAINT `fk_SERVICO_SENHA`
    FOREIGN KEY (`ID_SENHA`) REFERENCES `gerenciarfila`.`SENHA` (`ID_SENHA`)  ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SELECT * FROM SENHA;
SELECT * FROM SERVICO;


Insert into SENHA values (null,'23546','2012-05-28',NULL);
Insert into SENHA values (null,'2342','2012-05-28 12:12:11',NULL);
Insert into SENHA values (null,'3456','2018-04-09  15:10:10',NULL);
Insert into SENHA values (null,'987654','2018-04-08 16:10:10',NULL);
Insert into SENHA values (null,'123456','2018-04-06 12:10:10','2018-04-06 14:10:10');
Insert into SENHA values (null,'12345','2018-04-05 13:40:11','2018-04-05 14:50:10');


insert into SERVICO values (null,'Registrar firma','EM ANDAMENTO','PRIORIDADE',1);
insert into SERVICO values (null,'Certidão de Casamento','Concluido','PRIORIDADE',7);
insert into SERVICO values (null,'Autenticar documento','Concluido','PRIORIDADE',7);
insert into SERVICO values (null,'Autenticar documento','EM ANDAMENTO','PRIORIDADE',1);
insert into SERVICO values (null,'Autenticar documento','EM ANDAMENTO','PRIORIDADE',1);


select * from SENHA;
select s.id_SENHA,s.datahoraInicio,s.datahoraFim, e.TIPO, e.STATUS from senha s inner join servico e on e.tipo = 'Autenticar documento';
select s.id_SENHA,s.datahoraInicio,s.datahoraFim, e.TIPO, e.STATUS from senha s inner join servico e on s.senha = '123456';
select s.id_SENHA,s.datahoraInicio,s.datahoraFim, e.TIPO, e.STATUS from senha s inner join servico e on s.datahoraInicio between '2018/04/06' and '2018/04/08';
select * from senha where datahoraInicio between '2018/04/06' and '2018/04/08';