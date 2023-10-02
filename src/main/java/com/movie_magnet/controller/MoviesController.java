package com.movie_magnet.controller;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.*;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.movie_magnet.dto.form.MovieForm;

@RestController
@RequestMapping("/v1/api/movies")
public class MoviesController {

	@PostMapping
	public HttpEntity<MovieForm>create(@RequestBody MovieForm movie){
		MovieForm newMovie=new MovieForm();
		newMovie.add(linkTo(methodOn(MoviesController.class).create(newMovie)).withSelfRel());
		return new ResponseEntity<>(newMovie, HttpStatus.OK);
	}
	
}
