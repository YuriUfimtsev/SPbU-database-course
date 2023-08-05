SELECT * FROM Pet WHERE Nick = 'Partizan';
SELECT Nick, Breed, Age FROM Pet ORDER BY Age;
SELECT Nick, Breed, Age, Description FROM Pet WHERE Pet.Description IS NOT NULL	
												AND Pet.Description NOT LIKE '';
SELECT AVG(Age) FROM Pet WHERE Breed = 'poodle';
SELECT COUNT(DISTINCT Owner_ID) FROM Pet;

-- ������� ��������, ������� ������� ����� � ��������� (4, 10)
SELECT Nick, Age FROM Pet WHERE Age BETWEEN 4 AND 10;

-- ������� ��������, ��� �������� ������� ��������� ���������� ����� 'crazy'
SELECT Nick, Description FROM Pet WHERE Description  LIKE '%crazy%';

-- ������� �������� ������ ������ ��� ��������
SELECT Nick, Breed FROM Pet WHERE Breed IN('poodle', 'spaniel')