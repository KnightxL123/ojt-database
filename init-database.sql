-- Initialize OJT System Database
CREATE DATABASE IF NOT EXISTS ojt_system;
USE ojt_system;

SET time_zone = '+00:00';

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Table structure for table `advisers`
--

CREATE TABLE advisers (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(100) DEFAULT NULL,
  email varchar(100) DEFAULT NULL,
  department_id int DEFAULT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);

--
-- Table structure for table `announcements`
--

CREATE TABLE announcements (
  id int NOT NULL AUTO_INCREMENT,
  sender_id int NOT NULL,
  title varchar(255) NOT NULL,
  message text NOT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);

--
-- Table structure for table `announcement_recipients`
--

CREATE TABLE announcement_recipients (
  id int NOT NULL AUTO_INCREMENT,
  announcement_id int NOT NULL,
  recipient_id int NOT NULL,
  is_read smallint DEFAULT 0,
  PRIMARY KEY (id)
);

--
-- Table structure for table `departments`
--

CREATE TABLE departments (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(100) NOT NULL,
  logo varchar(255) DEFAULT NULL,
  status enum('active','inactive') NOT NULL DEFAULT 'active',
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY name (name)
);

--
-- Dumping data for table `departments`
--

INSERT INTO departments (id, name, logo, status, created_at, deleted_at) VALUES
(3, 'CBA', NULL, 'active', '2025-06-06 06:12:57', NULL),
(4, 'Tourism and Hospitality Management', NULL, 'active', '2025-06-06 11:30:31', NULL),
(5, 'Computer Studies and Technology', NULL, 'active', '2025-06-06 12:50:11', NULL),
(9, 'bsit', NULL, 'active', '2025-10-15 09:50:42', NULL);

--
-- Table structure for table `documents`
--

CREATE TABLE documents (
  id int NOT NULL AUTO_INCREMENT,
  student_id int DEFAULT NULL,
  document_name varchar(150) NOT NULL,
  status enum('Not Signed In','Approved','Pending','Rejected') DEFAULT 'Pending',
  uploaded_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  department_id int DEFAULT NULL,
  certificate_of_completion varchar(255) DEFAULT NULL,
  daily_time_record enum('Not Signed In','Approved','Pending','Rejected') DEFAULT 'Pending',
  performance_evaluation enum('Not Signed In','Approved','Pending','Rejected') DEFAULT 'Pending',
  narrative_report enum('Not Signed In','Approved','Pending','Rejected') DEFAULT 'Pending',
  printed_journal enum('Not Signed In','Approved','Pending','Rejected') DEFAULT 'Pending',
  company_profile enum('Not Signed In','Approved','Pending','Rejected') DEFAULT 'Pending',
  ojt_program_evaluation enum('Not Signed In','Approved','Pending','Rejected') DEFAULT 'Pending',
  ojt_evaluation_form enum('Not Signed In','Approved','Pending','Rejected') DEFAULT 'Pending',
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);

--
-- Table structure for table `monitoring`
--

CREATE TABLE monitoring (
  id int NOT NULL AUTO_INCREMENT,
  student_id int NOT NULL,
  activity varchar(255) NOT NULL,
  remarks text DEFAULT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  document_type varchar(50) DEFAULT NULL,
  status varchar(20) DEFAULT NULL,
  submission_date date DEFAULT NULL,
  PRIMARY KEY (id)
);

--
-- Table structure for table `partners`
--

CREATE TABLE partners (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(150) NOT NULL,
  year year NOT NULL,
  logo varchar(255) DEFAULT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  logo_url varchar(255) DEFAULT NULL,
  website_url varchar(255) DEFAULT NULL,
  female_count int DEFAULT 0,
  male_count int DEFAULT 0,
  PRIMARY KEY (id)
);

--
-- Dumping data for table `partners`
--

INSERT INTO partners (id, name, year, logo, created_at, logo_url, website_url, female_count, male_count) VALUES
(1, 'bsit', 2025, NULL, '2025-06-06 13:17:55', '', '', 0, 0);

--
-- Table structure for table `partner_programs`
--

