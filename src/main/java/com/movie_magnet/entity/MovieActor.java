package com.movie_magnet.entity;
// Generated 01-Oct-2023, 2:34:46 pm by Hibernate Tools 3.2.2.GA

import java.util.Date;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import static jakarta.persistence.GenerationType.IDENTITY;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import jakarta.persistence.UniqueConstraint;

/**
 * MovieActors generated by hbm2java
 */
@Entity
@Table(name = "movie_actors", uniqueConstraints = @UniqueConstraint(columnNames = { "movie_id", "actor_id" }))
public class MovieActor implements java.io.Serializable {

	private static final long serialVersionUID = 1845138290390876785L;
	private Integer id;
	private Actor actors;
	private Movie movies;
	private Date createdAt;
	private Date updatedAt;

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "actor_id", nullable = false)
	public Actor getActors() {
		return this.actors;
	}

	public void setActors(Actor actors) {
		this.actors = actors;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "movie_id", nullable = false)
	public Movie getMovies() {
		return this.movies;
	}

	public void setMovies(Movie movies) {
		this.movies = movies;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "created_at", nullable = false, length = 19)
	@CreationTimestamp
	public Date getCreatedAt() {
		return this.createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "updated_at", nullable = false, length = 19)
	@UpdateTimestamp
	public Date getUpdatedAt() {
		return this.updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

}
