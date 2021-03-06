USE [master]
GO
/****** Object:  Database [db_celu]    Script Date: 11/07/2010 16:00:18 ******/
CREATE DATABASE [db_celu] ON  PRIMARY 
( NAME = N'db_celu', FILENAME = N'c:\Arquivos de programas\Microsoft SQL Server\MSSQL.1\MSSQL\DATA\db_celu.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'db_celu_log', FILENAME = N'c:\Arquivos de programas\Microsoft SQL Server\MSSQL.1\MSSQL\DATA\db_celu_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 COLLATE Latin1_General_CI_AS
GO
EXEC dbo.sp_dbcmptlevel @dbname=N'db_celu', @new_cmptlevel=90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_celu].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_celu] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_celu] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_celu] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_celu] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_celu] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_celu] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_celu] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [db_celu] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_celu] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_celu] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_celu] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_celu] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_celu] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_celu] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_celu] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_celu] SET  ENABLE_BROKER 
GO
ALTER DATABASE [db_celu] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_celu] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_celu] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_celu] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_celu] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_celu] SET  READ_WRITE 
GO
ALTER DATABASE [db_celu] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [db_celu] SET  MULTI_USER 
GO
ALTER DATABASE [db_celu] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_celu] SET DB_CHAINING OFF 