CREATE TABLE partner_programs (
  id int NOT NULL AUTO_INCREMENT,
  partner_id int DEFAULT NULL,
  program_id int DEFAULT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);

--
-- Table structure for table `password_resets`
--

CREATE TABLE password_resets (
  id int NOT NULL AUTO_INCREMENT,
  email varchar(100) NOT NULL,
  token varchar(255) NOT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);

--
-- Table structure for table `programs`
--

CREATE TABLE programs (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(100) NOT NULL,
  department_id int NOT NULL,
  logo_url varchar(255) DEFAULT NULL,
  status enum('active','inactive') NOT NULL DEFAULT 'active',
  female_count int DEFAULT 0,
  male_count int DEFAULT 0,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);

--
-- Dumping data for table `programs`
--

INSERT INTO programs (id, name, department_id, logo_url, status, female_count, male_count, created_at) VALUES
(3, 'BSBA', 3, NULL, 'active', 0, 0, '2025-06-06 06:13:10'),
(4, 'BSE', 3, NULL, 'active', 0, 0, '2025-06-06 06:13:15'),
(5, 'BSA', 3, NULL, 'active', 0, 0, '2025-06-06 06:17:55'),
(6, 'BS Hospitality Management', 4, NULL, 'active', 0, 0, '2025-06-06 11:30:44'),
(7, 'BS Tourism Management', 4, NULL, 'active', 0, 0, '2025-06-06 11:30:55'),
(8, 'BS Information Technology', 5, NULL, 'active', 0, 0, '2025-06-06 12:50:25'),
(9, 'BS Information System', 5, NULL, 'active', 0, 0, '2025-06-06 12:50:35'),
(13, 'web games', 9, NULL, 'active', 0, 0, '2025-10-15 09:51:43');

--
-- Table structure for table `sections`
--

CREATE TABLE sections (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  department_id int NOT NULL,
  program_id int DEFAULT NULL,
  adviser_id int DEFAULT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);

--
-- Dumping data for table `sections`
--

INSERT INTO sections (id, name, department_id, program_id, adviser_id, created_at) VALUES
(2, '4B', 3, 3, NULL, '2025-06-07 03:54:53');

--
-- Table structure for table `section_adviser`
--

CREATE TABLE section_adviser (
  section_id int NOT NULL,
  adviser_id int NOT NULL,
  PRIMARY KEY (section_id,adviser_id)
);

--
-- Table structure for table `students`
--

CREATE TABLE students (
  id int NOT NULL AUTO_INCREMENT,
  student_id varchar(20) NOT NULL,
  name varchar(255) NOT NULL,
  section_id int NOT NULL,
  gender enum('Male','Female') NOT NULL DEFAULT 'Male',
  company varchar(100) DEFAULT NULL,
  hours_completed int DEFAULT 0,
  total_hours int DEFAULT 400,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);

--
-- Dumping data for table `students`
--

