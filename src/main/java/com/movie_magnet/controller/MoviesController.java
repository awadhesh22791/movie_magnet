package com.movie_magnet.controller;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.hateoas.PagedModel;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.movie_magnet.dto.MovieList;
import com.movie_magnet.dto.form.MovieForm;
import com.movie_magnet.service.MovieService;

@RestController
@RequestMapping("/v1/api/movies")
public class MoviesController {

	@Autowired
	private MovieService movieService;
	
	@PostMapping
	public HttpEntity<MovieForm>create(@RequestBody MovieForm movie){
		MovieForm newMovie=new MovieForm();
		movieService.save(movie);
		newMovie.add(linkTo(methodOn(MoviesController.class).create(newMovie)).withSelfRel());
		return new ResponseEntity<>(newMovie, HttpStatus.OK);
	}
	
	@GetMapping
	public HttpEntity<MovieForm>list(PageRequest page){
		// PagedModel<MovieList> https://howtodoinjava.com/spring/hateoas-pagination-links/
		return new ResponseEntity<>(null, HttpStatus.OK);
	}
	
}
