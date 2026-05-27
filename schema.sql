CREATE DATABASE IF NOT EXISTS academiahub;
USE academiahub;

-- Users table
CREATE TABLE IF NOT EXISTS users (
    user_id    INT AUTO_INCREMENT PRIMARY KEY,
    full_name  VARCHAR(100) NOT NULL,
    email      VARCHAR(100) NOT NULL UNIQUE,
    password   VARCHAR(255) NOT NULL,
    role       VARCHAR(20)  NOT NULL DEFAULT 'user',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Courses table
CREATE TABLE IF NOT EXISTS courses (
    course_id   INT AUTO_INCREMENT PRIMARY KEY,
    course_code VARCHAR(20)  NOT NULL,
    course_name VARCHAR(150) NOT NULL,
    instructor  VARCHAR(100) NOT NULL,
    schedule    VARCHAR(100) NOT NULL,
    room        VARCHAR(50)  NOT NULL,
    credits     INT          NOT NULL DEFAULT 3
);

-- Announcements table
CREATE TABLE IF NOT EXISTS announcements (
    announcement_id INT AUTO_INCREMENT PRIMARY KEY,
    title           VARCHAR(200) NOT NULL,
    content         TEXT         NOT NULL,
    posted_by       VARCHAR(100) NOT NULL,
    posted_date     DATE         NOT NULL,
    category        VARCHAR(50)  NOT NULL DEFAULT 'General'
);

-- Sample courses
INSERT INTO courses (course_code, course_name, instructor, schedule, room, credits) VALUES
('CS5003NI', 'Data Structure and Specialist Programming',  'Dr. Raj Sharma',    'Mon/Wed 10:00-11:30', 'Room 201', 4),
('CS5001NI', 'Object Oriented Programming',               'Prof. Anita Thapa',  'Tue/Thu 09:00-10:30', 'Room 105', 4),
('CS5006NI', 'Database Management Systems',               'Dr. Bikash Khadka',  'Mon/Fri 13:00-14:30', 'Room 303', 3),
('CS5008NI', 'Web Technologies',                          'Mr. Suresh Gautam',  'Wed/Fri 11:00-12:30', 'Room 207', 3),
('CS5010NI', 'Software Engineering',                      'Dr. Priya Adhikari', 'Tue/Thu 14:00-15:30', 'Room 102', 3),
('CS5012NI', 'Computer Networks',                         'Prof. Sanjay Joshi', 'Mon/Wed 15:00-16:30', 'Lab 401',  3);

-- Sample announcements
INSERT INTO announcements (title, content, posted_by, posted_date, category) VALUES
('Mid-Term Examination Schedule Released',
 'The mid-term examination schedule for all CS modules has been published. Students are advised to check the timetable on the notice board and prepare accordingly. Any clashes must be reported to the examination office within 48 hours.',
 'Examination Office', '2026-05-20', 'Exam'),

('Assignment Submission Deadline - CS5003NI',
 'Reminder: The 50% Individual Coursework for CS5003NI Data Structure and Specialist Programming is due on April 17, 2026 at 6:00 PM. Late submissions will not be accepted. Submit via MySecondTeacher.',
 'Dr. Raj Sharma', '2026-05-18', 'Academic'),

('Campus Wi-Fi Maintenance',
 'The campus Wi-Fi network will undergo scheduled maintenance on Saturday May 30 from 10:00 PM to 2:00 AM. Students are advised to plan their work accordingly.',
 'IT Department', '2026-05-15', 'General'),

('End of Year Celebration Event',
 'The annual end of year celebration will be held on June 15, 2026 in the main hall. All students and faculty are welcome. Food and refreshments will be provided. Register at the reception desk.',
 'Student Affairs', '2026-05-10', 'Event'),

('Library Extended Hours During Exam Period',
 'The college library will remain open until 10:00 PM on weekdays during the examination period from May 25 to June 10. Weekend hours are 9:00 AM to 6:00 PM.',
 'Library Services', '2026-05-08', 'Academic');
