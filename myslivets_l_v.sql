USE [master]
GO
/****** Object:  Database [sample_myslivets_l_v]    Script Date: 04.03.2023 11:43:04 ******/
CREATE DATABASE [sample_myslivets_l_v]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'sample_myslivets_l_v', FILENAME = N'D:\SQLData\sample_myslivets_l_v.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'sample_myslivets_l_v_log', FILENAME = N'D:\SQLData\sample_myslivets_l_v_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [sample_myslivets_l_v] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [sample_myslivets_l_v].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [sample_myslivets_l_v] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [sample_myslivets_l_v] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [sample_myslivets_l_v] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [sample_myslivets_l_v] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [sample_myslivets_l_v] SET ARITHABORT OFF 
GO
ALTER DATABASE [sample_myslivets_l_v] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [sample_myslivets_l_v] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [sample_myslivets_l_v] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [sample_myslivets_l_v] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [sample_myslivets_l_v] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [sample_myslivets_l_v] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [sample_myslivets_l_v] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [sample_myslivets_l_v] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [sample_myslivets_l_v] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [sample_myslivets_l_v] SET  DISABLE_BROKER 
GO
ALTER DATABASE [sample_myslivets_l_v] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [sample_myslivets_l_v] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [sample_myslivets_l_v] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [sample_myslivets_l_v] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [sample_myslivets_l_v] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [sample_myslivets_l_v] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [sample_myslivets_l_v] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [sample_myslivets_l_v] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [sample_myslivets_l_v] SET  MULTI_USER 
GO
ALTER DATABASE [sample_myslivets_l_v] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [sample_myslivets_l_v] SET DB_CHAINING OFF 
GO
ALTER DATABASE [sample_myslivets_l_v] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [sample_myslivets_l_v] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [sample_myslivets_l_v] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [sample_myslivets_l_v] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [sample_myslivets_l_v] SET QUERY_STORE = OFF
GO
USE [sample_myslivets_l_v]
GO
/****** Object:  Table [dbo].[department]    Script Date: 04.03.2023 11:43:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[department](
	[dept_no] [char](4) NOT NULL,
	[dept_name] [char](25) NOT NULL,
	[location] [char](30) NULL,
 CONSTRAINT [prim_dept] PRIMARY KEY CLUSTERED 
(
	[dept_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee]    Script Date: 04.03.2023 11:43:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee](
	[emp_no] [int] NOT NULL,
	[emp_fname] [char](20) NOT NULL,
	[emp_lname] [char](20) NOT NULL,
	[dept_no] [char](4) NULL,
 CONSTRAINT [prim_emp] PRIMARY KEY CLUSTERED 
(
	[emp_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[project]    Script Date: 04.03.2023 11:43:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[project](
	[project_no] [char](4) NOT NULL,
	[project_name] [char](15) NOT NULL,
	[budget] [float] NULL,
 CONSTRAINT [prim_proj] PRIMARY KEY CLUSTERED 
(
	[project_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[works_on]    Script Date: 04.03.2023 11:43:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[works_on](
	[emp_no] [int] NOT NULL,
	[project_no] [char](4) NOT NULL,
	[job] [char](15) NULL,
	[enter_date] [date] NULL,
 CONSTRAINT [prim_works] PRIMARY KEY CLUSTERED 
(
	[emp_no] ASC,
	[project_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[employee]  WITH CHECK ADD  CONSTRAINT [foreign_emp] FOREIGN KEY([dept_no])
REFERENCES [dbo].[department] ([dept_no])
GO
ALTER TABLE [dbo].[employee] CHECK CONSTRAINT [foreign_emp]
GO
ALTER TABLE [dbo].[works_on]  WITH CHECK ADD  CONSTRAINT [foreign1_works] FOREIGN KEY([emp_no])
REFERENCES [dbo].[employee] ([emp_no])
GO
ALTER TABLE [dbo].[works_on] CHECK CONSTRAINT [foreign1_works]
GO
ALTER TABLE [dbo].[works_on]  WITH CHECK ADD  CONSTRAINT [foreign2_works] FOREIGN KEY([project_no])
REFERENCES [dbo].[project] ([project_no])
GO
ALTER TABLE [dbo].[works_on] CHECK CONSTRAINT [foreign2_works]
GO
USE [master]
GO
ALTER DATABASE [sample_myslivets_l_v] SET  READ_WRITE 
GO
