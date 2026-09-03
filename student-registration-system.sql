-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 03, 2026 at 08:42 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `student-registration-system`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_years`
--

CREATE TABLE `academic_years` (
  `academic_year_id` bigint(20) UNSIGNED NOT NULL,
  `year_name` varchar(20) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` enum('UPCOMING','ACTIVE','COMPLETED','CANCELLED') NOT NULL DEFAULT 'UPCOMING',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ;

--
-- Dumping data for table `academic_years`
--

INSERT INTO `academic_years` (`academic_year_id`, `year_name`, `start_date`, `end_date`, `status`, `created_at`, `updated_at`) VALUES
(1, '2025/2026', '2025-08-01', '2026-07-31', 'COMPLETED', '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(2, '2026/2027', '2026-08-01', '2027-07-31', 'ACTIVE', '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(3, '2027/2028', '2027-08-01', '2028-07-31', 'UPCOMING', '2026-09-03 16:04:14', '2026-09-03 16:04:14');

-- --------------------------------------------------------

--
-- Stand-in structure for view `available_courses`
-- (See below for the actual view)
--
CREATE TABLE `available_courses` (
`offering_id` bigint(20) unsigned
,`course_id` bigint(20) unsigned
,`course_code` varchar(30)
,`course_name` varchar(200)
,`credit_units` decimal(4,1)
,`course_type` enum('CORE','ELECTIVE','OPTIONAL')
,`program_code` varchar(30)
,`program_name` varchar(200)
,`academic_level` tinyint(3) unsigned
,`semester_id` bigint(20) unsigned
,`semester_name` varchar(50)
,`academic_year_id` bigint(20) unsigned
,`year_name` varchar(20)
,`capacity` int(10) unsigned
,`status` enum('ACTIVE','INACTIVE','FULL','CANCELLED')
);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `course_code` varchar(30) NOT NULL,
  `course_name` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `credit_units` decimal(4,1) NOT NULL DEFAULT 3.0,
  `course_type` enum('CORE','ELECTIVE','OPTIONAL') NOT NULL DEFAULT 'CORE',
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `academic_level` tinyint(3) UNSIGNED NOT NULL,
  `status` enum('ACTIVE','INACTIVE') NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_code`, `course_name`, `description`, `credit_units`, `course_type`, `department_id`, `academic_level`, `status`, `created_at`, `updated_at`) VALUES
(1, 'BIT1101', 'Introduction to Information Technology', 'Introduction to computing and information technology.', 3.0, 'CORE', 11, 1, 'ACTIVE', '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(2, 'BIT1102', 'Computer Applications', 'Basic computer applications and productivity tools.', 3.0, 'CORE', 11, 1, 'ACTIVE', '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(3, 'BIT1103', 'Programming Fundamentals', 'Introduction to programming concepts and problem solving.', 4.0, 'CORE', 11, 1, 'ACTIVE', '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(4, 'BIT2101', 'Database Systems', 'Database design, SQL and database management.', 3.0, 'CORE', 11, 2, 'ACTIVE', '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(5, 'BIT2102', 'Computer Networks', 'Computer networking concepts, protocols and network administration.', 3.0, 'CORE', 11, 2, 'ACTIVE', '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(6, 'BIT2103', 'Web Development', 'Web technologies and web application development.', 3.0, 'CORE', 11, 2, 'ACTIVE', '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(7, 'BIT3101', 'Systems Analysis and Design', 'Analysis, design and development of information systems.', 3.0, 'CORE', 11, 3, 'ACTIVE', '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(8, 'BIT3102', 'Cybersecurity Fundamentals', 'Fundamental concepts in information and network security.', 3.0, 'CORE', 11, 3, 'ACTIVE', '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(9, 'BIT4101', 'Information Technology Project', 'Final-year information technology project.', 6.0, 'CORE', 11, 4, 'ACTIVE', '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(10, 'CSC1101', 'Introduction to Computer Science', 'Introduction to computer science and computational thinking.', 3.0, 'CORE', 11, 1, 'ACTIVE', '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(11, 'CSC2101', 'Data Structures and Algorithms', 'Data structures, algorithms and algorithmic problem solving.', 4.0, 'CORE', 11, 2, 'ACTIVE', '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(12, 'CSC3101', 'Operating Systems', 'Operating system concepts and management.', 3.0, 'CORE', 11, 3, 'ACTIVE', '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(13, 'BBA1101', 'Principles of Management', 'Introduction to management principles and practices.', 3.0, 'CORE', 13, 1, 'ACTIVE', '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(14, 'BBA1102', 'Principles of Accounting', 'Fundamental principles of accounting.', 3.0, 'CORE', 13, 1, 'ACTIVE', '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(15, 'BBA2101', 'Financial Management', 'Principles of financial management.', 3.0, 'CORE', 13, 2, 'ACTIVE', '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(16, 'BNS1101', 'Foundations of Nursing', 'Introduction to nursing practice and professional responsibilities.', 4.0, 'CORE', 6, 1, 'ACTIVE', '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(17, 'BNS1102', 'Human Anatomy and Physiology', 'Structure and function of the human body.', 4.0, 'CORE', 6, 1, 'ACTIVE', '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(18, 'BNS2101', 'Medical-Surgical Nursing', 'Principles of medical and surgical nursing.', 4.0, 'CORE', 6, 2, 'ACTIVE', '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(19, 'LLB1101', 'Introduction to Law', 'Introduction to legal systems and legal concepts.', 3.0, 'CORE', 16, 1, 'ACTIVE', '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(20, 'LLB1102', 'Constitutional Law', 'Fundamental principles of constitutional law.', 3.0, 'CORE', 16, 1, 'ACTIVE', '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(21, 'LLB2101', 'Law of Contract', 'Principles governing contractual relationships.', 3.0, 'CORE', 16, 2, 'ACTIVE', '2026-09-03 16:05:25', '2026-09-03 16:05:25');

-- --------------------------------------------------------

--
-- Table structure for table `course_offerings`
--

CREATE TABLE `course_offerings` (
  `offering_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `semester_id` bigint(20) UNSIGNED NOT NULL,
  `program_id` bigint(20) UNSIGNED DEFAULT NULL,
  `academic_level` tinyint(3) UNSIGNED NOT NULL,
  `lecturer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `capacity` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE','FULL','CANCELLED') NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ;

--
-- Dumping data for table `course_offerings`
--

INSERT INTO `course_offerings` (`offering_id`, `course_id`, `semester_id`, `program_id`, `academic_level`, `lecturer_id`, `capacity`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 7, 1, 4, 100, 'ACTIVE', '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(2, 2, 1, 7, 1, 5, 100, 'ACTIVE', '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(3, 3, 1, 7, 1, 6, 100, 'ACTIVE', '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(4, 10, 1, 8, 1, 4, 100, 'ACTIVE', '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(5, 13, 1, 9, 1, 7, 100, 'ACTIVE', '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(6, 14, 1, 9, 1, 8, 100, 'ACTIVE', '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(7, 16, 1, 5, 1, 7, 120, 'ACTIVE', '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(8, 17, 1, 5, 1, 8, 120, 'ACTIVE', '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(9, 19, 1, 12, 1, 7, 100, 'ACTIVE', '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(10, 20, 1, 12, 1, 8, 100, 'ACTIVE', '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(11, 4, 1, 7, 2, 4, 100, 'ACTIVE', '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(12, 5, 1, 7, 2, 5, 100, 'ACTIVE', '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(13, 6, 1, 7, 2, 6, 100, 'ACTIVE', '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(14, 11, 1, 8, 2, 6, 100, 'ACTIVE', '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(15, 15, 1, 9, 2, 7, 100, 'ACTIVE', '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(16, 18, 1, 5, 2, 8, 120, 'ACTIVE', '2026-09-03 16:05:25', '2026-09-03 16:05:25');

-- --------------------------------------------------------

--
-- Table structure for table `course_prerequisites`
--

CREATE TABLE `course_prerequisites` (
  `prerequisite_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `prerequisite_course_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ;

--
-- Dumping data for table `course_prerequisites`
--

INSERT INTO `course_prerequisites` (`prerequisite_id`, `course_id`, `prerequisite_course_id`, `created_at`) VALUES
(1, 4, 2, '2026-09-03 16:05:25'),
(2, 5, 1, '2026-09-03 16:05:25'),
(3, 6, 3, '2026-09-03 16:05:25'),
(4, 7, 4, '2026-09-03 16:05:25'),
(5, 8, 5, '2026-09-03 16:05:25'),
(6, 9, 7, '2026-09-03 16:05:25'),
(7, 11, 10, '2026-09-03 16:05:25'),
(8, 12, 11, '2026-09-03 16:05:25'),
(9, 15, 14, '2026-09-03 16:05:25'),
(10, 18, 16, '2026-09-03 16:05:25'),
(11, 21, 19, '2026-09-03 16:05:25');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `department_code` varchar(20) NOT NULL,
  `department_name` varchar(150) NOT NULL,
  `faculty_id` bigint(20) UNSIGNED NOT NULL,
  `description` text DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`department_id`, `department_code`, `department_name`, `faculty_id`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'MED', 'Department of Medicine', 1, 'Department responsible for medical training.', 'ACTIVE', '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(2, 'DEN', 'Department of Dentistry', 1, 'Department responsible for dental training.', 'ACTIVE', '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(3, 'LAB', 'Department of Medical Laboratory Science', 2, 'Medical laboratory science training.', 'ACTIVE', '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(4, 'PHYSIO', 'Department of Physiotherapy', 2, 'Physiotherapy education and training.', 'ACTIVE', '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(5, 'RAD', 'Department of Radiography', 2, 'Radiography and medical imaging education.', 'ACTIVE', '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(6, 'NURS', 'Department of Nursing', 3, 'Nursing education and professional practice.', 'ACTIVE', '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(7, 'BIO', 'Department of Biomedical Sciences', 4, 'Biomedical sciences education.', 'ACTIVE', '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(8, 'ANAT', 'Department of Anatomy', 4, 'Anatomical sciences education.', 'ACTIVE', '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(9, 'ENG', 'Department of Engineering', 5, 'Engineering education and applied technology.', 'ACTIVE', '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(10, 'APPSCI', 'Department of Applied Sciences', 5, 'Applied science education and research.', 'ACTIVE', '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(11, 'CS', 'Department of Computing', 7, 'Computing and information technology education.', 'ACTIVE', '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(12, 'SCI', 'Department of Science', 7, 'Science education and research.', 'ACTIVE', '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(13, 'BA', 'Department of Business Administration', 8, 'Business administration education.', 'ACTIVE', '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(14, 'PA', 'Department of Public Administration', 8, 'Public administration and management education.', 'ACTIVE', '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(15, 'EDU', 'Department of Education', 9, 'Teacher education and educational studies.', 'ACTIVE', '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(16, 'LAW', 'Department of Law', 10, 'Legal education and professional studies.', 'ACTIVE', '2026-09-03 16:04:14', '2026-09-03 16:04:14');

-- --------------------------------------------------------

--
-- Table structure for table `faculties`
--

CREATE TABLE `faculties` (
  `faculty_id` bigint(20) UNSIGNED NOT NULL,
  `faculty_code` varchar(20) NOT NULL,
  `faculty_name` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faculties`
--

INSERT INTO `faculties` (`faculty_id`, `faculty_code`, `faculty_name`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'FCMD', 'Faculty of Clinical Medicine and Dentistry', 'Clinical medicine and dentistry academic unit at Western Campus.', 'ACTIVE', '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(2, 'SAHS', 'School of Allied Health Sciences', 'Academic unit supporting allied health sciences programmes.', 'ACTIVE', '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(3, 'SONS', 'School of Nursing Sciences', 'Academic unit supporting nursing education and professional practice.', 'ACTIVE', '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(4, 'FBMS', 'Faculty of Biomedical Sciences', 'Academic unit supporting biomedical sciences education and research.', 'ACTIVE', '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(5, 'SEAS', 'School of Engineering and Applied Sciences', 'Academic unit supporting engineering and applied sciences programmes.', 'ACTIVE', '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(6, 'SOP', 'School of Pharmacy', 'Academic unit supporting pharmacy education and professional training.', 'ACTIVE', '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(7, 'FST', 'Faculty of Science and Technology', 'Academic unit supporting science and technology programmes.', 'ACTIVE', '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(8, 'FBM', 'Faculty of Business and Management', 'Academic unit supporting business, management and related programmes.', 'ACTIVE', '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(9, 'FED', 'Faculty of Education', 'Academic unit supporting teacher education and educational studies.', 'ACTIVE', '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(10, 'SOL', 'School of Law', 'Academic unit supporting legal education and related studies.', 'ACTIVE', '2026-09-03 16:04:14', '2026-09-03 16:04:14');

-- --------------------------------------------------------

--
-- Table structure for table `intakes`
--

CREATE TABLE `intakes` (
  `intake_id` bigint(20) UNSIGNED NOT NULL,
  `intake_code` varchar(10) NOT NULL,
  `intake_name` varchar(50) NOT NULL,
  `intake_month` tinyint(3) UNSIGNED NOT NULL,
  `academic_year_id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `next_student_number` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `status` enum('OPEN','CLOSED','UPCOMING','CANCELLED') NOT NULL DEFAULT 'UPCOMING',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ;

--
-- Dumping data for table `intakes`
--

INSERT INTO `intakes` (`intake_id`, `intake_code`, `intake_name`, `intake_month`, `academic_year_id`, `start_date`, `end_date`, `next_student_number`, `status`, `created_at`, `updated_at`) VALUES
(1, 'JAN', 'January Intake', 1, 2, '2026-01-01', '2026-03-31', 1, 'CLOSED', '2026-09-03 16:11:10', '2026-09-03 16:11:10'),
(2, 'APR', 'April Intake', 4, 2, '2026-04-01', '2026-07-31', 3, 'CLOSED', '2026-09-03 16:11:10', '2026-09-03 16:11:10'),
(3, 'AUG', 'August Intake', 8, 2, '2026-08-01', '2026-12-31', 7, 'OPEN', '2026-09-03 16:11:10', '2026-09-03 16:11:10');

-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

CREATE TABLE `programs` (
  `program_id` bigint(20) UNSIGNED NOT NULL,
  `program_code` varchar(30) NOT NULL,
  `program_name` varchar(200) NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `duration_years` decimal(3,1) NOT NULL DEFAULT 4.0,
  `description` text DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ;

--
-- Dumping data for table `programs`
--

INSERT INTO `programs` (`program_id`, `program_code`, `program_name`, `department_id`, `duration_years`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'MBBS', 'Bachelor of Medicine and Bachelor of Surgery', 1, 5.0, 'Undergraduate medical programme.', 'ACTIVE', '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(2, 'BDS', 'Bachelor of Dental Surgery', 2, 5.0, 'Undergraduate dental surgery programme.', 'ACTIVE', '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(3, 'BMLS', 'Bachelor of Medical Laboratory Science', 3, 4.0, 'Undergraduate medical laboratory science programme.', 'ACTIVE', '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(4, 'BPHYSIO', 'Bachelor of Physiotherapy', 4, 4.0, 'Undergraduate physiotherapy programme.', 'ACTIVE', '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(5, 'BNS', 'Bachelor of Nursing Sciences', 6, 4.0, 'Undergraduate nursing programme.', 'ACTIVE', '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(6, 'BPHARM', 'Bachelor of Pharmacy', 7, 4.0, 'Undergraduate pharmacy programme.', 'ACTIVE', '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(7, 'BIT', 'Bachelor of Information Technology', 11, 4.0, 'Undergraduate information technology programme.', 'ACTIVE', '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(8, 'BCS', 'Bachelor of Computer Science', 11, 4.0, 'Undergraduate computer science programme.', 'ACTIVE', '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(9, 'BBA', 'Bachelor of Business Administration', 13, 4.0, 'Undergraduate business administration programme.', 'ACTIVE', '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(10, 'BPA', 'Bachelor of Public Administration', 14, 4.0, 'Undergraduate public administration programme.', 'ACTIVE', '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(11, 'BED', 'Bachelor of Education', 15, 4.0, 'Undergraduate education programme.', 'ACTIVE', '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(12, 'LLB', 'Bachelor of Laws', 16, 4.0, 'Undergraduate law programme.', 'ACTIVE', '2026-09-03 16:04:14', '2026-09-03 16:04:14');

-- --------------------------------------------------------

--
-- Table structure for table `registrations`
--

CREATE TABLE `registrations` (
  `registration_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `offering_id` bigint(20) UNSIGNED NOT NULL,
  `registration_date` datetime NOT NULL DEFAULT current_timestamp(),
  `status` enum('REGISTERED','DROPPED','COMPLETED','FAILED','WITHDRAWN','CANCELLED') NOT NULL DEFAULT 'REGISTERED',
  `registered_by` bigint(20) UNSIGNED DEFAULT NULL,
  `dropped_at` datetime DEFAULT NULL,
  `remarks` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registrations`
--

INSERT INTO `registrations` (`registration_id`, `student_id`, `offering_id`, `registration_date`, `status`, `registered_by`, `dropped_at`, `remarks`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2026-08-20 10:00:00', 'REGISTERED', 14, NULL, 'Initial semester registration', '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(2, 1, 2, '2026-08-20 10:02:00', 'REGISTERED', 14, NULL, 'Initial semester registration', '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(3, 1, 3, '2026-08-20 10:05:00', 'REGISTERED', 14, NULL, 'Initial semester registration', '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(4, 2, 1, '2026-08-21 09:00:00', 'REGISTERED', 15, NULL, 'Initial semester registration', '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(5, 2, 2, '2026-08-21 09:02:00', 'REGISTERED', 15, NULL, 'Initial semester registration', '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(6, 7, 11, '2026-08-18 11:00:00', 'REGISTERED', 9, NULL, 'Semester registration', '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(7, 7, 12, '2026-08-18 11:03:00', 'REGISTERED', 9, NULL, 'Semester registration', '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(8, 7, 13, '2026-08-18 11:05:00', 'REGISTERED', 9, NULL, 'Semester registration', '2026-09-03 16:05:25', '2026-09-03 16:05:25');

-- --------------------------------------------------------

--
-- Table structure for table `registration_logs`
--

CREATE TABLE `registration_logs` (
  `log_id` bigint(20) UNSIGNED NOT NULL,
  `registration_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `action` enum('CREATED','UPDATED','DROPPED','CANCELLED','RESTORED','COMPLETED') NOT NULL,
  `old_status` varchar(30) DEFAULT NULL,
  `new_status` varchar(30) DEFAULT NULL,
  `remarks` varchar(500) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registration_logs`
--

INSERT INTO `registration_logs` (`log_id`, `registration_id`, `user_id`, `action`, `old_status`, `new_status`, `remarks`, `ip_address`, `created_at`) VALUES
(1, 1, 14, 'CREATED', NULL, 'REGISTERED', 'Initial course registration', NULL, '2026-09-03 16:05:26'),
(2, 2, 14, 'CREATED', NULL, 'REGISTERED', 'Initial course registration', NULL, '2026-09-03 16:05:26'),
(3, 3, 14, 'CREATED', NULL, 'REGISTERED', 'Initial course registration', NULL, '2026-09-03 16:05:26'),
(4, 4, 15, 'CREATED', NULL, 'REGISTERED', 'Initial course registration', NULL, '2026-09-03 16:05:26'),
(5, 5, 15, 'CREATED', NULL, 'REGISTERED', 'Initial course registration', NULL, '2026-09-03 16:05:26'),
(6, 6, 9, 'CREATED', NULL, 'REGISTERED', 'Initial course registration', NULL, '2026-09-03 16:05:26'),
(7, 7, 9, 'CREATED', NULL, 'REGISTERED', 'Initial course registration', NULL, '2026-09-03 16:05:26'),
(8, 8, 9, 'CREATED', NULL, 'REGISTERED', 'Initial course registration', NULL, '2026-09-03 16:05:26');

-- --------------------------------------------------------

--
-- Table structure for table `semesters`
--

CREATE TABLE `semesters` (
  `semester_id` bigint(20) UNSIGNED NOT NULL,
  `academic_year_id` bigint(20) UNSIGNED NOT NULL,
  `semester_number` tinyint(3) UNSIGNED NOT NULL,
  `semester_name` varchar(50) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `registration_start` datetime NOT NULL,
  `registration_end` datetime NOT NULL,
  `status` enum('UPCOMING','OPEN','CLOSED','COMPLETED','CANCELLED') NOT NULL DEFAULT 'UPCOMING',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ;

--
-- Dumping data for table `semesters`
--

INSERT INTO `semesters` (`semester_id`, `academic_year_id`, `semester_number`, `semester_name`, `start_date`, `end_date`, `registration_start`, `registration_end`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'Semester One', '2026-08-01', '2026-12-31', '2026-08-01 08:00:00', '2026-09-30 23:59:59', 'OPEN', '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(2, 2, 2, 'Semester Two', '2027-01-01', '2027-07-31', '2027-01-01 08:00:00', '2027-02-15 23:59:59', 'UPCOMING', '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(3, 1, 1, 'Semester One', '2025-08-01', '2025-12-31', '2025-08-01 08:00:00', '2025-09-30 23:59:59', 'COMPLETED', '2026-09-03 16:04:14', '2026-09-03 16:04:14');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `student_number` varchar(50) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) NOT NULL,
  `gender` enum('MALE','FEMALE','OTHER','PREFER_NOT_TO_SAY') DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `program_id` bigint(20) UNSIGNED NOT NULL,
  `academic_level` tinyint(3) UNSIGNED NOT NULL,
  `admission_year` year(4) NOT NULL,
  `intake_id` bigint(20) UNSIGNED DEFAULT NULL,
  `student_status` enum('ACTIVE','INACTIVE','SUSPENDED','GRADUATED','WITHDRAWN','DEFERRED') NOT NULL DEFAULT 'ACTIVE',
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `student_number`, `first_name`, `middle_name`, `last_name`, `gender`, `date_of_birth`, `email`, `phone`, `address`, `program_id`, `academic_level`, `admission_year`, `intake_id`, `student_status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '2026-08-0001', 'John', 'Paul', 'Mugisha', 'MALE', '2003-05-14', '2026-08-0001@student.kiu.ac.ug', '+256700000001', 'Ishaka, Bushenyi', 7, 1, '2026', 3, 'ACTIVE', 14, '2026-09-03 16:05:25', '2026-09-03 16:12:24'),
(2, '2026-08-0002', 'Sarah', 'Amina', 'Nabirye', 'FEMALE', '2004-02-19', '2026-08-0002@student.kiu.ac.ug', '+256700000002', 'Mbarara, Uganda', 7, 1, '2026', 3, 'ACTIVE', 15, '2026-09-03 16:05:25', '2026-09-03 16:12:24'),
(3, '2026-08-0003', 'David', 'Robert', 'Tumusiime', 'MALE', '2002-11-08', '2026-08-0003@student.kiu.ac.ug', '+256700000003', 'Bushenyi, Uganda', 8, 1, '2026', 3, 'ACTIVE', 16, '2026-09-03 16:05:25', '2026-09-03 16:12:24'),
(4, '2026-08-0004', 'Mary', 'Grace', 'Atuheire', 'FEMALE', '2003-07-22', '2026-08-0004@student.kiu.ac.ug', '+256700000004', 'Mitooma, Uganda', 9, 1, '2026', 3, 'ACTIVE', 17, '2026-09-03 16:05:25', '2026-09-03 16:12:24'),
(5, '2026-08-0005', 'Brian', 'Ivan', 'Kato', 'MALE', '2001-09-12', '2026-08-0005@student.kiu.ac.ug', '+256700000005', 'Kasese, Uganda', 5, 1, '2026', 3, 'ACTIVE', 18, '2026-09-03 16:05:25', '2026-09-03 16:12:24'),
(6, '2026-08-0006', 'Esther', 'Jane', 'Aciro', 'FEMALE', '2003-03-15', '2026-08-0006@student.kiu.ac.ug', '+256700000006', 'Kabale, Uganda', 12, 1, '2026', 3, 'ACTIVE', 19, '2026-09-03 16:05:25', '2026-09-03 16:12:24'),
(7, '2026-01-0001', 'Michael', 'Joseph', 'Okello', 'MALE', '2002-04-11', '2026-01-0001@student.kiu.ac.ug', '+256700000007', 'Kampala, Uganda', 7, 2, '2026', 1, 'ACTIVE', 9, '2026-09-03 16:05:25', '2026-09-03 16:12:24'),
(8, '2026-01-0002', 'Rebecca', 'Anne', 'Nanyonga', 'FEMALE', '2002-08-18', '2026-01-0002@student.kiu.ac.ug', '+256700000008', 'Masaka, Uganda', 9, 2, '2026', 1, 'ACTIVE', 10, '2026-09-03 16:05:25', '2026-09-03 16:12:24'),
(9, '2026-01-0003', 'Patrick', 'Moses', 'Ssekabira', 'MALE', '2001-12-09', '2026-01-0003@student.kiu.ac.ug', '+256700000009', 'Fort Portal, Uganda', 8, 2, '2026', 1, 'ACTIVE', 11, '2026-09-03 16:05:25', '2026-09-03 16:12:24'),
(10, '2026-04-0001', 'Agnes', 'Ruth', 'Namukasa', 'FEMALE', '2003-06-20', '2026-04-0001@student.kiu.ac.ug', '+256700000010', 'Mbarara, Uganda', 5, 1, '2026', 2, 'ACTIVE', 12, '2026-09-03 16:05:25', '2026-09-03 16:12:24'),
(11, '2026-04-0002', 'Samuel', 'David', 'Businge', 'MALE', '2002-10-05', '2026-04-0002@student.kiu.ac.ug', '+256700000011', 'Ishaka, Uganda', 3, 1, '2026', 2, 'ACTIVE', 13, '2026-09-03 16:05:25', '2026-09-03 16:12:24');

-- --------------------------------------------------------

--
-- Stand-in structure for view `student_registration_details`
-- (See below for the actual view)
--
CREATE TABLE `student_registration_details` (
`registration_id` bigint(20) unsigned
,`student_id` bigint(20) unsigned
,`student_number` varchar(50)
,`student_name` varchar(302)
,`program_code` varchar(30)
,`program_name` varchar(200)
,`course_id` bigint(20) unsigned
,`course_code` varchar(30)
,`course_name` varchar(200)
,`credit_units` decimal(4,1)
,`academic_year` varchar(20)
,`semester_name` varchar(50)
,`registration_date` datetime
,`status` enum('REGISTERED','DROPPED','COMPLETED','FAILED','WITHDRAWN','CANCELLED')
,`dropped_at` datetime
,`remarks` varchar(500)
);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('SUPER_ADMIN','ADMIN','REGISTRAR','LECTURER','STUDENT') NOT NULL DEFAULT 'STUDENT',
  `status` enum('ACTIVE','INACTIVE','SUSPENDED') NOT NULL DEFAULT 'ACTIVE',
  `last_login` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password_hash`, `role`, `status`, `last_login`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', '$2y$10$DEMO_HASH_SUPERADMIN', 'SUPER_ADMIN', 'ACTIVE', NULL, '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(2, 'admin', '$2y$10$DEMO_HASH_ADMIN', 'ADMIN', 'ACTIVE', NULL, '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(3, 'registrar', '$2y$10$DEMO_HASH_REGISTRAR', 'REGISTRAR', 'ACTIVE', NULL, '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(4, 'lecturer01', '$2y$10$DEMO_HASH_LECTURER01', 'LECTURER', 'ACTIVE', NULL, '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(5, 'lecturer02', '$2y$10$DEMO_HASH_LECTURER02', 'LECTURER', 'ACTIVE', NULL, '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(6, 'lecturer03', '$2y$10$DEMO_HASH_LECTURER03', 'LECTURER', 'ACTIVE', NULL, '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(7, 'lecturer04', '$2y$10$DEMO_HASH_LECTURER04', 'LECTURER', 'ACTIVE', NULL, '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(8, 'lecturer05', '$2y$10$DEMO_HASH_LECTURER05', 'LECTURER', 'ACTIVE', NULL, '2026-09-03 16:04:14', '2026-09-03 16:04:14'),
(9, '2026-01-0001', '$2y$10$DEMO_HASH_STUDENT_PASSWORD', 'STUDENT', 'ACTIVE', NULL, '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(10, '2026-01-0002', '$2y$10$DEMO_HASH_STUDENT_PASSWORD', 'STUDENT', 'ACTIVE', NULL, '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(11, '2026-01-0003', '$2y$10$DEMO_HASH_STUDENT_PASSWORD', 'STUDENT', 'ACTIVE', NULL, '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(12, '2026-04-0001', '$2y$10$DEMO_HASH_STUDENT_PASSWORD', 'STUDENT', 'ACTIVE', NULL, '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(13, '2026-04-0002', '$2y$10$DEMO_HASH_STUDENT_PASSWORD', 'STUDENT', 'ACTIVE', NULL, '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(14, '2026-08-0001', '$2y$10$DEMO_HASH_STUDENT_PASSWORD', 'STUDENT', 'ACTIVE', NULL, '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(15, '2026-08-0002', '$2y$10$DEMO_HASH_STUDENT_PASSWORD', 'STUDENT', 'ACTIVE', NULL, '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(16, '2026-08-0003', '$2y$10$DEMO_HASH_STUDENT_PASSWORD', 'STUDENT', 'ACTIVE', NULL, '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(17, '2026-08-0004', '$2y$10$DEMO_HASH_STUDENT_PASSWORD', 'STUDENT', 'ACTIVE', NULL, '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(18, '2026-08-0005', '$2y$10$DEMO_HASH_STUDENT_PASSWORD', 'STUDENT', 'ACTIVE', NULL, '2026-09-03 16:05:25', '2026-09-03 16:05:25'),
(19, '2026-08-0006', '$2y$10$DEMO_HASH_STUDENT_PASSWORD', 'STUDENT', 'ACTIVE', NULL, '2026-09-03 16:05:25', '2026-09-03 16:05:25');

-- --------------------------------------------------------

--
-- Structure for view `available_courses`
--
DROP TABLE IF EXISTS `available_courses`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `available_courses`  AS SELECT `co`.`offering_id` AS `offering_id`, `c`.`course_id` AS `course_id`, `c`.`course_code` AS `course_code`, `c`.`course_name` AS `course_name`, `c`.`credit_units` AS `credit_units`, `c`.`course_type` AS `course_type`, `p`.`program_code` AS `program_code`, `p`.`program_name` AS `program_name`, `co`.`academic_level` AS `academic_level`, `sem`.`semester_id` AS `semester_id`, `sem`.`semester_name` AS `semester_name`, `ay`.`academic_year_id` AS `academic_year_id`, `ay`.`year_name` AS `year_name`, `co`.`capacity` AS `capacity`, `co`.`status` AS `status` FROM ((((`course_offerings` `co` join `courses` `c` on(`co`.`course_id` = `c`.`course_id`)) join `semesters` `sem` on(`co`.`semester_id` = `sem`.`semester_id`)) join `academic_years` `ay` on(`sem`.`academic_year_id` = `ay`.`academic_year_id`)) left join `programs` `p` on(`co`.`program_id` = `p`.`program_id`)) WHERE `co`.`status` = 'ACTIVE' AND `c`.`status` = 'ACTIVE' AND `sem`.`status` = 'OPEN' AND `ay`.`status` = 'ACTIVE' ;

-- --------------------------------------------------------

--
-- Structure for view `student_registration_details`
--
DROP TABLE IF EXISTS `student_registration_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `student_registration_details`  AS SELECT `r`.`registration_id` AS `registration_id`, `s`.`student_id` AS `student_id`, `s`.`student_number` AS `student_number`, concat(`s`.`first_name`,' ',coalesce(concat(`s`.`middle_name`,' '),''),`s`.`last_name`) AS `student_name`, `p`.`program_code` AS `program_code`, `p`.`program_name` AS `program_name`, `c`.`course_id` AS `course_id`, `c`.`course_code` AS `course_code`, `c`.`course_name` AS `course_name`, `c`.`credit_units` AS `credit_units`, `ay`.`year_name` AS `academic_year`, `sem`.`semester_name` AS `semester_name`, `r`.`registration_date` AS `registration_date`, `r`.`status` AS `status`, `r`.`dropped_at` AS `dropped_at`, `r`.`remarks` AS `remarks` FROM ((((((`registrations` `r` join `students` `s` on(`r`.`student_id` = `s`.`student_id`)) join `programs` `p` on(`s`.`program_id` = `p`.`program_id`)) join `course_offerings` `co` on(`r`.`offering_id` = `co`.`offering_id`)) join `courses` `c` on(`co`.`course_id` = `c`.`course_id`)) join `semesters` `sem` on(`co`.`semester_id` = `sem`.`semester_id`)) join `academic_years` `ay` on(`sem`.`academic_year_id` = `ay`.`academic_year_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_years`
--
ALTER TABLE `academic_years`
  ADD PRIMARY KEY (`academic_year_id`),
  ADD UNIQUE KEY `year_name` (`year_name`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`),
  ADD UNIQUE KEY `course_code` (`course_code`),
  ADD KEY `idx_courses_department` (`department_id`),
  ADD KEY `idx_courses_level` (`academic_level`);

--
-- Indexes for table `course_offerings`
--
ALTER TABLE `course_offerings`
  ADD PRIMARY KEY (`offering_id`),
  ADD UNIQUE KEY `course_id` (`course_id`,`semester_id`,`program_id`,`academic_level`),
  ADD KEY `fk_offering_lecturer` (`lecturer_id`),
  ADD KEY `idx_offerings_semester` (`semester_id`),
  ADD KEY `idx_offerings_course` (`course_id`),
  ADD KEY `idx_offerings_program` (`program_id`);

--
-- Indexes for table `course_prerequisites`
--
ALTER TABLE `course_prerequisites`
  ADD PRIMARY KEY (`prerequisite_id`),
  ADD UNIQUE KEY `course_id` (`course_id`,`prerequisite_course_id`),
  ADD KEY `fk_required_course` (`prerequisite_course_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`department_id`),
  ADD UNIQUE KEY `department_code` (`department_code`),
  ADD KEY `fk_department_faculty` (`faculty_id`);

--
-- Indexes for table `faculties`
--
ALTER TABLE `faculties`
  ADD PRIMARY KEY (`faculty_id`),
  ADD UNIQUE KEY `faculty_code` (`faculty_code`);

--
-- Indexes for table `intakes`
--
ALTER TABLE `intakes`
  ADD PRIMARY KEY (`intake_id`),
  ADD UNIQUE KEY `academic_year_id` (`academic_year_id`,`intake_month`),
  ADD UNIQUE KEY `uq_intake_year_code` (`academic_year_id`,`intake_code`);

--
-- Indexes for table `programs`
--
ALTER TABLE `programs`
  ADD PRIMARY KEY (`program_id`),
  ADD UNIQUE KEY `program_code` (`program_code`),
  ADD KEY `fk_program_department` (`department_id`);

--
-- Indexes for table `registrations`
--
ALTER TABLE `registrations`
  ADD PRIMARY KEY (`registration_id`),
  ADD UNIQUE KEY `student_id` (`student_id`,`offering_id`),
  ADD KEY `fk_registration_user` (`registered_by`),
  ADD KEY `idx_registrations_student` (`student_id`),
  ADD KEY `idx_registrations_offering` (`offering_id`),
  ADD KEY `idx_registrations_status` (`status`);

--
-- Indexes for table `registration_logs`
--
ALTER TABLE `registration_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `idx_registration_logs_registration` (`registration_id`),
  ADD KEY `idx_registration_logs_user` (`user_id`);

--
-- Indexes for table `semesters`
--
ALTER TABLE `semesters`
  ADD PRIMARY KEY (`semester_id`),
  ADD UNIQUE KEY `academic_year_id` (`academic_year_id`,`semester_number`),
  ADD KEY `idx_semesters_year` (`academic_year_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `student_number` (`student_number`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `idx_students_program` (`program_id`),
  ADD KEY `idx_students_status` (`student_status`),
  ADD KEY `fk_student_intake` (`intake_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_years`
--
ALTER TABLE `academic_years`
  MODIFY `academic_year_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_offerings`
--
ALTER TABLE `course_offerings`
  MODIFY `offering_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_prerequisites`
--
ALTER TABLE `course_prerequisites`
  MODIFY `prerequisite_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `department_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `faculties`
--
ALTER TABLE `faculties`
  MODIFY `faculty_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `intakes`
--
ALTER TABLE `intakes`
  MODIFY `intake_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `programs`
--
ALTER TABLE `programs`
  MODIFY `program_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `registrations`
--
ALTER TABLE `registrations`
  MODIFY `registration_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `registration_logs`
--
ALTER TABLE `registration_logs`
  MODIFY `log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `semesters`
--
ALTER TABLE `semesters`
  MODIFY `semester_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `fk_course_department` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON UPDATE CASCADE;

--
-- Constraints for table `course_offerings`
--
ALTER TABLE `course_offerings`
  ADD CONSTRAINT `fk_offering_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_offering_lecturer` FOREIGN KEY (`lecturer_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_offering_program` FOREIGN KEY (`program_id`) REFERENCES `programs` (`program_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_offering_semester` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`semester_id`) ON UPDATE CASCADE;

--
-- Constraints for table `course_prerequisites`
--
ALTER TABLE `course_prerequisites`
  ADD CONSTRAINT `fk_prerequisite_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_required_course` FOREIGN KEY (`prerequisite_course_id`) REFERENCES `courses` (`course_id`) ON UPDATE CASCADE;

--
-- Constraints for table `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `fk_department_faculty` FOREIGN KEY (`faculty_id`) REFERENCES `faculties` (`faculty_id`) ON UPDATE CASCADE;

--
-- Constraints for table `intakes`
--
ALTER TABLE `intakes`
  ADD CONSTRAINT `fk_intake_academic_year` FOREIGN KEY (`academic_year_id`) REFERENCES `academic_years` (`academic_year_id`) ON UPDATE CASCADE;

--
-- Constraints for table `programs`
--
ALTER TABLE `programs`
  ADD CONSTRAINT `fk_program_department` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON UPDATE CASCADE;

--
-- Constraints for table `registrations`
--
ALTER TABLE `registrations`
  ADD CONSTRAINT `fk_registration_offering` FOREIGN KEY (`offering_id`) REFERENCES `course_offerings` (`offering_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_registration_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_registration_user` FOREIGN KEY (`registered_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `registration_logs`
--
ALTER TABLE `registration_logs`
  ADD CONSTRAINT `fk_log_registration` FOREIGN KEY (`registration_id`) REFERENCES `registrations` (`registration_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_log_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `semesters`
--
ALTER TABLE `semesters`
  ADD CONSTRAINT `fk_semester_academic_year` FOREIGN KEY (`academic_year_id`) REFERENCES `academic_years` (`academic_year_id`) ON UPDATE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `fk_student_intake` FOREIGN KEY (`intake_id`) REFERENCES `intakes` (`intake_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_student_program` FOREIGN KEY (`program_id`) REFERENCES `programs` (`program_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_student_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
