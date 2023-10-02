package com.movie_magnet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import com.movie_magnet.entity.MovieDirector;

@RepositoryRestResource(exported = false)
public interface MovieDirectorsRepository extends JpaRepository<MovieDirector, Integer> {

}
