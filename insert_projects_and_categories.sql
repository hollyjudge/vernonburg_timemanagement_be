-- Clear existing data
TRUNCATE time_management_timesheetentry RESTART IDENTITY CASCADE;
TRUNCATE time_management_project RESTART IDENTITY CASCADE;
TRUNCATE time_management_projectcategory RESTART IDENTITY CASCADE;
TRUNCATE time_management_projecttask RESTART IDENTITY CASCADE;

-- Insert categories into time_management_projectcategory table
INSERT INTO time_management_projectcategory (main_category, sub_category)
VALUES
('Admin / Overhead', 'Administrative / Other'),
('Retainer', 'Retainer-Based'),
('Business Development', 'Business Development - U.S. Based'),
('Business Development', 'Business Development - USTDA'),
('Business Development', 'Business Development - International'),
('Deliverable-Based', 'C1B'),
('Deliverable-Based', 'ITU'),
('Deliverable-Based', 'RFL Computer Technology, LLC.'),
('Deliverable-Based', 'USTDA');

-- Insert projects into time_management_project table
INSERT INTO time_management_project (name, category_id, description, created_at, color, owner_id, is_active)
SELECT 'Administrative / Other', id, 'N/A', NOW(), '#F8F8FF', 1, FALSE FROM time_management_projectcategory WHERE main_category = 'Admin / Overhead' AND sub_category = 'Administrative / Other'
UNION ALL
SELECT 'Bereavement', id, 'N/A', NOW(), '#F0E68C', 1, FALSE FROM time_management_projectcategory WHERE main_category = 'Admin / Overhead' AND sub_category = 'Administrative / Other'
UNION ALL
SELECT 'Internal Meetings (Team, 1:1s)', id, 'N/A', NOW(), '#8B4513', 1, FALSE FROM time_management_projectcategory WHERE main_category = 'Admin / Overhead' AND sub_category = 'Administrative / Other'
UNION ALL
SELECT 'PTO', id, 'N/A', NOW(), '#FFE4B5', 1, FALSE FROM time_management_projectcategory WHERE main_category = 'Admin / Overhead' AND sub_category = 'Administrative / Other'
UNION ALL
SELECT 'Sick / Personal', id, 'N/A', NOW(), '#A52A2A', 1, FALSE FROM time_management_projectcategory WHERE main_category = 'Admin / Overhead' AND sub_category = 'Administrative / Other'
UNION ALL
SELECT 'VG Holiday', id, 'N/A', NOW(), '#FFD700', 1, FALSE FROM time_management_projectcategory WHERE main_category = 'Admin / Overhead' AND sub_category = 'Administrative / Other'
UNION ALL
SELECT 'VG Operations', id, 'N/A', NOW(), '#F5FFFA', 1, FALSE FROM time_management_projectcategory WHERE main_category = 'Admin / Overhead' AND sub_category = 'Administrative / Other'
UNION ALL
SELECT 'AARP', id, 'N/A', NOW(), '#6c63ff', 1, FALSE FROM time_management_projectcategory WHERE main_category = 'Retainer' AND sub_category = 'Retainer-Based'
UNION ALL
SELECT 'Amazon', id, 'N/A', NOW(), '#FFA500', 1, FALSE FROM time_management_projectcategory WHERE main_category = 'Retainer' AND sub_category = 'Retainer-Based'
UNION ALL
SELECT 'Aqualinq', id, 'N/A', NOW(), '#00FFFF', 1, FALSE FROM time_management_projectcategory WHERE main_category = 'Retainer' AND sub_category = 'Retainer-Based'
UNION ALL
SELECT 'Comcast', id, 'N/A', NOW(), '#ff6f61', 1, FALSE FROM time_management_projectcategory WHERE main_category = 'Retainer' AND sub_category = 'Retainer-Based'
UNION ALL
SELECT 'G2', id, 'N/A', NOW(), '#4682B4', 1, FALSE FROM time_management_projectcategory WHERE main_category = 'Retainer' AND sub_category = 'Retainer-Based'
UNION ALL
SELECT 'VPNet', id, 'N/A', NOW(), '#AFEEEE', 1, FALSE FROM time_management_projectcategory WHERE main_category = 'Retainer' AND sub_category = 'Retainer-Based'
UNION ALL
SELECT 'BEAD Tool', id, 'N/A', NOW(), '#49cc90', 1, FALSE FROM time_management_projectcategory WHERE main_category = 'Business Development' AND sub_category = 'Business Development - U.S. Based'
UNION ALL
SELECT 'USTDA - CMVas (Business Dev)', id, 'N/A', NOW(), '#00FF7F', 1, FALSE FROM time_management_projectcategory WHERE main_category = 'Business Development' AND sub_category = 'Business Development - USTDA'
UNION ALL
SELECT 'USTDA - ISA (Business Dev)', id, 'N/A', NOW(), '#9932CC', 1, FALSE FROM time_management_projectcategory WHERE main_category = 'Business Development' AND sub_category = 'Business Development - USTDA'
UNION ALL
SELECT 'USTDA - Sombha (Business Dev)', id, 'N/A', NOW(), '#9370DB', 1, FALSE FROM time_management_projectcategory WHERE main_category = 'Business Development' AND sub_category = 'Business Development - USTDA'
UNION ALL
SELECT 'USTDA - Vanu (Business Dev)', id, 'N/A', NOW(), '#8B0000', 1, FALSE FROM time_management_projectcategory WHERE main_category = 'Business Development' AND sub_category = 'Business Development - USTDA'
UNION ALL
SELECT 'USTDA - WAW (Business Dev)', id, 'N/A', NOW(), '#4B0082', 1, FALSE FROM time_management_projectcategory WHERE main_category = 'Business Development' AND sub_category = 'Business Development - USTDA'
UNION ALL
SELECT 'Wayfree', id, 'N/A', NOW(), '#FF4500', 1, FALSE FROM time_management_projectcategory WHERE main_category = 'Business Development' AND sub_category = 'Business Development - International'
UNION ALL
SELECT 'Wifrost', id, 'N/A', NOW(), '#2E8B57', 1, FALSE FROM time_management_projectcategory WHERE main_category = 'Business Development' AND sub_category = 'Business Development - International'
UNION ALL
SELECT 'C1B', id, 'N/A', NOW(), '#DA70D6', 1, TRUE FROM time_management_projectcategory WHERE main_category = 'Deliverable-Based' AND sub_category = 'C1B'
UNION ALL
SELECT 'ITU', id, 'N/A', NOW(), '#8A2BE2', 1, FALSE FROM time_management_projectcategory WHERE main_category = 'Deliverable-Based' AND sub_category = 'ITU'
UNION ALL
SELECT 'RFL Computer Technology, LLC.', id, 'N/A', NOW(), '#32CD32', 1, FALSE FROM time_management_projectcategory WHERE main_category = 'Deliverable-Based' AND sub_category = 'RFL Computer Technology, LLC.'
UNION ALL
SELECT 'USTDA - AirJaldi', id, 'N/A', NOW(), '#663399', 1, TRUE FROM time_management_projectcategory WHERE main_category = 'Deliverable-Based' AND sub_category = 'USTDA'
UNION ALL
SELECT 'USTDA - Ekovolt', id, 'N/A', NOW(), '#F0FFFF', 1, TRUE FROM time_management_projectcategory WHERE main_category = 'Deliverable-Based' AND sub_category = 'USTDA'
UNION ALL
SELECT 'USTDA - Ilitha', id, 'N/A', NOW(), '#483D8B', 1, TRUE FROM time_management_projectcategory WHERE main_category = 'Deliverable-Based' AND sub_category = 'USTDA';