INSERT INTO students (id, student_id, name, section_id, gender, company, hours_completed, total_hours, created_at) VALUES
(32, '23-23001', 'Juan Dela Cruz', 2, 'Male', NULL, 0, 400, '2025-06-07 03:54:53'),
(33, '23-23002', 'Boy Benta', 2, 'Male', NULL, 0, 400, '2025-06-07 03:54:53'),
(34, '23-23003', 'Aling Maliit', 2, 'Male', NULL, 0, 400, '2025-06-07 03:54:53'),
(35, '23-23004', 'Mang Kanor', 2, 'Male', NULL, 0, 400, '2025-06-07 03:54:53'),
(36, '23-23005', 'Bebang Tiktilaok', 2, 'Male', NULL, 0, 400, '2025-06-07 03:54:53'),
(37, '23-23006', 'Dodong Kalbo', 2, 'Male', NULL, 0, 400, '2025-06-07 03:54:53'),
(38, '23-23007', 'Inday Tisay', 2, 'Male', NULL, 0, 400, '2025-06-07 03:54:53'),
(39, '23-23008', 'Papang Tambay', 2, 'Male', NULL, 0, 400, '2025-06-07 03:54:53'),
(40, '23-23009', 'Kulot Itlog', 2, 'Male', NULL, 0, 400, '2025-06-07 03:54:53'),
(41, '23-23010', 'Tisay Palaban', 2, 'Male', NULL, 0, 400, '2025-06-07 03:54:53'),
(42, '23-23011', 'Berto Bangenge', 2, 'Male', NULL, 0, 400, '2025-06-07 03:54:53'),
(43, '23-23012', 'Neneng Talangka', 2, 'Male', NULL, 0, 400, '2025-06-07 03:54:53'),
(44, '23-23013', 'Jojo Palaka', 2, 'Male', NULL, 0, 400, '2025-06-07 03:54:53'),
(45, '23-23014', 'Lola Buding', 2, 'Male', NULL, 0, 400, '2025-06-07 03:54:53'),
(46, '23-23015', 'Totoy Sipag', 2, 'Male', NULL, 0, 400, '2025-06-07 03:54:53'),
(47, '23-23016', 'Kaka Tikboy', 2, 'Male', NULL, 0, 400, '2025-06-07 03:54:53'),
(48, '23-23017', 'Manang Bola', 2, 'Male', NULL, 0, 400, '2025-06-07 03:54:53'),
(49, '23-23018', 'Jun-Jun Panot', 2, 'Male', NULL, 0, 400, '2025-06-07 03:54:53'),
(50, '23-23019', 'Bong Bongga', 2, 'Male', NULL, 0, 400, '2025-06-07 03:54:53'),
(51, '23-23020', 'Ateng Kaladkarin', 2, 'Male', NULL, 0, 400, '2025-06-07 03:54:53'),
(52, '23-23021', 'Utoy Tagilid', 2, 'Male', NULL, 0, 400, '2025-06-07 03:54:53'),
(53, '23-23022', 'Mang Tomasino', 2, 'Male', NULL, 0, 400, '2025-06-07 03:54:53'),
(54, '23-23023', 'Pipay Sumakit', 2, 'Male', NULL, 0, 400, '2025-06-07 03:54:53'),
(55, '23-23024', 'Baby Takaw', 2, 'Male', NULL, 0, 400, '2025-06-07 03:54:53'),
(56, '23-23025', 'Choknat Bigote', 2, 'Male', NULL, 0, 400, '2025-06-07 03:54:53'),
(57, '23-23026', 'Diday Sabaw', 2, 'Male', NULL, 0, 400, '2025-06-07 03:54:53'),
(58, '23-23027', 'Boy Tsismis', 2, 'Male', NULL, 0, 400, '2025-06-07 03:54:53'),
(59, '23-23028', 'Luningning Labandera', 2, 'Male', NULL, 0, 400, '2025-06-07 03:54:53'),
(60, '23-23029', 'Nognog Ngiting-aso', 2, 'Male', NULL, 0, 400, '2025-06-07 03:54:53'),
(61, '23-23030', 'Titang Laging-late', 2, 'Male', NULL, 0, 400, '2025-06-07 03:54:53');

--
-- Table structure for table `student_documents`
--

CREATE TABLE student_documents (
  id int NOT NULL AUTO_INCREMENT,
  student_id int NOT NULL,
  document_type enum('Registration','Monitoring','Recommendation','Acceptance','Training Plan','Viewer','MCA') NOT NULL,
  status enum('Approved','Pending','Missing') DEFAULT 'Missing',
  date_submitted date DEFAULT NULL,
  file_path varchar(255) DEFAULT NULL,
  remarks text DEFAULT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY student_id (student_id,document_type)
);

--
-- Table structure for table `student_programs`
--

CREATE TABLE student_programs (
  id int NOT NULL AUTO_INCREMENT,
  student_id int DEFAULT NULL,
  program_id int DEFAULT NULL,
  completed smallint DEFAULT 0,
  PRIMARY KEY (id)
);

--
-- Table structure for table `users`
--

