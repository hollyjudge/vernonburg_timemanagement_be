
-- Clear existing data
TRUNCATE time_management_timesheetentry RESTART IDENTITY CASCADE;
TRUNCATE time_management_project RESTART IDENTITY CASCADE;
TRUNCATE time_management_projectcategory RESTART IDENTITY CASCADE;

-- Insert categories into time_management_projectcategory table
INSERT INTO time_management_projectcategory (name, description)
VALUES
('Retainer', NULL),
('General Overhead', NULL),
('Deliverable Based', NULL),
('Business Development', NULL);

-- Insert projects into time_management_project table
INSERT INTO time_management_project (name, category_id, description, created_at, color, owner_id)
SELECT 'AARP', id, 'N/A', NOW(), '#6c63ff', 1 FROM time_management_projectcategory WHERE name = 'Retainer'
UNION ALL
SELECT 'ABC Campaign', id, 'N/A', NOW(), '#49cc90', 1 FROM time_management_projectcategory WHERE name = 'Retainer'
UNION ALL
SELECT 'ABC Project', id, 'N/A', NOW(), '#ff6f61', 1 FROM time_management_projectcategory WHERE name = 'Retainer'
UNION ALL
SELECT 'Affordable Broadband Coalition', id, 'N/A', NOW(), '#BC8F8F', 1 FROM time_management_projectcategory WHERE name = 'Retainer'
UNION ALL
SELECT 'Administrative / Other', id, 'N/A', NOW(), '#F8F8FF', 1 FROM time_management_projectcategory WHERE name = 'General Overhead'
UNION ALL
SELECT 'Mapping', id, 'N/A', NOW(), '#FFEFD5', 1 FROM time_management_projectcategory WHERE name = 'General Overhead'
UNION ALL
SELECT 'Internal Project', id, 'N/A', NOW(), '#00FF00', 1 FROM time_management_projectcategory WHERE name = 'General Overhead'
UNION ALL
SELECT 'Administrative', id, 'N/A', NOW(), '#DDA0DD', 1 FROM time_management_projectcategory WHERE name = 'General Overhead'
UNION ALL
SELECT 'Admin / Other', id, 'N/A', NOW(), '#1E90FF', 1 FROM time_management_projectcategory WHERE name = 'General Overhead'
UNION ALL
SELECT 'Amazon', id, 'N/A', NOW(), '#FFA500', 1 FROM time_management_projectcategory WHERE name = 'Retainer'
UNION ALL
SELECT 'Anthem', id, 'N/A', NOW(), '#F5F5DC', 1 FROM time_management_projectcategory WHERE name = 'Retainer'
UNION ALL
SELECT 'Aristotle', id, 'N/A', NOW(), '#6B8E23', 1 FROM time_management_projectcategory WHERE name = 'Deliverable Based'
UNION ALL
SELECT 'BEAD Tool', id, 'N/A', NOW(), '#000000', 1 FROM time_management_projectcategory WHERE name = 'Business Development'
UNION ALL
SELECT 'Business Development', id, 'N/A', NOW(), '#8A2BE2', 1 FROM time_management_projectcategory WHERE name = 'Business Development'
UNION ALL
SELECT 'Business Development - Other', id, 'N/A', NOW(), '#6495ED', 1 FROM time_management_projectcategory WHERE name = 'Business Development'
UNION ALL
SELECT 'Digital Equity Comments', id, 'N/A', NOW(), '#FF00FF', 1 FROM time_management_projectcategory WHERE name = 'Business Development'
UNION ALL
SELECT 'FL RFP', id, 'N/A', NOW(), '#FFE4C4', 1 FROM time_management_projectcategory WHERE name = 'Business Development'
UNION ALL
SELECT 'MA RFP', id, 'N/A', NOW(), '#FFF5EE', 1 FROM time_management_projectcategory WHERE name = 'Business Development'
UNION ALL
SELECT 'Palau RFP', id, 'N/A', NOW(), '#98FB98', 1 FROM time_management_projectcategory WHERE name = 'Business Development'
UNION ALL
SELECT 'PA RFP', id, 'N/A', NOW(), '#00FFFF', 1 FROM time_management_projectcategory WHERE name = 'Business Development'
UNION ALL
SELECT 'RI Proposal', id, 'N/A', NOW(), '#DEB887', 1 FROM time_management_projectcategory WHERE name = 'Business Development'
UNION ALL
SELECT 'RI RFP', id, 'N/A', NOW(), '#DCDCDC', 1 FROM time_management_projectcategory WHERE name = 'Business Development'
UNION ALL
SELECT 'USTDA - Celltel', id, 'N/A', NOW(), '#FFFFE0', 1 FROM time_management_projectcategory WHERE name = 'Business Development'
UNION ALL
SELECT 'USTDA - CMVas (Pre-Work)', id, 'N/A', NOW(), '#00FA9A', 1 FROM time_management_projectcategory WHERE name = 'Business Development'
UNION ALL
SELECT 'Eurasia RFP', id, 'N/A', NOW(), '#7CFC00', 1 FROM time_management_projectcategory WHERE name = 'Business Development'
UNION ALL
SELECT 'Indo-Pacific RFP', id, 'N/A', NOW(), '#A0522D', 1 FROM time_management_projectcategory WHERE name = 'Business Development'
UNION ALL
SELECT 'MN RFP', id, 'N/A', NOW(), '#B0E0E6', 1 FROM time_management_projectcategory WHERE name = 'Business Development'
UNION ALL
SELECT 'NH Proposal', id, 'N/A', NOW(), '#FAFAD2', 1 FROM time_management_projectcategory WHERE name = 'Business Development'
UNION ALL
SELECT 'Texas BEAD RFP', id, 'N/A', NOW(), '#696969', 1 FROM time_management_projectcategory WHERE name = 'Business Development'
UNION ALL
SELECT 'USTDA - Eurasia', id, 'N/A', NOW(), '#FFFAF0', 1 FROM time_management_projectcategory WHERE name = 'Business Development'
UNION ALL
SELECT 'AZ RFQ', id, 'N/A', NOW(), '#4169E1', 1 FROM time_management_projectcategory WHERE name = 'Business Development'
UNION ALL
SELECT 'USTDA - Ilitha (Pre-Work)', id, 'N/A', NOW(), '#FF1493', 1 FROM time_management_projectcategory WHERE name = 'Business Development'
UNION ALL
SELECT 'USTDA - Poa! (Pre-Work)', id, 'N/A', NOW(), '#2F4F4F', 1 FROM time_management_projectcategory WHERE name = 'Business Development'
UNION ALL
SELECT 'BD - Botswana', id, 'N/A', NOW(), '#00CED1', 1 FROM time_management_projectcategory WHERE name = 'Business Development'
UNION ALL
SELECT 'BD - Texas', id, 'N/A', NOW(), '#FFDAB9', 1 FROM time_management_projectcategory WHERE name = 'Business Development'
UNION ALL
SELECT 'Biz Dev WAW', id, 'N/A', NOW(), '#FAEBD7', 1 FROM time_management_projectcategory WHERE name = 'Business Development'
UNION ALL
SELECT 'CMVas', id, 'N/A', NOW(), '#4B0082', 1 FROM time_management_projectcategory WHERE name = 'Business Development'
UNION ALL
SELECT 'USTDA - Indo-Pacific RFP', id, 'N/A', NOW(), '#8FBC8F', 1 FROM time_management_projectcategory WHERE name = 'Business Development'
UNION ALL
SELECT 'WAW', id, 'N/A', NOW(), '#00BFFF', 1 FROM time_management_projectcategory WHERE name = 'Business Development'
UNION ALL
SELECT 'Kenya RFP', id, 'N/A', NOW(), '#DB7093', 1 FROM time_management_projectcategory WHERE name = 'Business Development'
UNION ALL
SELECT 'USAID Financing Entity', id, 'N/A', NOW(), '#FF6347', 1 FROM time_management_projectcategory WHERE name = 'Deliverable Based'
UNION ALL
SELECT 'USAID C1B', id, 'N/A', NOW(), '#D2B48C', 1 FROM time_management_projectcategory WHERE name = 'Deliverable Based'
UNION ALL
SELECT 'USAID Financing Entity (C1B)', id, 'N/A', NOW(), '#7FFFD4', 1 FROM time_management_projectcategory WHERE name = 'Deliverable Based'
UNION ALL
SELECT 'C1B', id, 'N/A', NOW(), '#DA70D6', 1 FROM time_management_projectcategory WHERE name = 'Deliverable Based'
UNION ALL
SELECT 'Comcast', id, 'N/A', NOW(), '#FF69B4', 1 FROM time_management_projectcategory WHERE name = 'Retainer'
UNION ALL
SELECT 'Comcast - Ad Hoc', id, 'N/A', NOW(), '#FFA07A', 1 FROM time_management_projectcategory WHERE name = 'Retainer'
UNION ALL
SELECT 'Comcast - Deliverable', id, 'N/A', NOW(), '#2F4F4F', 1 FROM time_management_projectcategory WHERE name = 'Retainer'
UNION ALL
SELECT 'DSA', id, 'N/A', NOW(), '#4682B4', 1 FROM time_management_projectcategory WHERE name = 'Deliverable Based'
UNION ALL
SELECT 'Dynamic Spectrum Alliance', id, 'N/A', NOW(), '#0000FF', 1 FROM time_management_projectcategory WHERE name = 'Deliverable Based'
UNION ALL
SELECT 'Dyanmic Spectrum Alliance', id, 'N/A', NOW(), '#9932CC', 1 FROM time_management_projectcategory WHERE name = 'Deliverable Based'
UNION ALL
SELECT 'Emergent', id, 'N/A', NOW(), '#D8BFD8', 1 FROM time_management_projectcategory WHERE name = 'Retainer'
UNION ALL
SELECT 'Emergent Technologies', id, 'N/A', NOW(), '#A9A9A9', 1 FROM time_management_projectcategory WHERE name = 'Retainer'
UNION ALL
SELECT 'Holiday', id, 'N/A', NOW(), '#B8860B', 1 FROM time_management_projectcategory WHERE name = 'General Overhead'
UNION ALL
SELECT 'Federal Holiday', id, 'N/A', NOW(), '#FF8C00', 1 FROM time_management_projectcategory WHERE name = 'General Overhead'
UNION ALL
SELECT 'Team Meeting', id, 'N/A', NOW(), '#FFB6C1', 1 FROM time_management_projectcategory WHERE name = 'General Overhead'
UNION ALL
SELECT 'Internal Meetings', id, 'N/A', NOW(), '#8B4513', 1 FROM time_management_projectcategory WHERE name = 'General Overhead'
UNION ALL
SELECT 'Internal Meetings (Team, 1:1s)', id, 'N/A', NOW(), '#C71585', 1 FROM time_management_projectcategory WHERE name = 'General Overhead'
UNION ALL
SELECT 'ISA/Internex', id, 'N/A', NOW(), '#D2691E', 1 FROM time_management_projectcategory WHERE name = 'Deliverable Based'
UNION ALL
SELECT 'ISA/Internex Colombia', id, 'N/A', NOW(), '#C0C0C0', 1 FROM time_management_projectcategory WHERE name = 'Deliverable Based'
UNION ALL
SELECT 'ISA', id, 'N/A', NOW(), '#F0F8FF', 1 FROM time_management_projectcategory WHERE name = 'Deliverable Based'
UNION ALL
SELECT 'ISA / Internex', id, 'N/A', NOW(), '#FFFFF0', 1 FROM time_management_projectcategory WHERE name = 'Deliverable Based'
UNION ALL
SELECT 'IslandNet', id, 'N/A', NOW(), '#00FF7F', 1 FROM time_management_projectcategory WHERE name = 'Retainer'
UNION ALL
SELECT 'Island.Net', id, 'N/A', NOW(), '#008000', 1 FROM time_management_projectcategory WHERE name = 'Retainer'
UNION ALL
SELECT 'ITU', id, 'N/A', NOW(), '#FFDEAD', 1 FROM time_management_projectcategory WHERE name = 'Deliverable Based'
UNION ALL
SELECT 'ITU Action Blueprint', id, 'N/A', NOW(), '#87CEFA', 1 FROM time_management_projectcategory WHERE name = 'Deliverable Based'
UNION ALL
SELECT 'Mesh++', id, 'N/A', NOW(), '#E9967A', 1 FROM time_management_projectcategory WHERE name = 'Retainer'
UNION ALL
SELECT 'Public Knowledge', id, 'N/A', NOW(), '#FFE4E1', 1 FROM time_management_projectcategory WHERE name = 'Retainer'
UNION ALL
SELECT 'RFL Computer Technology, LLC.', id, 'N/A', NOW(), '#5F9EA0', 1 FROM time_management_projectcategory WHERE name = 'Deliverable Based'
UNION ALL
SELECT 'Coop City', id, 'N/A', NOW(), '#9370DB', 1 FROM time_management_projectcategory WHERE name = 'Deliverable Based'
UNION ALL
SELECT 'RFL Computer Technologies', id, 'N/A', NOW(), '#7FFF00', 1 FROM time_management_projectcategory WHERE name = 'Deliverable Based'
UNION ALL
SELECT 'USAID - Chemonics', id, 'N/A', NOW(), '#FFF0F5', 1 FROM time_management_projectcategory WHERE name = 'Deliverable Based'
UNION ALL
SELECT 'USAID CFDA', id, 'N/A', NOW(), '#9ACD32', 1 FROM time_management_projectcategory WHERE name = 'Deliverable Based'
UNION ALL
SELECT 'USAID', id, 'N/A', NOW(), '#008B8B', 1 FROM time_management_projectcategory WHERE name = 'Deliverable Based'
UNION ALL
SELECT 'USAID - Stadia', id, 'N/A', NOW(), '#778899', 1 FROM time_management_projectcategory WHERE name = 'Deliverable Based'
UNION ALL
SELECT 'USAID - CFDA', id, 'N/A', NOW(), '#FAF0E6', 1 FROM time_management_projectcategory WHERE name = 'Deliverable Based'
UNION ALL
SELECT 'USAID - Chemonics (Pre work)', id, 'N/A', NOW(), '#808000', 1 FROM time_management_projectcategory WHERE name = 'Business Development'
UNION ALL
SELECT 'USAID - CFDA (Pre-Work)', id, 'N/A', NOW(), '#191970', 1 FROM time_management_projectcategory WHERE name = 'Business Development'
UNION ALL
SELECT 'USTDA - AirJaldi', id, 'N/A', NOW(), '#663399', 1 FROM time_management_projectcategory WHERE name = 'Deliverable Based'
UNION ALL
SELECT 'USTDA - CMVAS', id, 'N/A', NOW(), '#CD5C5C', 1 FROM time_management_projectcategory WHERE name = 'Business Development'
UNION ALL
SELECT 'USTDA - Ekovolt', id, 'N/A', NOW(), '#F0FFFF', 1 FROM time_management_projectcategory WHERE name = 'Deliverable Based'
UNION ALL
SELECT 'USTDA - Ilitha', id, 'N/A', NOW(), '#483D8B', 1 FROM time_management_projectcategory WHERE name = 'Deliverable Based'
UNION ALL
SELECT 'USTDA - South Africa (Ilitha)', id, 'N/A', NOW(), '#ADFF2F', 1 FROM time_management_projectcategory WHERE name = 'Deliverable Based'
UNION ALL
SELECT 'USTDA - South Africa', id, 'N/A', NOW(), '#48D1CC', 1 FROM time_management_projectcategory WHERE name = 'Deliverable Based'
UNION ALL
SELECT 'USTDA - South Africa (Pre-Work)', id, 'N/A', NOW(), '#8B0000', 1 FROM time_management_projectcategory WHERE name = 'Business Development'
UNION ALL
SELECT 'USTDA - Mawingu', id, 'N/A', NOW(), '#FFF8DC', 1 FROM time_management_projectcategory WHERE name = 'Deliverable Based'
UNION ALL
SELECT 'USTDA - Poa!', id, 'N/A', NOW(), '#20B2AA', 1 FROM time_management_projectcategory WHERE name = 'Business Development'
UNION ALL
SELECT 'USTDA - Poa! (Pre Work)', id, 'N/A', NOW(), '#6A5ACD', 1 FROM time_management_projectcategory WHERE name = 'Business Development'
UNION ALL
SELECT 'USTDA - Sombha', id, 'N/A', NOW(), '#0000CD', 1 FROM time_management_projectcategory WHERE name = 'Business Development'
UNION ALL
SELECT 'USTDA - Sombha (Pre Work)', id, 'N/A', NOW(), '#FFFACD', 1 FROM time_management_projectcategory WHERE name = 'Business Development'
UNION ALL
SELECT 'USTDA - Vanu', id, 'N/A', NOW(), '#808080', 1 FROM time_management_projectcategory WHERE name = 'Deliverable Based'
UNION ALL
SELECT 'USTDA - Vanu (Pre-Work)', id, 'N/A', NOW(), '#D3D3D3', 1 FROM time_management_projectcategory WHERE name = 'Business Development'
UNION ALL
SELECT 'PTO', id, 'N/A', NOW(), '#FFE4B5', 1 FROM time_management_projectcategory WHERE name = 'General Overhead'
UNION ALL
SELECT 'Sick day', id, 'N/A', NOW(), '#800000', 1 FROM time_management_projectcategory WHERE name = 'General Overhead'
UNION ALL
SELECT 'Sick Leave', id, 'N/A', NOW(), '#A52A2A', 1 FROM time_management_projectcategory WHERE name = 'General Overhead'
UNION ALL
SELECT 'Vacation / Sick', id, 'N/A', NOW(), '#808080', 1 FROM time_management_projectcategory WHERE name = 'General Overhead'
UNION ALL
SELECT 'Vacation', id, 'N/A', NOW(), '#32CD32', 1 FROM time_management_projectcategory WHERE name = 'General Overhead'
UNION ALL
SELECT 'Vacation / PTO', id, 'N/A', NOW(), '#FF7F50', 1 FROM time_management_projectcategory WHERE name = 'General Overhead'
UNION ALL
SELECT 'Bereavement', id, 'N/A', NOW(), '#F0E68C', 1 FROM time_management_projectcategory WHERE name = 'General Overhead'
UNION ALL
SELECT 'Sick', id, 'N/A', NOW(), '#ADD8E6', 1 FROM time_management_projectcategory WHERE name = 'General Overhead'
UNION ALL
SELECT 'Vermont Amendment', id, 'N/A', NOW(), '#F08080', 1 FROM time_management_projectcategory WHERE name = 'Deliverable Based'
UNION ALL
SELECT 'VG Operations', id, 'N/A', NOW(), '#FFEBCD', 1 FROM time_management_projectcategory WHERE name = 'General Overhead'
UNION ALL
SELECT 'Cash Flow', id, 'N/A', NOW(), '#F5F5F5', 1 FROM time_management_projectcategory WHERE name = 'General Overhead'
UNION ALL
SELECT 'VG Ops', id, 'N/A', NOW(), '#F5FFFA', 1 FROM time_management_projectcategory WHERE name = 'General Overhead'
UNION ALL
SELECT 'VP Net', id, 'N/A', NOW(), '#708090', 1 FROM time_management_projectcategory WHERE name = 'Retainer'
UNION ALL
SELECT 'VPNet', id, 'N/A', NOW(), '#AFEEEE', 1 FROM time_management_projectcategory WHERE name = 'Retainer'
UNION ALL
SELECT 'VT Amendment', id, 'N/A', NOW(), '#EEE8AA', 1 FROM time_management_projectcategory WHERE name = 'Deliverable Based'
UNION ALL
SELECT 'VCBB', id, 'N/A', NOW(), '#BA55D3', 1 FROM time_management_projectcategory WHERE name = 'Deliverable Based'
UNION ALL
SELECT 'Vermont - (Pre-Work)', id, 'N/A', NOW(), '#E0FFFF', 1 FROM time_management_projectcategory WHERE name = 'Deliverable Based'
UNION ALL
SELECT 'Vermont Internet for All Plans', id, 'N/A', NOW(), '#CD853F', 1 FROM time_management_projectcategory WHERE name = 'Deliverable Based'
UNION ALL
SELECT 'VT Internet for All', id, 'N/A', NOW(), '#006400', 1 FROM time_management_projectcategory WHERE name = 'Deliverable Based'
UNION ALL
SELECT 'Vermont Project', id, 'N/A', NOW(), '#FFFAFA', 1 FROM time_management_projectcategory WHERE name = 'Deliverable Based'
UNION ALL
SELECT 'VT RFP', id, 'N/A', NOW(), '#7B68EE', 1 FROM time_management_projectcategory WHERE name = 'Deliverable Based'
UNION ALL
SELECT 'Wayfree', id, 'N/A', NOW(), '#DC143C', 1 FROM time_management_projectcategory WHERE name = 'Retainer'
UNION ALL
SELECT 'Wifrost', id, 'N/A', NOW(), '#66CDAA', 1 FROM time_management_projectcategory WHERE name = 'Retainer'
UNION ALL
SELECT 'WISPA', id, 'N/A', NOW(), '#BDB76B', 1 FROM time_management_projectcategory WHERE name = 'Deliverable Based'
UNION ALL
SELECT 'World Mobile', id, 'N/A', NOW(), '#8B008B', 1 FROM time_management_projectcategory WHERE name = 'Retainer';
