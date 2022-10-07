package com.fivelight.domain;

import java.sql.Date;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Feedback {
	private int feed_num;
	
	private String nickname;
	
	private String ex_name ;
	
	private float accuracy;
	
	private Date feed_date;
	
	private String feed_con;	
}