CREATE TABLE users (
  id int NOT NULL AUTO_INCREMENT,
  username varchar(100) NOT NULL,
  email varchar(100) NOT NULL,
  password_hash varchar(255) NOT NULL,
  role enum('admin','user','coordinator') NOT NULL DEFAULT 'user',
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  department_id int DEFAULT NULL,
  phone varchar(20) DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY username (username),
  UNIQUE KEY email (email)
);

--
-- Dumping data for table `users`
--

INSERT INTO users (id, username, email, password_hash, role, created_at, department_id, phone) VALUES
(1, 'admin', 'jastinetolentino4@gmail.com', '$2y$10$hMvtDveQ/qJEZ1smP4BfLu0xIajV9TTyU9X6PXiphy.l31ZzcrZiO', 'admin', '2025-06-06 04:32:14', NULL, NULL),
(3, 'ccstcoordinator', 'CCSTOJTCOORDINATOR@gmail.com', '$2y$10$pbAyKsZn13dyQKXpElSPKesz.bzaOSFDKW/6qp3DiOUf7U1nBQ9uq', 'coordinator', '2025-06-06 07:29:19', NULL, NULL),
(4, 'cbacoordinators', 'cbacoordinators@gmail.com', '$2y$10$6zVg/9Ofuu2/XjD/F8xMc.R2btnQOgKLjSW0HQrYKeWfb.2o2j07y', 'coordinator', '2025-06-06 08:33:16', 3, NULL),
(5, 'hmcoordinator', 'hmcoordinator@gmail.com', '$2y$10$Nb2vjfSZISKmZ9gjjxVGaOqrKZsjEkrrgteZbXMEtQhxLXjClCwHS', 'coordinator', '2025-06-06 11:38:36', 4, NULL),
(6, 'ccstcoordinato', 'ccstcoordinator@gmail.com', '$2y$10$h83WHNNZtKIxy3nVXoW3J.mk0qCAHDi92Y1usWJJJhC0.XCLzwPLS', 'coordinator', '2025-06-06 12:52:04', 5, NULL),
(8, 'test', 'test123@gmail.com', '$2y$10$eZ7MHISIHT.QXnzKD.Mov.MiiHbU4oWJxpwQ8dBSBtClFxdNc0naS', 'coordinator', '2025-06-16 13:06:14', NULL, NULL),
(10, 'bsit4B', 'bsit4B@mail.com', '$2y$10$5YinhZ3nDSOUqOrRQO7ur.hc4Gp/Gcm5kfBZAPHMaqLrnjuMPzo5e', 'coordinator', '2025-10-15 09:53:59', 9, NULL);

--
-- Indexes for dumped tables
--

-- Indexes for table `advisers`
ALTER TABLE advisers
  ADD KEY department_id (department_id);

-- Indexes for table `announcements`
ALTER TABLE announcements
  ADD KEY fk_announcements_sender (sender_id),
  ADD KEY idx_announcements_created (created_at);

-- Indexes for table `announcement_recipients`
ALTER TABLE announcement_recipients
  ADD KEY announcement_id (announcement_id),
  ADD KEY idx_announcement_recipients_recipient (recipient_id);

-- Indexes for table `documents`
ALTER TABLE documents
  ADD KEY student_id (student_id),
  ADD KEY department_id (department_id);

-- Indexes for table `monitoring`
ALTER TABLE monitoring
  ADD KEY student_id (student_id);

-- Indexes for table `partner_programs`
ALTER TABLE partner_programs
  ADD KEY partner_id (partner_id),
  ADD KEY program_id (program_id);

-- Indexes for table `programs`
ALTER TABLE programs
  ADD KEY department_id (department_id);

-- Indexes for table `sections`
ALTER TABLE sections
  ADD KEY department_id (department_id),
  ADD KEY fk_program (program_id),
  ADD KEY fk_sections_adviser (adviser_id);

-- Indexes for table `section_adviser`
ALTER TABLE section_adviser
  ADD KEY adviser_id (adviser_id);

-- Indexes for table `students`
ALTER TABLE students
  ADD KEY section_id (section_id);

-- Indexes for table `student_programs`
ALTER TABLE student_programs
  ADD KEY student_id (student_id),
  ADD KEY program_id (program_id);

