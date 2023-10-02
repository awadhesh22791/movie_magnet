package com.movie_magnet.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.movie_magnet.entity.Genre;

public interface GenresRepository extends JpaRepository<Genre, Integer> {

}
