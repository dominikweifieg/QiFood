select c.id, c.title, c.pro_identifier, c.pro_start_day, u.first_name, u.name, l.street, l.number, l.additional1, l.additional2, l.zip, l.city, l.state, l.country 
	from consultations as c 
	left join users as u on c.user_id = u.id 
	left join locations as l on l.locatable_id = c.id 
	where l.locatable_type = 'Consultation' and c.pro = 't';
	
select e.id, e.title, e.reference_number, u.first_name, u.name, l.street, l.number, l.additional1, l.additional2, l.zip, l.city, l.state, l.country from events as e 
	left join users as u on e.user_id = u.id 
	left join locations as l on l.locatable_id = u.id 
	where l.locatable_type = 'User' and e.commercial = 't';
	
select e.id, e.title, e.reference_number, c.title, u.first_name, u.name, l.street, l.number, l.additional1, l.additional2, l.zip, l.city, l.state, l.country from events as e 
	left join consultations as c on e.consultation_id = c.id 
	left join users as u on c.user_id = u.id 
	left join locations as l on l.locatable_id = c.id 
	where l.locatable_type = 'Consultation' and e.commercial = 't';