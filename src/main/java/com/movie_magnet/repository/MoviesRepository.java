package com.movie_magnet.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.movie_magnet.entity.Movie;

public interface MoviesRepository extends JpaRepository<Movie, Integer> {

}
