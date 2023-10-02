package com.movie_magnet.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.movie_magnet.entity.Director;

public interface DirectorsRepository extends JpaRepository<Director, Integer> {

}