-- Insert tasks into time_management_projecttask table
INSERT INTO time_management_projecttask (project_id, task_name, description)
SELECT id, 'Project Kickoff & Management', NULL FROM time_management_project WHERE name = 'USTDA - Ekovolt'
UNION ALL
SELECT id, 'Proof of Concept (POC) Network Planning', NULL FROM time_management_project WHERE name = 'USTDA - Ekovolt'
UNION ALL
SELECT id, 'Network Management & POC Deployment', NULL FROM time_management_project WHERE name = 'USTDA - Ekovolt'
UNION ALL
SELECT id, 'Technical Analysis', NULL FROM time_management_project WHERE name = 'USTDA - Ekovolt'
UNION ALL
SELECT id, 'Market Research, Sizing & Forecast', NULL FROM time_management_project WHERE name = 'USTDA - Ekovolt'
UNION ALL
SELECT id, 'Human Resources Review', NULL FROM time_management_project WHERE name = 'USTDA - Ekovolt'
UNION ALL
SELECT id, 'Economic Analysis', NULL FROM time_management_project WHERE name = 'USTDA - Ekovolt'
UNION ALL
SELECT id, 'Financing Plan', NULL FROM time_management_project WHERE name = 'USTDA - Ekovolt'
UNION ALL
SELECT id, 'Preliminary Environmental and Social Impact Assessment', NULL FROM time_management_project WHERE name = 'USTDA - Ekovolt'
UNION ALL
SELECT id, 'Regulatory, Licensing, & Legal Framework', NULL FROM time_management_project WHERE name = 'USTDA - Ekovolt'
UNION ALL
SELECT id, 'Developmental Impact Assessment', NULL FROM time_management_project WHERE name = 'USTDA - Ekovolt'
UNION ALL
SELECT id, 'U.S. Sources of Supply Analysis', NULL FROM time_management_project WHERE name = 'USTDA - Ekovolt'
UNION ALL
SELECT id, 'Project Implementation Plan', NULL FROM time_management_project WHERE name = 'USTDA - Ekovolt'
UNION ALL
SELECT id, 'Final Report', NULL FROM time_management_project WHERE name = 'USTDA - Ekovolt'
UNION ALL
SELECT id, 'Project Kickoff & Management', NULL FROM time_management_project WHERE name = 'USTDA - AirJaldi'
UNION ALL
SELECT id, 'Situation Assessment', NULL FROM time_management_project WHERE name = 'USTDA - AirJaldi'
UNION ALL
SELECT id, 'Market Analysis', NULL FROM time_management_project WHERE name = 'USTDA - AirJaldi'
UNION ALL
SELECT id, 'Supply and Demand Side Analysis', NULL FROM time_management_project WHERE name = 'USTDA - AirJaldi'
UNION ALL
SELECT id, 'Human Resources Review', NULL FROM time_management_project WHERE name = 'USTDA - AirJaldi'
UNION ALL
SELECT id, 'Technical Assessment', NULL FROM time_management_project WHERE name = 'USTDA - AirJaldi'
UNION ALL
SELECT id, 'Scalable Marketing Plan', NULL FROM time_management_project WHERE name = 'USTDA - AirJaldi'
UNION ALL
SELECT id, 'Economic Analysis', NULL FROM time_management_project WHERE name = 'USTDA - AirJaldi'
UNION ALL
SELECT id, 'Financing Plan', NULL FROM time_management_project WHERE name = 'USTDA - AirJaldi'
UNION ALL
SELECT id, 'Preliminary Environmental and Social Impact Assessment', NULL FROM time_management_project WHERE name = 'USTDA - AirJaldi'
UNION ALL
SELECT id, 'Regulatory, Licensing, & Legal Framework', NULL FROM time_management_project WHERE name = 'USTDA - AirJaldi'
UNION ALL
SELECT id, 'Developmental Impact Assessment', NULL FROM time_management_project WHERE name = 'USTDA - AirJaldi'
UNION ALL
SELECT id, 'U.S. Sources of Supply Analysis', NULL FROM time_management_project WHERE name = 'USTDA - AirJaldi'
UNION ALL
SELECT id, 'Project Implementation Plan', NULL FROM time_management_project WHERE name = 'USTDA - AirJaldi'
UNION ALL
SELECT id, 'Final Report', NULL FROM time_management_project WHERE name = 'USTDA - AirJaldi'
UNION ALL
SELECT id, 'Kickoff Meeting and Work Plan Finalization', NULL FROM time_management_project WHERE name = 'USTDA - Ilitha'
UNION ALL
SELECT id, 'Situation Assessment', NULL FROM time_management_project WHERE name = 'USTDA - Ilitha'
UNION ALL
SELECT id, 'Pilot Marketing and Sales Plan', NULL FROM time_management_project WHERE name = 'USTDA - Ilitha'
UNION ALL
SELECT id, 'Pilot Network Planning', NULL FROM time_management_project WHERE name = 'USTDA - Ilitha'
UNION ALL
SELECT id, 'Pilot Network Deployment and Monitoring', NULL FROM time_management_project WHERE name = 'USTDA - Ilitha'
UNION ALL
SELECT id, 'Technical Assessment', NULL FROM time_management_project WHERE name = 'USTDA - Ilitha'
UNION ALL
SELECT id, 'Sales Strategy', NULL FROM time_management_project WHERE name = 'USTDA - Ilitha'
UNION ALL
SELECT id, 'Market Analysis', NULL FROM time_management_project WHERE name = 'USTDA - Ilitha'
UNION ALL
SELECT id, 'Economic Analysis', NULL FROM time_management_project WHERE name = 'USTDA - Ilitha'
UNION ALL
SELECT id, 'Financing Plan', NULL FROM time_management_project WHERE name = 'USTDA - Ilitha'
UNION ALL
SELECT id, 'Human Resources Review', NULL FROM time_management_project WHERE name = 'USTDA - Ilitha'
UNION ALL
SELECT id, 'Legal and Regulatory Assessment', NULL FROM time_management_project WHERE name = 'USTDA - Ilitha'
UNION ALL
SELECT id, 'Preliminary Environmental and Social Impact Assessment', NULL FROM time_management_project WHERE name = 'USTDA - Ilitha'
UNION ALL
SELECT id, 'Developmental Impact Assessment', NULL FROM time_management_project WHERE name = 'USTDA - Ilitha'
UNION ALL
SELECT id, 'U.S. Sources of Supply Analysis', NULL FROM time_management_project WHERE name = 'USTDA - Ilitha'
UNION ALL
SELECT id, 'Project Implementation Plan and Final Presentation', NULL FROM time_management_project WHERE name = 'USTDA - Ilitha'
UNION ALL
SELECT id, 'Final Report', NULL FROM time_management_project WHERE name = 'USTDA - Ilitha'
UNION ALL
SELECT id, 'Work Plan', NULL FROM time_management_project WHERE name = 'C1B'
UNION ALL
SELECT id, 'Staffing Plan', NULL FROM time_management_project WHERE name = 'C1B'
UNION ALL
SELECT id, 'Fund Manager Selection', NULL FROM time_management_project WHERE name = 'C1B'
UNION ALL
SELECT id, 'Legal Structure', NULL FROM time_management_project WHERE name = 'C1B'
UNION ALL
SELECT id, 'First TA and Concessional Capital', NULL FROM time_management_project WHERE name = 'C1B'
UNION ALL
SELECT id, 'Fund and Fundraising Materials', NULL FROM time_management_project WHERE name = 'C1B'
UNION ALL
SELECT id, 'Entity Setup and Two LOIs', NULL FROM time_management_project WHERE name = 'C1B'
UNION ALL
SELECT id, 'Status Report', NULL FROM time_management_project WHERE name = 'C1B';