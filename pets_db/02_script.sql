SELECT * FROM Pet WHERE Nick = 'Partizan';
SELECT Nick, Breed, Age FROM Pet ORDER BY Age;
SELECT Nick, Breed, Age, Description FROM Pet WHERE Pet.Description IS NOT NULL	
												AND Pet.Description NOT LIKE '';
SELECT AVG(Age) FROM Pet WHERE Breed = 'poodle';
SELECT COUNT(DISTINCT Owner_ID) FROM Pet;

-- Найдите питомцев, возраст которых лежит в интервале (4, 10)
SELECT Nick, Age FROM Pet WHERE Age BETWEEN 4 AND 10;

-- Найдите питомцев, при описании которых владельцы используют слово 'crazy'
SELECT Nick, Description FROM Pet WHERE Description  LIKE '%crazy%';

-- Найдите питомцев породы пудель или спаниель
SELECT Nick, Breed FROM Pet WHERE Breed IN('poodle', 'spaniel')