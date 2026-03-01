-- selecionar tabela pacientes
SELECT * FROM pacientes;

-- selecionar consultas por ordem descendente data
SELECT * FROM consultas 
ORDER BY data_consulta DESC;

-- selecionar consultas por paciente, medico e diagnostico
SELECT 
    pacientes.nome, 
    medicos.nome, 
    consultas.data_consulta, 
    consultas.diagnostico
FROM consultas
JOIN pacientes ON consultas.paciente_id = pacientes.paciente_id
JOIN medicos ON consultas.medico_id = medicos.medico_id;


-- total faturado por médico
SELECT m.nome,
       SUM(c.valor_consulta) AS faturacao_total
FROM consultas c
JOIN medicos m ON c.medico_id = m.medico_id
GROUP BY m.nome
ORDER BY faturacao_total DESC;


-- Número de consultas por paciente
SELECT p.nome,
       COUNT(c.consulta_id) AS total_consultas
FROM pacientes p
LEFT JOIN consultas c ON p.paciente_id = c.paciente_id
GROUP BY p.nome
ORDER BY total_consultas DESC;

