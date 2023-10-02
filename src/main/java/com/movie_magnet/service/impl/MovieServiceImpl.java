package com.movie_magnet.service.impl;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.movie_magnet.dto.form.MovieForm;
import com.movie_magnet.entity.Actor;
import com.movie_magnet.entity.Movie;
import com.movie_magnet.entity.MovieActor;
import com.movie_magnet.entity.MovieDirector;
import com.movie_magnet.repository.ActorsRepository;
import com.movie_magnet.repository.DirectorsRepository;
import com.movie_magnet.repository.GenresRepository;
import com.movie_magnet.repository.MovieActorsRepository;
import com.movie_magnet.repository.MovieDirectorsRepository;
import com.movie_magnet.repository.MoviesRepository;
import com.movie_magnet.service.MovieService;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class MovieServiceImpl implements MovieService {

	@Autowired
	private MoviesRepository moviesRepository;
	@Autowired
	private ActorsRepository actorsRepository;
	@Autowired
	private DirectorsRepository directorsRepository;
	@Autowired
	private MovieActorsRepository movieActorsRepository;
	@Autowired
	private MovieDirectorsRepository movieDirectorsRepository;
	@Autowired
	private GenresRepository genresRepository;
	
	@Override
	@Transactional(readOnly = false)
	public void save(MovieForm movie) {
		Movie movieToSave=new Movie();
		movieToSave.parse(movie);
		genresRepository.findById(movie.getGenre()).ifPresentOrElse(genre->{
			movieToSave.setGenres(genre);
			moviesRepository.save(movieToSave);
			saveMovieActors(movieToSave,movie.getActors());
			saveMovieDirectors(movieToSave,movie.getDirectors());
		}, ()->log.info("Genre not available for id {}.",movie.getGenre()));
	}

	private void saveMovieDirectors(Movie movieToSave, Integer[] directors) {
		for(int i=0;i<directors.length;i++) {
			Integer directorId=directors[i];
			directorsRepository.findById(directorId).ifPresentOrElse(director->{
				MovieDirector movieDirector=new MovieDirector(movieToSave,director);
				movieDirectorsRepository.save(movieDirector);
			}, ()->log.info("Director not available for id {}.",directorId));
		}
	}

	private void saveMovieActors(Movie movieToSave, Integer[] actors) {
		for(int i=0;i<actors.length;i++) {
			Integer actorId=actors[i];
			Optional<Actor> movieActor = actorsRepository.findById(actorId);
			movieActor.ifPresentOrElse(actor->{
				MovieActor movieActorDetail=new MovieActor(movieToSave,actor);
				movieActorsRepository.save(movieActorDetail);
			}, ()->log.info("Actor not available with id {}.",actorId));
		}
	}

}
