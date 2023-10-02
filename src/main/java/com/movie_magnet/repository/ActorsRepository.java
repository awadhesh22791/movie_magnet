package com.movie_magnet.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.movie_magnet.entity.Actor;

public interface ActorsRepository extends JpaRepository<Actor, Integer> {

}
