package com.movie_magnet.dto;

import org.springframework.hateoas.PagedModel;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class MovieList extends PagedModel<MovieList>{
	private Integer id;
	private String title;
}
