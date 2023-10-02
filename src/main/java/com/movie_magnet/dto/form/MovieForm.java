package com.movie_magnet.dto.form;

import org.springframework.hateoas.RepresentationModel;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class MovieForm extends RepresentationModel<MovieForm>{
	private String title;
	private String description;
	private String coverImageUrl;
	private String trailerUrl;
	private Integer actorId;
	private Integer genreId;
	private Integer directorId;
}
