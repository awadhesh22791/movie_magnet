package com.movie_magnet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import com.movie_magnet.entity.MovieActor;

@RepositoryRestResource(exported = false)
public interface MovieActorsRepository extends JpaRepository<MovieActor, Integer> {

}
