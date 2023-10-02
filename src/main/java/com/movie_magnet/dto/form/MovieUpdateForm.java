package com.movie_magnet.dto.form;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class MovieUpdateForm extends MovieForm{
	private Integer id;
}