-- Indexes for table `users`
ALTER TABLE users
  ADD KEY department_id (department_id);

--
-- Constraints for dumped tables
--

-- Constraints for table `advisers`
ALTER TABLE advisers
  ADD CONSTRAINT fk_advisers_department FOREIGN KEY (department_id) REFERENCES departments (id) ON DELETE SET NULL;

-- Constraints for table `announcements`
ALTER TABLE announcements
  ADD CONSTRAINT fk_announcements_sender FOREIGN KEY (sender_id) REFERENCES users (id) ON DELETE CASCADE;

-- Constraints for table `announcement_recipients`
ALTER TABLE announcement_recipients
  ADD CONSTRAINT fk_announcement_recipients FOREIGN KEY (announcement_id) REFERENCES announcements (id) ON DELETE CASCADE,
  ADD CONSTRAINT fk_announcement_recipients_announcement FOREIGN KEY (announcement_id) REFERENCES announcements (id) ON DELETE CASCADE;

-- Constraints for table `documents`
ALTER TABLE documents
  ADD CONSTRAINT fk_documents_department FOREIGN KEY (department_id) REFERENCES departments (id) ON DELETE SET NULL,
  ADD CONSTRAINT fk_documents_student FOREIGN KEY (student_id) REFERENCES students (id) ON DELETE SET NULL;

-- Constraints for table `monitoring`
ALTER TABLE monitoring
  ADD CONSTRAINT fk_monitoring_student FOREIGN KEY (student_id) REFERENCES students (id) ON DELETE CASCADE;

-- Constraints for table `partner_programs`
ALTER TABLE partner_programs
  ADD CONSTRAINT partner_programs_ibfk_1 FOREIGN KEY (partner_id) REFERENCES partners (id),
  ADD CONSTRAINT partner_programs_ibfk_2 FOREIGN KEY (program_id) REFERENCES programs (id);

-- Constraints for table `programs`
ALTER TABLE programs
  ADD CONSTRAINT fk_program_department FOREIGN KEY (department_id) REFERENCES departments (id),
  ADD CONSTRAINT fk_programs_department FOREIGN KEY (department_id) REFERENCES departments (id) ON DELETE CASCADE;

-- Constraints for table `sections`
ALTER TABLE sections
  ADD CONSTRAINT fk_sections_adviser FOREIGN KEY (adviser_id) REFERENCES advisers (id) ON DELETE SET NULL,
  ADD CONSTRAINT fk_sections_department FOREIGN KEY (department_id) REFERENCES departments (id) ON DELETE CASCADE,
  ADD CONSTRAINT fk_sections_program FOREIGN KEY (program_id) REFERENCES programs (id) ON DELETE SET NULL;

-- Constraints for table `section_adviser`
ALTER TABLE section_adviser
  ADD CONSTRAINT fk_section_adviser_adviser FOREIGN KEY (adviser_id) REFERENCES advisers (id) ON DELETE CASCADE,
  ADD CONSTRAINT fk_section_adviser_section FOREIGN KEY (section_id) REFERENCES sections (id) ON DELETE CASCADE;

-- Constraints for table `students`
ALTER TABLE students
  ADD CONSTRAINT fk_students_section FOREIGN KEY (section_id) REFERENCES sections (id) ON DELETE CASCADE;

-- Constraints for table `student_documents`
ALTER TABLE student_documents
  ADD CONSTRAINT fk_student_documents FOREIGN KEY (student_id) REFERENCES students (id) ON DELETE CASCADE;

-- Constraints for table `student_programs`
ALTER TABLE student_programs
  ADD CONSTRAINT fk_student_programs_program FOREIGN KEY (program_id) REFERENCES programs (id) ON DELETE SET NULL,
  ADD CONSTRAINT fk_student_programs_student FOREIGN KEY (student_id) REFERENCES students (id) ON DELETE SET NULL;

-- Constraints for table `users`
ALTER TABLE users
  ADD CONSTRAINT fk_users_department FOREIGN KEY (department_id) REFERENCES departments (id) ON DELETE SET NULL;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
