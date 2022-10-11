package com.fivelight.domain;

import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Ranking {
	private int rank_num;
	
	private String nickname;
	
	private String ex_name;
	
	private float rank_acc;
	
	private LocalDateTime rank_date;	
}